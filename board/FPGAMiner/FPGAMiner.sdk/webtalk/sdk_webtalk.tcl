webtalk_init -webtalk_dir /home/pbm/Documents/UA/4_year/cr/EthernetTest/EthernetTest.sdk/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "2018-05-03 22:08:48" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2017.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2017.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "77e5m4qnga0ebv6vpbbtcqd1vu" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2017.4_6" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "6" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Arch" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Arch Linux" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-4278U CPU @ 2.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2393.770 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "16.728 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1525380938000" -context "sdk\\\\bsp/1525380938000"
webtalk_add_data -client sdk -key hwid -value "1525375252000" -context "sdk\\\\bsp/1525380938000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\bsp/1525380938000"
webtalk_add_data -client sdk -key apptemplate -value "lwip_echo_server" -context "sdk\\\\bsp/1525380938000"
webtalk_add_data -client sdk -key RecordType -value "BSPCreation" -context "sdk\\\\bsp/1525380938000"
webtalk_add_data -client sdk -key uid -value "1525380939000" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key hwid -value "1525375252000" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key bspid -value "1525380938000" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key newbsp -value "true" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key apptemplate -value "lwip_echo_server" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key RecordType -value "APPCreation" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key LangUsed -value "C" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key Procused -value "microblaze" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key projSize -value "256.078125" -context "sdk\\\\application/1525380939000"
webtalk_add_data -client sdk -key uid -value "NA" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key RecordType -value "ToolUsage" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key BootgenCount -value "0" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key DebugCount -value "5" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key PerfCount -value "0" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key FlashCount -value "0" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key CrossTriggCount -value "0" -context "sdk\\\\bsp/1525381728804"
webtalk_add_data -client sdk -key QemuDebugCount -value "0" -context "sdk\\\\bsp/1525381728804"
webtalk_transmit -clientid 1241833136 -regid "" -xml /home/pbm/Documents/UA/4_year/cr/EthernetTest/EthernetTest.sdk/webtalk/usage_statistics_ext_sdk.xml -html /home/pbm/Documents/UA/4_year/cr/EthernetTest/EthernetTest.sdk/webtalk/usage_statistics_ext_sdk.html -wdm /home/pbm/Documents/UA/4_year/cr/EthernetTest/EthernetTest.sdk/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
