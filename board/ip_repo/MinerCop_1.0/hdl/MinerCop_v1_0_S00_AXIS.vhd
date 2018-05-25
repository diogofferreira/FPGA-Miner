library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.sha256_functions.all;

entity MinerCop_v1_0_S00_AXIS is
	generic (
		-- Users to add parameters here
        MESSAGE_LENGTH          : integer   := 3*8;
		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- AXI4Stream sink: Data Width
		C_S_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
		
        -- valid data the cycle after the address has changed:
        -- Intermediate/final hash values:
        hash_output : out std_logic_vector(255 downto 0);

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- AXI4Stream sink: Clock
		S_AXIS_ACLK	: in std_logic;
		-- AXI4Stream sink: Reset
		S_AXIS_ARESETN	: in std_logic;
		-- Ready to accept data in
		S_AXIS_TREADY	: out std_logic;
		-- Data in
		S_AXIS_TDATA	: in std_logic_vector(C_S_AXIS_TDATA_WIDTH-1 downto 0);
		-- Byte qualifier
		S_AXIS_TSTRB	: in std_logic_vector((C_S_AXIS_TDATA_WIDTH/8)-1 downto 0);
		-- Indicates boundary of last packet
		S_AXIS_TLAST	: in std_logic;
		-- Data is in valid
		S_AXIS_TVALID	: in std_logic
	);
end MinerCop_v1_0_S00_AXIS;

architecture Behavioral of MinerCop_v1_0_S00_AXIS is
    signal s_validOut : std_logic;
    signal s_dataOut  : std_logic_vector(255 downto 0); 
    signal s_ready, s_hashReady    : std_logic;
    signal s_hashInputWord : std_logic_vector(MESSAGE_LENGTH-1 downto 0);
    
    -- Nonce
    -- TODO: CHECK NONCE BITS NUMBER
    signal s_nonce: integer;
    
    -- Start processing the next block
    signal s_update : std_logic;
    signal s_hash : std_logic_vector(255 downto 0); 
    
    signal Hashes : std_logic_vector( 255 downto 0 ) := ( others => '0' ); -- A generic 256-bit register. Holds H(7-0) values.
    signal W : wordArray;
    signal a, b, c, d, e, f, g, h : std_logic_vector( 31 downto 0 ); -- Working registers.
    -- A N x 512-bit array which holds every block of the padded message.
    signal M : BlockM ((kCalculator(MESSAGE_LENGTH) + MESSAGE_LENGTH + 1 + 64 )/ 512 - 1 downto 0 ) := ( (others => ( others => '0' ) ) );
    signal init, ready, padded, schedulled, hashed : std_logic := '0';  -- Main process flags.
    -- Main hashing process  
    
begin    
    process(S_AXIS_ACLK)
    begin
        if (rising_edge (S_AXIS_ACLK)) then
            if (S_AXIS_ARESETN = '0') then
               s_validOut <= '0';
               s_dataOut  <= (others => '0');
            elsif (S_AXIS_TVALID = '1') then
               if (s_ready = '1') then
                    s_dataOut  <= s_hash;
               end if;             
            end if;
        end if;
    end process;
    
    ------------------------------------------------
    -----           Miner code                ------
    ------------------------------------------------

    hasher: process(S_AXIS_ACLK, S_AXIS_ARESETN)
        variable i, t, hashIt : integer := 0; -- Iterators.
        variable N : integer := 0; -- Holds total number of Message blocks.
        variable T1, T2 : std_logic_vector( 31 downto 0 ); -- Hold temporary values.
    begin
        if (S_AXIS_ARESETN = '0') then -- Asychronous reset (positive logic).
            initializeH( Hashes, constHashes ); -- Reset initial hash values.
            s_hash <= (others =>'0'); -- Clear Output.
            -- Reset flags.
            ready <= '0'; 
            init <= '1';
        elsif (rising_edge(S_AXIS_ACLK )) then
            -- If diggest is not estimated yet and input message is not padded.
            if (ready = '0' and padded = '0') then
                N := (kCalculator(MESSAGE_LENGTH) + MESSAGE_LENGTH + 1 + 64)/512; -- Count total (512-bit) blocks in the padded message.
                M <= messagePadding (s_hashInputWord, MESSAGE_LENGTH); -- Get padded message to M(N) blocks.
                i := 0; -- Clear M block's pointer.
                padded <= '1'; -- Update current flag.
                -- If diggest is not estimated yet and padded message is not schedulled for the i'th message block.
            elsif (ready = '0' and padded = '1' and schedulled = '0') then
                -- Prepare the message schedule.
                if (t >= 0 and t <= 15) then 
                    W(15 - t) <= M (i) (((32*(t + 1)) - 1) downto (32*t));
                elsif (t >= 16 and t <= 63) then
                    W(t) <= std_logic_vector(unsigned(sigma1(W(t - 2))) + unsigned(W(t - 7)) + unsigned(sigma0(W(t - 15))) + unsigned(W(t - 16)));
                else
                    schedulled <= '1'; -- Update current flag.
                    initializeWork(a, b, c ,d, e, f, g, h, Hashes); -- Initialize working registers.
                    hashIt := 0; -- Set hash iterator to 0.
                    hashed <= '0'; -- Update hash flag.
                end if;
                t := t + 1; 
            -- If current M block has not been hashed.
            elsif (ready = '0' and padded = '1' and schedulled = '1' and hashed = '0') then                 
                if hashIt < 64 then
                    -- The current M block is hashed as defined in 6.2.2.
                    T1 := std_logic_vector(unsigned(h) + unsigned(capSigma1(e)) + unsigned(ch( e, f, g )) + unsigned(constK( hashIt )) + unsigned(W(hashIt)));
                    T2 := std_logic_vector(unsigned(maj(a, b, c)) + unsigned(capSigma0(a)));
                    h <= g;
                    g <= f;
                    f <= e;
                    e <= std_logic_vector(unsigned(d) + unsigned(T1));
                    d <= c;
                    c <= b;
                    b <= a;
                    a <= std_logic_vector(unsigned(T1) + unsigned(T2));
                    hashIt := hashIt + 1; -- Increase hash iterator.
                else
                    hashed <= '1'; -- Update current flag.
                end if;
            -- Check for remaining M blocks to be hashed.
            elsif (ready = '0' and padded = '1' and schedulled = '1' and hashed = '1') then
                updateHashes(Hashes, a, b, c ,d, e, f, g, h); -- Update hash register values.
                if (i + 1 < N) then 
                    i := i + 1; -- Point to next Message block.
                    t := 0; -- Clear schedulle iterator.
                    schedulled <= '0'; -- Update Schedulle flag. 
                else -- All Message block have been hashed.
                    ready <= '1'; -- Update ready flag.
                end if;
            -- Hash process is over.
            else
                -- Update output register with the final hash value.
                s_hash <= setDigest (Hashes);
            end if;     
        end if;
    end process hasher;
    
    miner: process(S_AXIS_ACLK, ready)
    begin
        if (ready = '1') then
            -- TODO: GENERALIZE NUMBER OS 0'S
            if (s_hash(255 downto 253) = X"00") then
                s_ready <= '1';
                s_update <= '0';
            else
                s_nonce <= s_nonce + 1;
                -- TODO: CHECK NONCE BITS NUMBER
                s_hashInputWord <= S_AXIS_TDATA & std_logic_vector(to_unsigned(s_nonce, 32));
                s_update <= '1';
            end if;
        end if;
    end process miner;

    hash_output <= s_dataOut;
    S_AXIS_TREADY <= s_ready;
end Behavioral;
