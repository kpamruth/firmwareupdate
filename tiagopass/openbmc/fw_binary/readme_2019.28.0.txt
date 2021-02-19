The change log for fbtp-v2019.28.0 are:
=================================
* [Feature]
 - ncsid: Preliminary support to Enable NIC PLDM sensor monitoring
 - ncsid: Enable PLDM firmware update from OOB (ncsi-util -p <firmware .pldm file>)
 - Support to modify individual fields in FRUID using fruid-util <FRU> --modify --<field> <path to binary>
 - [fw-util] Allow forceful update of BIOS using the --force option which bypasses image validation checks.
 - GPIO monitoring was overhauled to use abstracted library in preparation for kernel upgrade.
 - [ncsid] update vendor and version information received from AEN.
 - Support for calibrating new MB_INLET_REMOTE_TEMP sensors for ODMB based on Board Custom Data 3 field
 - Ease thermal debugging by adding timestamp to FSC logs
 - Preliminary support for package management on the BMC
 
* [Bug Fix]
 - Fix bug in asd-test which can cause CPLD crash
 - Fix error message printed when running dhclient-script.
 - avoid blocking multiple "reserved" option in set boot order command
 - Remove sending sled-cycle command to no-longer applicable HSC controller address.
 - Fix potential issue when restarting sensord causes malfunction in reading sensors on/via riser-card (BMC reboot being the only remediation).

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2019.28.0
ROM Version: fbtp-v2019.28.0
* [Notes]
- For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
for more details.
- Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
- Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
- Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v2019.12.0 are:
=================================
* [Feature]
 - Upgrade distribution to Rocko based release.
 - First release with new version numbering.
 - Add support for alternative configuration of Type6+Ava
 - Add support for gpiocli utility.
 - Add support to modify individual FRUID field.
 - PLDM firmware update for NIC - Pending NIC firmware to support this.
 - NIC firmware crash detection for broadcom NICs (Depends on Broadcom firmware version: 20.6.4.10)
 - Preliminary support for Rest-API over HTTPS.

* [Bug Fix]
 - Fix potential crash on I2C device removal
 - Fix issue in TPM hang due to incorrect wait logic in I2C driver
 - Fix issue where sol-util history might not display the full history.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2019.12.0
ROM Version: fbtp-v2019.12.0
* [Notes]
- For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
for more details.
- Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
- Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
- Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v7.2 are:
=================================
* [Feature]
- None
* [Bug Fix]
- Fix issue when upgrading to image more than a year apart in release time
* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v7.2
ROM Version: fbtp-v7.2
* [Notes]
- For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
for more details.
- Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
- Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
- Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v7.1 are:
=================================
* [Feature]
- None
* [Bug Fix]
- Fix issue where verified boot fails with status (2,11) upon reboot.
* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v7.1
ROM Version: fbtp-v7.1
* [Notes]
- For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
for more details.
- Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
- Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
- Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v7.0 are:
=================================
* [Feature]
 - sel: parse the unified sel record for PCIe errors
 - rsyslog: Allow runtime configuration to configure/disable remote logging
 - kcsd: return first when add sel request is received (Minimizes delay in SMM mode).
 - Increase poll interval in reading battery to be hourly instead of every 3 seconds.
 - Introduce "wdtcli" command to manage watchdog.
 - (Beta) Add support for --force for sensor-util to get get the sensors directly from source. This is currently not supported and for development only.
 - kv: Minimize writes to persistent kv store if the value remains unchanged.
 - ipmid: add Chassis Control command (netfn=0x0, cmd=0x2)
 - Rsyslog: Split configuration into multiple files
 - libncsi - add ethernet & ncsi statistic tracking
 - obmc-sensor: Allow poll interval larger than 256 seconds
 - aggregate-sensor: Add support to use simple expressions as a source variable (Not used for Tiogapass)
 - rest-api-v2: Add uptime in seconds
 - REST-API: Add fan mode and boost cause in REST-API
 
* [Bug Fix]
 - Fix build failures under the rocko version of Yocto.
 - healthd: Various fixes and refactor to fix corner cases.
 - Fix issue where power-util would not report failure if power-on fails.
 - vboot: Add a verified boot support API to libvbs and ensure that the structure is valid before display.
 - Fix issue where log-util would not display correct message if FRU is double digit (Not reproducable on Tiogapass).
 - Fix cases where over-threshold could be reported by sensor-util but not as a SEL by sensord.
 - ncsid: monitor eth0 MAC address and retry NCSI init if MAC is invalid.
 - ftgmac: to avoid long AEN or NCSI response may be dropped
 - ncsid: use default log level (notice) for DRIVER STATUS CHANGE aen
 - ipmi: Fix regression in support for responses larger than 256 bytes
 - ftgmac: move AEN data from skb to temp buffer before adding to fifo
 - Set stack size of GPIOD/ipmbd/ipmid worker threads to 32kB. This ensures `top` is easy to detect memory leaks.
 - ftgmac: Ensure version update creates directories only if they dont already exist
 - ncsi-util: format output to match NC-SI spec
 - ftgmac100: fix DMA oops if ncsid send message through NETLINK while N?
 - ftgmac100: avoid ncsi request from user space using invalid TX buffers
 - rest-api-v2: support multi-node for shared sensors endpoint
 - sensor-util: do not allow input history period longer than 30d
 - ipmid: Ensure req/res buffers are zeroed before use to avoid abnormal behavior.
 - change default hostname to "bmc-oob." to avoid rsyslogd being blocked for a while when doing HUP action due to DNS query.
 - REST: fix crashing on non-vboot platforms
 - ncsid: update link up/down log message
 - ncsi-util: fix the "Segmentation fault" when executing with "-c"
 - rest-api-v2: Gracefully handle cases when libpal is not found
 - ftgmac100: Fix kernel panic due to illegal access to NULL pointer.
 - fscd: delay determining fan status if fan power got once lost
 - Block to input negative PWM value and fan number in fan-util
 - fw-util: add error handling for unexpected number of parameters
 - ftgmac100: include ncsi command in ncsi response netlink message to userspace
 - libncsi/ncsid: add ncsi response decoder/handler
 - obmc-pal: remove redundant timestamp string from log
 - kernel: Avoid BMC reboot when the other network interface is woken up
 - rest-api: fix the problem that sled-identify-on/off does not work
 - ipmid: Add support for year based major version
 - ncsid: poll NIC FW version
 - ftgmac100: remove creating NIC version file in kernel driver (This is now done by NCSID)

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v7.0
ROM Version: fbtp-v7.0
* [Notes]
- For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
 for more details.
- Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
- Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
- Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v6.0 are:
=================================
* [Feature]
 - RESTful Interface was enhanced to use aioHTTP framework instead of Bottle (non-user visible).
 - New RESTful endpoints common across all platforms (/api/{bmc,sensors,logs}) were added to return sensors & logs for all FRUs.
 - RESTful interface has a single configuration /etc/rest.cfg to turn on writes (turned off by default)
 - RESTful interface now supports reporting sensor history: http://path/sensors?display=history;history-period=1d
 - RESTful interface now supports reporting sensor thresholds: http://path/sensors?display=thresholds
 - RESTful interface now supports reporting specific sensor name or ID: http://path/sensors?name=<name>
 - Add basic infrastructure support for NIC monitoring and management functions.
 - Move timestamp handler from frontpaneld to healthd (non-user visible)
 - Add support to let BIOS report Turbo-mode enable/disable to the BMC (SET_PROC_INFO IPMI command).
 - Refactor all kv-store mechanisms to a single library (non-user visible).
 - Support upgrading vendor specific VR firmware for single side boards.
 - Merge host CPU UART console output into BMC syslog. Now syslog tooling need to just monitor just one table.
 - Add adjusted tables for Type9 system configuration
 - Add capability to get system configuration description via /mnt/data/kv_store/mb_system_conf_desc (needs host cycle).
 - Allow host server to inform BMC that BIOS firmware is being upgraded inband (ipmitool raw 0x30 0xf6 0x08 0x07) to disable out-of-band power cycling for 30 minutes. This status can be cancelled using (ipmitool raw 0x30 0xf6 0x00 0x00).
 - Add support to decode DMA, ITC, OTC & CI in IIO_ERR SEL.

* [Bug Fix]
 - Fix issue where socket file descriptor would be leaked if call to ipmid times out.
 - Fix stack overflow in ipmid when user sends badly formatted ipmi command
 - Fix fw-util usage display to show --dump
 - Fix RESTful interface not reporting verified boot status for software_enforce
 - Fix RESTful interface reporting incorrect verified boot CRC.
 - Fix I2C driver to ensure that commands are received by user space in order.
 - Validate data length of OEM set boot order command.
 - Fix IPMBD to detect if user is transmitting messages larger than 255 bytes.
 - passwd-util: do not allow backslashes to escape any characters
 - Add delay in BMC CPU monitoring to ignore high CPU usage during BMC boot up.
 - Show PCIe slot number in cri SEL when PCIe error occurs
 - remove UCR for local outlet  sensor due to false positives observed under certain tests.
 - Fix issue where thermal tables could not differentiate between systems with an AVA card or HBA card.
 - rsyslog: Upgrade to 8.34 which contains fixes (among many) to memory leak from upstream
 - Limit number of active threads to handle IPMI/IPMB commands.
 - Reduce KCS transaction time for standard SEL from 150ms to 20ms.
 - Fix debug card displaying ":1" under certain conditions.
 - Ignore WDT timeout action when crashdump is ongoing.
 - Fix fan-util to recognize and reject invalid PWM input (Especially if value is greater than 255).
 - Set system restart cause when powering on host via power-util.
 - bios-util: do not allow abbreviations when checking args (Fixes cases when we cannot detect certain error usages)
 - Fix high CPU usage of healthd due to heartbeat poll interval set to 50ms (change to 500ms).
 - When IPMB timeout, prevent ipmb_handle() send i2c command on incorrect channal
 - Extend lease time to fix muti-thread got free timeout at the same time if IPMB is too busy to be accessed.
 - Save ~2MB memory by not installing kernel image in /boot.
 - Fix correctly setting server_sel_error and sensor_health upon BMC Power-on reset.
 - power-util: Ignore power policy control if fru is not server
 - fw-util: Fix reading BMC version
 - fix error in get chassis type.
 - Stop IPMI watchdog timer when MB is not power on.
 
* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v6.0
ROM Version: fbtp-v6.0

* [Notes]
- For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
  for more details.
- Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
- Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
- Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v5.1 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Fix fw-util some times displays incorrect CPLD version and occasional failures in CPLD upgrade.
 - Remove BIOS OEM SEL from critical SEL display of LCD debug card
 - Validate input parameters of fpc-util
 - Fix setting of power policy which can cause some servers to ignore the last-power-state power policy
 - Fix failure to read FRU from external PC connected to the retimer card due to incorrect timeout management

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v5.1
ROM Version: fbtp-v5.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v5.0 are:
=================================
* [Feature]
 - rest-api: disable write operations till authentication is in place
 - fw-util: Validate BMC image to make it resilient to corruption en-route.
 - kernel: Upgrade base Linux kernel from 4.1.15 to 4.1.51
 - Initial framework to identify BMC reboot cause.
 - asd: Significant performance improvements to JTAG handling.
 - Limit the number of idle SSH sessions to prevent uncapped memory usage of sshd.
 - Aggregate sensor: Support divide operation (Unused in fbtp)
 - Aggregate sensor: Support non-conditional expressions (Unused in fbtp)
 - Use high-resolution timers provided by the aspeed SOC instead of HZ.
 - fw-util (dev) Add capability of unit-testing fw-util

* [Bug Fix]
 - Start RTC from Jan-1970 instead from 0 fixes warning during boot "hwclock: RTC_RD_TIME: Invalid argument"
 - log-util: Fix issue where the print header (FRU#, FRU_NAME etc) are printed after the "log cleared" event.
 - log-util: Fix race condition when multiple instances of log-util are started.
 - dhcp: Change DUID type of IPv6 from LLT to LL to prevent BMC IPv6 change after AC cycle/reboot.
 - power-util: Fix typo in help text.
 - Fix a bug in kernel timers where next event was not correctly handled (Would cause nanosleep() to either happen prematurely or be delayed by up to 10ms).
 - (dev) Ensure kernel uses new defconfig if is changed.
 - Fix regression in CPLD operation after ASD performance improvements.
 - Fix sol-util to detect invalid parameters and show help text.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v5.0
ROM Version: fbtp-v5.0

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v4.2 are:
=================================
* [Feature]
 - Default SSH authorized principles are now set (FB Internal only)
 - Copy over certificates and authorized principles at early boot from persistent store.
 - vboot: Introduce fallback promotion feature

* [Bug Fix]
 - Fix incorrect BMC version displayed by fw-util when booted into recovery image.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v4.2
ROM Version: fbtp-v4.2

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 4.2 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v4.1 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Fix CONN_P12V_INA230 Volt, Curr & Power sensors  missing in sensor list

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v4.1
ROM Version: fbtp-v4.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.2.5 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v4.0 are:
=================================
* [Feature]
 - Moved verified boot status rest API interface from its own node to the BMC's node.
 - Add ASD usage to the BMC's rest interface.
 - Track BMC image version history.
 - Add sensor fail detection to fscd.
 - Support monitoring the PPIN GPIO.
 - Provide CPU information in CATERR/MCERR/IERR SEL.

* [Bug Fix]
 - Fix memory leak observed on certain platforms in rsyslog.
 - Fix rsyslog remote logging format
 - Fix sensor-util help text to provide more information on aggregate sensors
 - Ensure fw-util prints an error message when an invalid FRU is used.
 - Fix potential SDR display spec mismatch in displaying sensors.
 - Validate input parameters of cfg-util.
 - Fix formatting of Critical SEL logs in LCD Debug card.
 - Fix minor error log printed during autodump about missing dwr file.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v4.0
ROM Version: fbtp-v4.0

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.2.5 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.2.5 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - sensor-util: Remove redundant line in help message
 - sensor-util: Add help text describing usage of aggregate sensors
 - avoid ntpd terminate due to the time offset exceeding threshold
 - Fix asd performance issue due to excessive/noisy debug logging
 - Update FSC controller inlet linear table
 - ipmi-util: Prevent usage with invalid node number by validating the FRU.
 - fw-util: show usage when input invalid fru or component
 - fruid-util: Support to read/write the eeprom of retimer card
 - LCD debug card: fix issues in displaying MACHINE_CHK_ERR since the SEL could be larger than the allocated buffer.
 - gpiod: Fix PROCHOT SEL to be displayed as per specification.
 - power-util: Prevent usage when FRU parameter is invalid.
 - Fix receiving unexpected FRB3 event when MCERR/IERR

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.2.5
ROM Version: fbtp-v3.2.5

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.2.4 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Fix issue where log util would display logs form December 2017 as December 2018.
 - PCH temperatures can reach 70+C in certain normal conditions. Increase the upper critical threshold to 82C.
 - Workaround for certain NIC cards which can loopback NS messages thus causing DAD failures
 - Fix incorrect FRUID (or failure to read FRUID) from cards on the riser by switching the mux channel before copying the FRUID.
 - Fix issue where BMC would report MB_C2_NVME_CTEMP even though just an ava card was installed on slot2 riser
 - Fix issue where SS1 system configuration (Type 6 without Flash) required the riser card to be present (Production would not have the riser card)
 - Fix issue where sensor-util would report a timeout when reading a FRU even when no timeout was observed.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.2.4
ROM Version: fbtp-v3.2.4

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.2.3 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Fix auto crash-dump file being overriden abnormally

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.2.3
ROM Version: fbtp-v3.2.3

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.2.2 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Fix airflow and inlet sensor correction for SS_8 system configuration (Since SS_7 was the same as SS_8).
 - Fix IPMI command 'set boot order'
 - Fix system calls from healthd to change permissions every second which would cause ipmb transactions to be interrupted causing the log "ME Status - Controller Unavailable on the mb" to be printed consistently.
 - Fix ipmb call to handle cases when system call would be interrupted by a signal and retry (second fix for log "ME Status - Controller Unavailable on the mb" to be printed consistently).

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.2.2
ROM Version: fbtp-v3.2.2

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.2.1 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Move handling of alt-source from C to assembly to avoid issues when alt-source is enabled when hardware-enforcement is enabled.
 - Ensure fw-util does not clobber ROM when upgrading BMC when hardware-enforcement is enabled.
 - Prevent reboot when crash dump is ongoing.
 - Prevent init 0 or init 6 from rebooting or shutting down BMC when crashdump or firmware update is ongoing
 - Correctly handle issue when user enters multiple network boots in the boot order.
 - Fix error about imfile being loaded twice
 - Re-enable DHCP from logging in order to ease debugging provision/unprovision issues.
 - Filter DHCP logs to its own log (rotated) file instead of flooding the regular log.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.2.1
ROM Version: fbtp-v3.2.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.2 are:
=================================
* [Feature]
 - vboot: Creating a locked image is now as simple as running a script on the image before signing it.
 - vboot: Prevent write protecting the ROM if it is unsigned.
 - Move to using PST instead of UTC as the timezone to match with the hosts.
 - Add support for GD25Q256 flash chip.
 - Add BMC version to rsyslog versions.
 - ASD version upgraded to 1.0.3

* [Bug Fix]
 - Fix issue where power failures would not be detected when SLPS4 goes low (Maintain monitoring when SLPS4 is high).
 - Fix corner case when a DHCP6 lease might be dropped due to time changes.
 - bios-util: Fix error about missing bios_support.json
 - Fix poll interval of sensord which regressed from every 2 seconds to every 4 seconds in 3.1 release.
 - rest-api: Remove blank lines in sensor output.
 - Fix issue where log-util would not recognize non-ascii characters (Fixes errors in import codecs and unexpected error when opening file in log-util).
 - Fix issues in reading INA230 sensors (ODM1 specific).
 - aggregate-sensors: Do not clobber string private to json library.
 - Fix issue causing sensord to consistently crash due to conflict between sensor-correction and aggregate sensor libraries.
 - Fix the file name is incorrect for secondary crashdump triggered by IERR
 - Fix warning by healthd due to max memory threshold being lower than the "Reboot" setting.
 - Make HYNIX workaround in BMC DDR4 configuration SKU conditional 
 - Fix memory loop error cannot be detected correctly while DIMM location number is 0
 - modify Rsense to 0.267 in reading hsc current to reduce error margin to below 1%
 - vboot: Fix recovery flag not set if kernel/rootfs signature check fails (error 6,60).
 - Update inlet sensor correction tables for SKU1 based on thermal team's feedback.
 - Update sensor thresholds for CPU Temp, Remote outlet temp, VR temperatures based on thermal team's feedback.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.2
ROM Version: fbtp-v3.2

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.2.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.
 - Hardware enforcement enabled on the .locked variant of the image.

The change log for fbtp-v3.1 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Fix issues in reading INA230 sensors (ODM1 specific).
 - Add support for GD25Q256
 - Revert "Monitor and store history of aggregate sensors" since it was causing issues to unblock tests while the issue is being debugged.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.1.1
ROM Version: fbtp-v3.1.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.0.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.

The change log for fbtp-v3.1 are:
=================================
* [Feature]
 - Expose verified boot status via RESTful interface.
 - Expose TPM version information via RESTful interface.
 - Expose BMC flash chip vendor via RESTful interface.
 - Move log-util to use standard rsyslog template
 - Enable panic on OOM
 - Look up hostname of the BMC at boot-up by querying the name server.
 -  Log asserts and de-asserts for missing sensors in FSCD.
 - Add passwd-util to support persistent password change.
 - Allow BMC to log critical errors to a remote syslog server (Testable in FB DC only).
 - BMC now automatically reboots if memory utilization exceeds 95%
 - vboot: Automatically enable software enforcement when ROM is a signed image.

* [Bug Fix]
 - Add 0xff as a reserved device id in boot sequence
 - Override pal_parse_sel to parse MEMORY_ECC_ERR correctly.
 - Fix LPC IERR
 - Allow support for ipmid to check force boot bios setup flag.
 - Show remote inlet temperature in LCD debug card
 - Disable force ADR to BMC
 - Fix potential stack overflow in IPMID when parsing SEL
 - vboot: Fix boot-loop after upgrading BMC TPM along with an AC cycle.
 - vboot: Do not initialize the TPM for a second time.
 - vboot: Place TPM provisioning wihtin handoff timeout protection.
 - vboot: Fix vboot-check to use 5120 as the default SPL FIT size.
 - vboot: Allow 'vbs clear' in u-boot console to clear TPM rollback storage. Note, user must have physical access to system to enter u-boot console.
 - Fix exception in bios-util when getting boot_order.
 - Detect failed firmware upgrade of LCD USB debug card.
 - Fix division by zero in the kernel when reading fan speed.
 - fw-util now detects single/dual vboot/non-vboot hardware enforcement at runtime rather than at compile time.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.1
ROM Version: fbtp-v3.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.0.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.
 - Software enforcement is enabled by default. Flashing an unsigned image on BMC will force boot into recovery (ROM). To ease rapid development, SW developers may flash the unsigned variant to CS0 to avoid having to constantly sign development images. Released images should not have a problem.

The change log for fbtp-v3.0 are:
=================================
* [Feature]
 - Allow sensor history retrieval of up to a month
 - Monitor thresholds and store history of aggregate sensors
 - [dev] Upgrade python from 2.7 to 3.5.1 (Affected: log-util, fscd, bios-util, vboot-check).
 - Allow partial upgrade of CS1 to support verified boot final lockdown of the first 64KB.
 - Support upgrading the same component on multiple frus (Not useful for fbtp).
 - Validate BMC image before flashing - prevent accidental flash of BMC image from another platform.

* [Bug Fix]
 - Use capital letters on fw-util version
 - Restore power fail event detect to sensor polling
 - De-assert verified boot alert upon remediation
 - fix the fruid chassis type string display issue
 - store uncompleted crash dump data
 - vboot: Improve performance by requiring single signature verification
 - fruid-util: add the function for comparing the binary data
 - Improve sensord CPU utilization by removing check for flashcp.
 - Update airflow table for JBOG
 - Fix issue where SMI events could be missed if triggered rapidly
 - correct the return value in mux_lock
 - Allow NTP configuration to add unrestricted access by specific host
 - Simplify sensor-util option parsing
 - Do not allow multiple instances of fw-util to prevent firmware upgrade corruptions.
 - fruid-util: differentiate between fruid not present vs unavailable

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v3.0
ROM Version: fbtp-v3.0

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_3.0.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 3.0.0 and above version.

The change log for fbtp-v2.9 are:
=================================
* [Feature]
 - Introduce bios-util to host all bios related features. Note, postcode display has been moved from fw-util to bios-util. Please check the spec.
 - Migrated fw-util to a common framwork. No functional differences expected.
 - ADD UARTSW channel display support for LCD usb debug card.
 - vboot: Add check for WDT alternate boot source in SPL
 - Enable TPM driver in the kernel. This allows BMC TPM version query and BMC TPM update.
 - vboot: Add vboot-check script to help in debugging verified boot related issues.

* [Bug Fix]
 - minor modification to the inlet linear FSC table based on thermal testing feedback
 - Remove limitation on number of corrections per table
 - asd: Prevent multiple instances of asd for the same fru
 - remove CPU number for FPH event
 - correct power status report for chassis cmd
 - Fix IPMI command: Get Board ID(0x37)
 - Add SKU based sensor correction for inlet sensor
 - Move sensor correction for inlet sensor to be based on fan RPM instead of PWM.
 - Update airflow calculation tables based on thermal team feedback
 - add get_sel_time command support for BBV time sync function
 - asd-test: add -r option to specify irsize (default 11)
 - System restart cause command implementation
 - Add re-timer card present check in BBV present check function
 - Update Platform.S v17 to fix Hynix DRAM ECC/UECC issue
 - DWR second dump flow change

* [Version]
root@bmc:~# fw-util mb --version | grep "bmc\|ROM Version"
BMC Version: fbtp-v2.9
ROM Version: fbtp-v2.9

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_2.9.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.6.1 and above version.

The change log for fbtp-v2.8 are:
=================================
* [Feature]
 - SOL log files now has timestamp prepended.

* [Bug Fix]
 - Fix issue where log-util clear command would stop all logging till BMC reboot.
 - Use correct FBTP endpoint names for REST API.
 - Add blank lines after different FRU for sensor history display.
 - Fix I2C bus hangup issue.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.8
ROM Version: fbtp-v2.8

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_2.6.1.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.6.1 and above version.

The change log for fbtp-v2.7 are:
=================================
* [Feature]
 - Add support to be used as a head node for Big-basin (BBV)
 - Use rsyslog instead of syslog. This allows us to move towards remote logging
 - Log PCIE errors to usb debug card.
 - Enable kernel/rootfs keys enforcement (only if the rest of the validation was successful)
 - Bump fsc config version to 1.0.
 - Upgrade ASD to reference version 0.96 (Requires upgrade of openIPC tools). Among various optimizations, this brings IPv6 support.

* [Bug Fix]
 - Add retry for inlet/outlet temperatures if negative values are read.
 - Add two cycles delay after power on for INA230 sensors read to fix issues of invalid sensors read after power on.
 - Add both-CPU error check for display on USB debug card.
 - Add retry if negative temperature is read from the mezz card. 
 - Allow reading of I2C bus status from the kernel (Improved debug-ability)
 - Monitor IRQ_DIMM_SAVE_LVT3_N only when host is powered on.
 - Add retry when VR reads negative temperatures.
 - vboot: Only update fallback times when the images are signed.
 - Do not monitor threshold for local inlet sensor since the reading might vary from actual reading.
 - Fix potential crash in ipmid when setting the boot order.
 - Add CPU number in cri SEL for IERR/MCERR
 - Add FRU number to IPMI watchdog timer log.
 - Log power fail event based on the power data from CPLD. 
 - Fix sensor display format for display on usb debug card.
 - vboot: Set TB bit for MX & WB SPI NOR flash of CS1 (Allows us to test lock down of CS1 first 64kb).
 - Filter MEMHOT events if they occur within 3 seconds of power on.
 - Do not allow cold reset IPMI command if firmware update or crashdump is ongoing.
 - Use friendly times for vboot-util.
 - Ensure only one instance of power-util is running.
 - Various fixes to the I2C driver to improve robustness and minimize number of timeouts.
 - Fix file descriptor leak if FRUID write fails.
 - Enhance NIC presence detection.
 - Add timeout in frontpaneld (SLED detection) to avoid abnormal waiting.
 - Fix logic of filter to avoid abnormal DIMM temperatures. 
 - Since it has external PU for UV_HIGH_SET pin. Set to input by default.
 - Add retry for open/close for ipmitool.
 - vboot: Increase max SPL FIT to 5120 bytes
 - Fix issue where system would hang after global reset after an ASD connection
 - Fix gpio driver to get the correct direction instead of defaulting to 'in'.
 - Fix kernel memory corruption due to buffer overflow by LPC KCS driver.
 - Separate sensors from different FRUs when displaying the history.
 - Fix various issues with aggregate sensors by providing a default sensor ID. 
 - Monitor SMI signal from BIOS.
 - vboot: Remove probes and do direct checks for MAXNVWRITES. This fixes a rare issue where we would have an NV write failure.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.7
ROM Version: fbtp-v2.7

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded. See "OpenBMC_TiogaPass_Spec_2.6.1.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.6.1 and above version.

The change log for fbtp-v2.6.1 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - vboot: Disable preemptive FMC SPI SRWD usage (Allow CS0/1 changes even with WP# pin pulled low).

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.6.1
ROM Version: fbtp-v2.6.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.5.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.2 and above version.

The change log for fbtp-v2.6 are:
=================================
* [Feature]
 - None

* [Bug Fix]
 - Revert split of sensors into riser_slot2/3/4 temporarily till a safe way of accessing the I2C bus from multiple threads (Fixes occasionally seeing NA as sensor value)
 - Add retry for temperature sensors.
 - Change HSC address for SS PVT+ boards as per the new Tioga Pass OCP specification.
 - Send a message to the ava card to ensure its presence.
 - Fix debug compilation for edb and kv libraries.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.6
ROM Version: fbtp-v2.6

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.5.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.2 and above version.

The change log for fbtp-v2.5 are:
=================================
* [Feature]
 - Support for airflow sensor an aggregated sensor with runtime configuration in /etc/aggregate-sensor.json
 - Support for system configuration based correction for MB_INLET_REMOTE_TEMP in /etc/sensor-correction.json
 - Support multiplication and division in FSC's zone configuration expression file.
 - Move sensors from FRU MB to riser_slot2/3/4.
 - Upgrade aspeed DDR3/DDR4 SDRAM controller sequence initialization release from v14 to v16.
 - Add verified boot check to healthd which should create a critical log if BMC boots into recovery or other error occurs.

* [Bug Fix]
 - Fix issue where repeated SLED (AC) cycles will eventually cause vboot-util to report a TPM setup failure.
 - Fix set/get BIOS boot order command may cause abnormal behavior.
 - Add log clear event for sys logs.
 - Enable force ADR only when AEP DIMM is detected.
 - Change HSC current threshold to 52.8
 - Fix ASD daemon going into a loop upon client disconnection printing log messages.
 - Fix issue where ASD was not detecting PRDY being triggered.
 - Fix iusage text for ASD daemon.
 - Fix issue where full path to sensor-util was not provided in autodump.sh thus not dumping sensors on CATERR.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.5
ROM Version: fbtp-v2.5

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.5.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.2 and above version.

The change log for fbtp-v2.4 are:
=================================
* [Feature]
 - Introduction of ipmitool which allows BMC to act as a host to other BMCs.
 - Add new helper IPMB methods.
 - Use mTerm to log BMC console with UART4.

* [Bug Fix]
 - Do not reset if the host is already off.
 - Reset watchdog after u-boot does WDT1 reset in order to try and recover the TPM.
 - Fix ipmbd retrying sending the request prematurely (Avoid nanoleep prematurely returning).
 - Fix PPIN command always fail.
 - Disable FORCE_ADR temporarily while hang issues are debugged.
 - Check POR status with SCU3C[0].
 - Make the INA230 sensor calibration ODM specific.

* [Known Issues]
 - It has been observed that repeated SLED cycles will eventually cause vboot-util to report a TPM setup failure. Currently under investigation.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.4
ROM Version: fbtp-v2.4

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.0.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.2 and above version.

The change log for fbtp-v2.3 are:
=================================
* [Feature]
 - Add support to print the NIC firmware version in fw-util
 - Prevent power-util from performing a sled cycle if any of the FRUs are undergoing a crash-dump or firmware upgrade.
 - Add support to get the link-local MAC address of BMC from the host via IPMI.
 - Implementation of fan speed table proposed by thermal team's calculation
 - Add PCIe NVMe temp sensors to distinguish AVA card sensors
 - Add CPU Thermal Margin sensors
 - Add CPU package power in fan table (will not be triggered)
 - Add HSC temperature
 - Update CPLD power-fail detection to check the power sequence pins one by one
 - Update CPLD power-fail detection to add CPLD power enable pins (offset 0xA to 0xC)
 - Global Reset system after DWR autodump
 - vboot: Report fallback times in vbs and vboot-util
 - vboot tpm: Begin locking physical presence and NV settings

* [Bug Fix]
 - Fix vboot-util showing "There is a general TPM or TPM hardware setup error" upon sled-cycle. 
 - Fix 'pidof' error messages in /var/log/messages
 - Add traceback to the FSCD log file.
 - Remove crash-dump checks from peci-util
 - Retry getting fan speed if it is over the UCR value.
 - Set a default sane boot order instead of using invalid values if never set.
 - Changed CPU temperature upper critical threshold from -4 to -2.
 - Only start DWR-autodump when system is in DWR mode
 - Change AVA NVMe sensors to 0-based number to avoid warning messages in /var/log/messages
 - Add libgpio as a dependency for libpal.
 - Fix issue where SLAVE_EN bit is lost when I2C recovers.
 - Fix issue where multiple "ME Status - Controller Unavailable on the mb" is observed during power cycle.
 - wdt: Use a SoC reset for WTD1 in U-Boot instead of full reboot.
 - vboot: Fix TPM provision reset and error overflow
 - vboot: Reset handoff and WDT1 when using U-Boot console

* [Known Issues]
 - If ROM has fbtp-v2.1 and earlier version and BMC has fbtp-v2.2 and later version, then fw-util mb --version will show NA as the ROM version.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.3
ROM Version: fbtp-v2.3

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.0.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.1 and above version.

The change log for fbtp-v2.2 are:
=================================
* [Feature]
 - Add HPR Warning event handle, do 2nd autodump after DWR
 - Add support for Node-manager (ME) monitoring in healthd.
 - Support getting FRU information for AVA cards.
 - Support cards inserted into riser slots as FRUs.
 - Initial support for IPMI command to get system restart cause.
 - Log events when ADR completes (Monitoring DIMM_SAVE GPIO).
 - [Developer] Automatically set the ROM version based on git tags.
 - Increase HSC power resolution to detect up to 1020W.
 - Add support to detect and store the machine configuration in kv store (Usage upcoming). It is assumed that BIOS sends this information via IPMI command 0x6a.
 - [Developer] IPMB is refactored to make payload ID a parameter to the daemon.

* [Bug Fix]
 - Fix BMC date not syncing to current via ME
 - Remove workaround for BMC to reset on power change.
 - Fix HPR event always show "Infinite Time"
 - Correct ADC 3/4 parameters since they do not have scaling.
 - Fix BIOS firmware upgrade not powering off host.
 - Do not force ADR in power-button operation.
 - Fix issue where post end is not logged in the BMC.
 - Fix reading accuracy for sensors read from INA230.
 - [Developer] Support CPP modules to include gpio.h
 - [Developer] Fix all compiler warnings for libpal and mark all warnings as errors.

* [Known Issues]
 - power-util sled-cycle and then vboot-util on bmc power up shows "There is a general TPM or TPM hardware setup error" (Will be fixed in fbtp-v2.2).

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.2
ROM Version: fbtp-v2.2

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.0.0.pdf"
   for more details.
 - Both ROM (CS0) and BMC (CS1) must be 2.1 and above version. Please upgrade both ROM and BMC. 

The change log for fbtp-v2.1 are:
=================================
* [Feature]
 - Decode NM capabilities, threshold and health SEL from ME
 - Add support for IPMI Set CPU PPIN command.
 - Enhance FSCD configuration to allow platforms to specify labels.
 - Add support for IPMI commands GET/SET Flash info.
 - Enhanced JSON based configuration for healthd.
 - Reboot the BMC if memory utilization exceeds a particular limit.
 - Allow rollback protection of verified boot to accept a previously verified fallback image.
 - Add support for ADR Trigger IPMI command.
 - Force ADR during host power changes.
 - Hardware key signing and multiple subordinate key support for verified boot.
 - introduction of ipmb-util a generic tool to communicate with any slave on the IPMB bus.
 - Make me-util use ipmb-util instead of duplicating the functionality.
 - Add support for OCP PPR Get/Set command.
 - Decode vendor ID, device ID and error code for the PCIE error SEL.
 - Add support for ECC monitoring by healthd (Disabled for FBTP)
 - Allow IPMBD to communicate with any slave device on the given IPMB bus.
 - Log the PROCHOT reason to syslog.
 - Add support for sensor alert immediate message.

* [Bug Fix]
 - Fix vboot-util error "There is a general TPM or TPM hardware setup error" even if signed images are used on every reboot.
 - Update HSC Inlet power upper critical threshold from 790.4 to 792W.
 - Fix issue where a critical SEL might be absent from the usb debug card critical SEL window.
 - Limit the length of the HDD model name in usb debug card display.
 - Fix issue where fan 0/1 failures were printed as fan 1/2 failures.
 - Ensure that all framework updates set the global fw-update flag to disallow system states during framework updates.
 - Reduce the verboseness of FSCD.
 - Fix multiple issues observed while reconnecting the debugger to the ASD service.
 - Fixed issue where ASD service was trying to manipulate the PWRGOOD GPIO instead of the POWER_DEBUG GPIO.
 - Fixed issue where sensor hysteresis was not being correctly enforced.
 - Correctly handle incorrect parameters for sensor-util
 - verified boot: reset the TPM once if found in an invalid state post initialization.
 - verified boot: Fixed various issues observed relating to the use of tiny-printf.
 - Store machine configuration received from BIOS in a persistent store. 
 - Fix PPR incorrectly interpreting the request message.
 - Fix power reset handling and move functionality to PAL.
 - Make usb-debug card hotfix platform and board revision specific.
 - Only check hints key on first verification for verified boot.
 - Always use the correct machine name in /etc/issue
 - Error detection when returning the SKU ID for the platform info IPMI command.

* [Known Issues]
 - power-util sled-cycle and then vboot-util on bmc power up shows "There is a general TPM or TPM hardware setup error" (Will be fixed in fbtp-v2.2).

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.1
ROM Version: fbtp-v2.1

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.0.0.pdf"
   for more details.
 - Both ROM and BMC must be 2.1 and above version. Please upgrade both ROM and BMC. Use upcoming dummy 2.1.1 release for upgrade/downgrade tests.

The change log for fbtp-v2.0 are:
=================================
* [Feature]
 - AtScaleDebug add support to monitor system power status.
 - AtScaleDebug add support for Probe mode (PRDY and PREQ)
 - AtScaleDebug add support to auto-detect if XDP is connected.
 - AtScaleDebug preliminary support for IPv6.
 - Dump 3 minutes of sensor history and thresholds along with the core-dump upon CATERR.
 - sol-util: Use Ctrl+l+x instead of Ctrl+l+DEL to maintain consistent key escape sequence across keyboards.
 - Print IPv4 address in LCD usb debug card if the BMC has a valid IPv4 address.
 - Print the ROM version in fw-util mb --version.
 - Detect and log BMC reboots.
 - Add CPLD checksum output to CPLD update.
 - Retrieve and log power failure reason from CPLD.
 - Support receiving machine configuration IPMI command.
 - Support IPMI master read/write command allowing host to read/write on I2C busses connected to the BMC.
 - Log AC lost event to LCD debug card SEL.
 - Log platform reset event.
 - Log memory loop fail event to LCD debug card.
 - Provide UCR/LCR reading in LCD debug card for critical sensors if those thresholds are exceeded.
 - Support 80port IPMI command.
 - Add support for FRB3 sensors.
 - FSCD core now supports reading sensor/fan from sysfs along with utility (Unused in FBTP).
 - sensord, ipmid, etc now utilize run-it to start the daemons. Please use sv <cmd> <daemon> to start/stop/restart these daemons.
 - Light up fault LED when CPU CATERR occurs.

* [Bug Fix]
 - Fixed issue where ''SLED Powered OFF'' event log information contains the wrong date (Time show ''Thu Jan 1 00:00:00 1970'') after execute “cfg-util –clear
 - Fix issue where LCD debug card can’t get “ BMC IP” under SYS_Info page after system boot to host OS then plug LAN cable.
 - Fix issue where BMC will alert ''MCERR/CATERR'' error event when system run BMC DRAM ECC stress test.
 - Fix issue where BMC doesn't log ''CPU socket Occupied State'' events when remove or install CPU.
 - Fix issue when BMC will alert ''SLED Powered ON/Off'' event log when system run BMC fw update stress test or BMC DRAM ECC stress test.
 - Move sync time with ME to after IPMID is started.
 - Do not log an error when setting fan speed fails due to host being powered down.
 - Sync time for sled-cycles when it is manually triggered via power-util.
 - Fixed issue where an invalid file handle was closed in checking post codes.
 - Fix issue where the first SDR may be repeated and the last SDR may be deleted.
 - Use GPIOAB2 as WDT reset source to fix "There is a general TPM or TPM hardware setup error" issue. There is still a race condition which might still display this message in vboot-util.

* [Known Issues]
 - FSC prints fan numbered as "Fan 1" and "Fan 2" instead of "Fan 0" and "Fan 1" (Will be fixed in fbtp-v2.1).
 - vboot-util sometimes might show "There is a general TPM or TPM hardware setup error" (Will be fixed in fbtp-v2.1).

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC\|ROM Version"
BMC Version: fbtp-v2.0
ROM Version: fbtp-v2.0

* [Notes]
 - sol-util's escape sequence has been changed.
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_2.0.0.pdf"
   for more details.
 - ODM may sign their own engineering builds. For more information, check 3.4 of OpenBMC_TiogaPass_Spec_2.0.0.pdf (Note a few fixes were made to the signing scripts, and the one-time steps must be re-run)

The change log for fbtp-v1.9 are:
=================================
* [Feature]
 - At-scale-debug -- Capability to debug the CPU via the network using the openIPC framework.
 - Log SLED cycles to syslog
 - Add option for sensor-util to clear the history.
 - Add SPS FW Health event.
 - Add HPR Warning event.
 - Add an option in cfg-util which will allow persistent configuration to be cleared to factory defaults.

* [Bug Fix]
 - Fix sensord issuing threshold assertion even when the sensor value is within the threshold de-assert range.
 - Fix post-code information no longer visible in sol-util after migration to mTerm
 - Remove --force option from help text of sol-util since it is no longer required with mTerm.
 - ME power state was not being displayed in the SEL
 - Downgrade the severity of BMC CPU utilization messages which can be normal occurrence during stress tests.
 - Prevent fan-util from setting the fan PWM when the server is off.
 - Remove duplicated "CPU MSMI" message to LCD debug card.
 - Improve CPLD update time by reducing delays.
 - Increase sleep time after enable battery sense pin to 10ms to fix issues observed in reading the battery sense pin
 - Correctly handle error cases in KCS driver.
 - Treat 0xff received from VR as error case and handle it appropriately.
 - Block peci-util during crash-dump to avoid ME/BMC PECI bus access conflicts.
 - Check FM_CPU0_SKTOCC_LVT3_N, FM_CPU1_SKTOCC_LVT3_N, FM_CPU_CATERR_LVT3_N & FM_CPU_MSMI_LVT3_N on BMC power up.
 - Change AVA sensors to be indexed from 0 instead of 1 (MB_C2_0_NVME_CTEMP,1,2,3 instead of MB_C2_1_NVME_CTEMP,2,3,4
 - Set GPIOAA0 to 0 by default as a software workaround for hardware issue (Symptom would be excessive MEMHOT, PROCHOT on server on/cycle.
 - Fix issue where GPIOE4/E5 were used as THERMTRIP indicator instead of GPIOM4/M5.

* [Known Issues]
 - FSC prints fan numbered as "Fan 1" and "Fan 2" instead of "Fan 0" and "Fan 1".
 - There might stray DEASSERT for MEMHOT* sensor values. Please report if this is seen in this release. If still observable, the next release will contain filters added during server on.
 - vboot-util sometimes might show "There is a general TPM or TPM hardware setup error"

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC Version"
BMC Version fbtp-v1.9

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_1.8.0.pdf"
   for more details.
 - ODM may sign their own engineering builds. For more information, check 3.4 of OpenBMC_TiogaPass_Spec_1.8.0.pdf (Note a few fixes were made to the signing scripts, and the one-time steps must be re-run)

The change log for fbtp-v1.8 are:
=================================
* [Feature]
 - Initial infrastructure to support the IPMI chassis_get_boot_option command (Not fully supported yet).
 - Do not allow power changes during firmware upgrades. 
 - sol-util now uses mTerm as its backend. This now replaces the escape sequence from Ctrl+X (thus fixing a few issues when the host OS expects the same key sequence).
 - Introduction of obmc-pal library to ease multi-platform development (Non-user visible feature).
 - Support handling of the DCMI IPMI command.

* [Bug Fix]
 - Log when kernel runs out of memory.
 - Enable on-chip detect pin to trigger fast ProcHot & configure the GPIO E7 pin as required.
 - Change syslog mask to minimize flooding of DHCP messages.
 - Correctly handle errors in temp421 driver.
 - Fix inlet correction not being applied when sensor is read when server is on.
 - Fix use of timer expiration flag for the IPMI WDT functionality.
 - Add slot number of the PCIE error for display in LCD debug card.
 - Set GPIOA0 to enable CPLD by default.
 - Fix sensord not being able to retry upon failure.
 - Fix bitbake warnings about missing runtime dependencies.
 - Return the correct next entry for the storage-get-sel IPMI command.
 - verified-boot: Check U-Boot hash and improve non-enforce flow
 - verified-boot: Improve TPM provisioning and protect against NV write.
 - Fix where certain critical sensor's de-assert was being ignored and error printed to standard out.
 - Fix where ME power state was not being decoded.
 - Allow pins assigned for uart3 to be used as GPIO pins (Since those are not used by FBTP).
 - Force de-assert write-protect pin on CS0 to ensure ROM is writable till Production.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC Version"
BMC Version fbtp-v1.8

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_1.8.0.pdf"
   for more details.
 - ODM may sign their own engineering builds. For more information, check 3.4 of OpenBMC_TiogaPass_Spec_1.8.0.pdf (Note a few fixes were made to the signing scripts, and the one-time steps must be re-run)

The change log for fbtp-v1.7 are:
=================================
* [Feature]
 - sensor-util now supports displaying history of sensors
 - Static inlet sensor correction.

* [Bug Fix]
 - Fix issue where flashing the signed image on both BMC & ROM would still cause vboot-util to show failure.
 - Prevent sensord from reading sensors while a BIOS upgrade is going on. This should prevent errors during BIOS upgrade.
 - Fix race condition where BMC_READY GPIO was asserted before KCSD was initialized causing some BIOS issues.
 - Correctly handle errors in the PPR command upon file open failures.
 - Add back filtering critical GPIOs post power-on for 3 seconds to prevent false alarms.
 - Send fan failure messages to LCD debug card.
 - Set fan PWM to 70% instead of 100% upon fscd exit. This should prevent sensor asserts.
 - Fix assertion when FSCD is stopped.
 - Remove DHCP6 warning messages.
 - Increase time power button is held from 5s to 6s to fix issues seen during OOB BIOS upgrade.

* [Version]
root@bmc:~# fw-util mb --version | grep "BMC Version"
BMC Version fbtp-v1.7

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5/1.6. See "OpenBMC_TiogaPass_Spec_1.7.0.pdf"
   for more details.
 - ODM may sign their own engineering builds. For more information, check 3.4 of OpenBMC_TiogaPass_Spec_1.7.0.pdf (Note a few fixes were made to the signing scripts, and the one-time steps must be re-run)

* [Developer Notes]
 - With this release onwards please raise pull-requests against the master branch and not the tioga_pass branch. This branch will be automatically updated every change.

The change log for fbtp-v1.6 are:
=================================
* [Feature]
 - verified boot: Signed image support (no enforcement).
 - Fan speed controller V2 with better platform abstraction.
 - vboot-util now returns human readable error text instead of an error code.
 - Add support to reset (IPMI/Section 27.5), set (IPMI/Section 27.6) & get (IPMI/Section 27.7) the watchdog timer.
 - Add support for OEM DDR4 Post-Package Repair command
 - Include critical SELs in syslog
 - Allow timezone and NTP server configuration to be persistent (cfg-util time_zone <tz> or cfg-util ntp_server <ip> to set)
 - Decode IPMI OS event sensor type

* [Bug Fix]
 - Fix issue where BMC would boot from recovery partition instead of the secondary flash even if it contains a valid image.
 - Rename usb_dbg to ocpdbg-lcd to avoid issues where libusb-dbg.so was considered as a debug variant of libusb.so
 - Fix constant error "net_ratelimit: xxxx callbacks suppressed" in dmesg.
 - Use remote inlet as FSC input.
 - Mention whether there was an Assertion or De-assertion during ipmi log decode
 - Delay UV event by 20ms to avoid logging it while unplugging sled
 - Fix issue where a message about failure to get health status is repeatably logged.
 - Disable SCU physical link pins so they may be used as general purpose IO
 - Fix where pal_add_cri_sel() never really logged the SEL.
 - Fix issue where `sensor-util all` would return an error code even when executed correctly.
 - Increase queue size of IPMBD to allow high burst traffic.
 - Reset LCD debug card when system reset.

* [Version]
root@bmc:~# fw-util mb --version | grep "OpenBMC Release"
OpenBMC Release fbtp-v1.6

* [Notes]
 - For systems with dual flash, both BMC & ROM are recommended to be upgraded from fbtp-v1.5. See "OpenBMC_TiogaPass_Spec_1.6.0.pdf"
   for more details.
 - ODM may sign their own engineering builds. For more information, check 3.4 of OpenBMC_TiogaPass_Spec_1.6.0.pdf
 - From now on two images will be released. flash-fbtp will be unsigned while flash-fbtp.signed will be the signed image for verified boot. This should be used for all dual-flash use cases.
 
The change log for fbtp-v1.5 are:
=================================
* [Feature]
 - Boot from read-only secure flash which will authenticate read-write second flash image
 - Display POST code information on the LCD Debug card.
 - Display GPIO description information on the LCD debug card.
 - Display critical sensor information on the LCD debug card.
 - Display critical logs on the LCD debug card.
 - Allow LCD debug card firmware update.
 - Display fan speed controller version in fw-util
 - Display BMC version in fw-util

* [Bug Fix]
 - Reduce ROM initialization code (should fix a bug causing hangs with DRAM initialization after rebooting BMC).
 - Fix issue where GPIO interrupt might lost
 - Fix issues where I2C communication would fail during stress tests
 - Fix kernel hang during AC cycle.
 - Avoid issue where BIOS may end up using incorrect clock from BMC.
 - Fix BMC memory leak by increasing log-rotate frequency and moving critical logs to persistent memory.
 - Fix PECI driver initialization
 - Fix I2C controller timeout issues.
 - Fix slow I2C communication towards ME.

* [Version]
root@bmc:~# fw-util mb --version | grep "OpenBMC Release"
OpenBMC Release fbtp-v1.5

* [Developer Notes]
 - It is recommended that developers upgrade to the 'krogoth' release of Yocto. Note the updated checkout instructions from GitHub:
   git clone -b krogoth https://git.yoctoproject.org/git/poky
   cd poky
   git clone -b krogoth https://github.com/openembedded/meta-openembedded.git
   git clone -b krogoth https://git.yoctoproject.org/git/meta-security
   # Clone openBMC repo as usual
 


The change log for fbtp-v1.4.3:
===============================
* [Feature]
NA

* [Bug Fix]
- [peci] Fix occasional kernel hang during ac cycle

* [Version]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Feb 24 2017 - 17:32:45 -0800) fbtp-v0.4
Linux bmc 4.1.15-fbtp #1 Fri Feb 24 17:31:31 PST 2017 armv6l GNU/Linux
OpenBMC Release fbtp-v1.4.3

The change log for fbtp-v1.4.2 are:
=================================
* [Feature]
NA

* [Bug Fix]
- Use platform ID to apply different filtering logic for dimm abnormal values
- Update VR vendor/board related defines
- Correct return value after vr update
- Disable snoop dma during boot up
- Fix LPC/snoop driver logic to handle interrupts
- fix fd leak and correct INA230 pot

* [Version]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Feb 13 2017 - 17:08:45 -0800) fbtp-v0.4
Linux bmc 4.1.15-fbtp #1 Mon Feb 13 17:07:32 PST 2017 armv6l GNU/Linux
OpenBMC Release fbtp-v1.4.2

The change log for fbtp-v1.4.1 are:
=================================
* [Feature]

* [Bug Fix]
- Handle buffer full condition to print snoop history
- Update outlet UCR to 90 based on thermal test
- Delay INA230 sensor monitor after configuration
- handle GPIOAA4 and GPIOAB2 will switch in DVT
- Add support for more OEM commands (CPU/DIMM/DRIVE)
- sync time after every reboot
- Remove ext GPIO trigger for WDT

* [Version]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Feb 08 2017 - 11:39:13 -0800) fbtp-v0.4
Linux bmc 4.1.15-fbtp #1 Wed Feb 8 11:37:56 PST 2017 armv6l GNU/Linux
OpenBMC Release fbtp-v1.4.1

The change log for fbtp-v1.4 are:
=================================
* [Feature]

* [Bug Fix]
- Fix the return data length in get chassis status inband cmd
- Sync date after end of POST
- Improve auto crashdump functionality
- Delay 2s for INA230 sensor report when power on
- Disable BIOS debug messages early in u-boot
- Remove debug flag in the lpc snoop driver
- update linear cpu margin table for fscd
- Show POST code history in LCD debug
- Remove VR power offset correction for < 1W
- Update various sensor thresholds based on EE feedback
- Enable ext reset for soc-reset for resetting TPM chip
- parse and validate input for various utils

* [Version]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Jan 24 2017 - 11:09:41 -0800) fbtp-v0.4
Linux bmc 4.1.15-fbtp #1 Tue Jan 24 11:10:56 PST 2017 armv6l GNU/Linux
OpenBMC Release fbtp-v1.4


The change log for fbtp-v1.3 are:
=================================
* [Feature]
- Enable PECI interface related tools for crashdump
- Enable quick boot by moving power on to u-boot

* [Bug Fix]
- Clear BIOS CMOS flag after timeout and/or after BIOS retrieves boot order
- Remove multi function usage for GPIOR6 pin
- Support FRUID content for more than 256 bytes
- Add support for showing post codes and gpio desc on lcd-dbg card
- Add decode logic for OEM post code
- set BMC_PREQ_N and BMC_PWR_DEBUG_N to output high for BMC remote debug pin
- Add thresholds for INA230 sensors and update sensor name
- Fix corner case of updating last power state during sled-cycle

* [Version]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Jan 11 2017 - 11:19:08 -0800) fbtp-v0.4
Linux bmc 4.1.15 #1 Wed Jan 11 12:04:47 PST 2017 armv6l GNU/Linux
OpenBMC Release fbtp-v1.3

The change log for fbtp-v1.2 are:
=================================
* [Feature]
- Add support for INA230 sensors

* [Bug Fix]
- fix ava sensor addr and update thresholds for ava sensors
- increase timeout value for VR update
- Fix race condition in kcs driver during stress test
- add retries to mezz card temp sensor
- add SEL decode logic for power thresh sensor
- allow KCS to receive/send larger packets
- change power sequence after BIOS update
- fix BIOS SPI flash device enumeration regression
- Add support for dynamic IPv6 addr inband command
- Disable MMC in kernel configuration to use i2c bus
- add debounce timer for GPIOQ6
- remove GPIOD4 for monitored GPIO list
- initialize PMBUS_ALERT_EN_N GPIO pin to low
- Remove adm1275 access directly from BMC
- update threshold to 0.65 for VR/VSA device
- Fix LCD debug card i2c bus number
- Correct GPIO/POST code descritpion sent to LCD debug card

* [Version]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Dec 20 2016 - 18:25:11 -0800) fbtp-v0.4
Linux bmc 4.1.15 #1 Tue Dec 20 18:25:40 PST 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v1.2


The change log for fbtp-v1.0.3 are:
===================================
* [Feature]

* [Bug Fix]
- Add delay for fan speed monitoring after power-on
- Add SEL log parser for NM exception
- Change CPU temperature error handling condition
- Fix dynamic threshold UNR side effect i.e occasionally see UNR failed message
- Fix the DRAM ECC register calculation by taking VGA reserved are in to account.

root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Nov 02 2016 - 11:56:16 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Wed Nov 2 11:54:43 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v1.0.3

The change log for fbtp-v1.0.2 are:
=================================
* [Feature]

* [Bug Fix]
- Fix WDT at u-boot to detect and reset during boot hang
- Use CPU temp's UCR based on TjMax which is available after power-on.
- Fix DRAM/ECC enable function in u-boot
- Fixed MB_FAN0_TACH error log will alert in BMC during run DC cycle test
- Add GPIO filter handler and fix “pwr_server_last_state”
- Fix SEL log decode logic for software NMI and CPU1 thermal status with reason code
- Add tmp421 remote sensors for inlet/outlet
- Fix python formatting issue in fscd
- Fix MB_VR_CPU1_VSA_POWER sensor reading issue
- Fix sol-util --force failure occasionally
- Update thresholds for various temperature UCR thresholds


root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Oct 26 2016 - 11:52:10 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Wed Oct 19 12:06:19 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v1.0.2

The change log for fbtp-v1.0.1 are:
=================================
* [Feature]

* [Bug Fix]
- Monitor GPIO signals to indicate cause of PROCHOT
- mask fscd generated spurious fan failure messages
- Initialize SCU registers for MEMHOT gpio signals
- Filter GPIO toggle events during host reboot using GPIOR5
- Add delay to fscd to avoid fan failure messages during boot up

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Oct 12 2016 - 14:55:59 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Wed Oct 12 10:10:19 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v1.0.1

The change log for fbtp-v1.0 are:
=================================
* [Feature]
- Enable RTC sync up with host and maintain date across reboots
- Show PWM input value along with RPM value in fan-util output

* [Bug Fix]
- Fix false log events about fan failures during sled cycle
- Fix false events about gpio events during sled cycle
- Update PCH_TEMP threshold value from 95C to 84C
- Fix order of GPIOX7 in gpiod daemon
- Use CPU1 occupied state while reporting CPU1 specific sensor values
- Use complete path for utils for BIOS update to allow remote execution via sshpass
- Export GPIO lines for remote debug feature
- Add SEL display for memory error log disabled event
- Support inband commands for set-global-enables, mtg-test, clear msg flags
- Enable DRAM ECC feature in u-boot

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Oct 10 2016 - 17:11:19 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Mon Oct 10 17:09:59 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v1.0


The change log for fbtp-v0.9.1 are:
=================================
* [Feature]
- BIOS Update functionality
- Application and JTAG Driver for CPLD Version

* [Bug Fix]
MSMI detect, and IERR/MCERR detect for both CATERR and MSMI
SMM KCS Channel for BIOS interrupt event
Change DIMM sensor names for DVT
Fix fscd fan failed when sled-cycle while DC off

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Sep 30 2016 - 15:35:12 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Fri Sep 30 15:32:44 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.9.1

* [Notes]
- BIOS Update needs sled-cycle
- When host is rebooted using reboot command, gpiod logs the GPIO signal transitions that seem to happen on EVT systems.
- MB_PCH_TEMP always shows as NA


The change log for fbtp-v0.9 are:
=================================
* [Feature]
- Add MSMI event and change CATERR address

* [Bug Fix]
- Etrack ID 186372: Some VR items information show "n/a" in BMC
- Etrack ID 186367: "MB_CPU0_TEMP" sensor value return 0 degree during stress test 17610 cycles.
- Etrack ID 186259: Fan UCR are 9000 on both single side and double side MB.
- Etrack ID 186247: Sled-cycle fail with double side HSC address rework MB.
- Fix ME sensor CPU1 TJMAX for platform FBTP

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Sep 13 2016 - 20:48:00 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Tue Sep 13 20:45:36 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.9

* [Notes]
- When host is rebooted using reboot command, gpiod logs the GPIO signal transitions that seem to happen on EVT systems.
- MB_PCH_TEMP always shows as NA


The change log for fbtp-v0.8 are:
=================================
* [Feature]
- Add gpiod daemon to monitor and log various GPIO based signal changes
- Add support for using CPU temperature for fan control in fscd
- Use Intel-ME as proxy to access HSC, CPU, DIMM, PCH temp sensors
- Add openbmc memory test function in u-boot

* [Bug Fix]
- Update fantable to work for both SS and DS systems
- Set fan UCT values based on SS vs. DS system
- Workaround to handle wrong NIC temperature reporting on CX4 Mezz Card
- Correct WinBond's Erase sector size from 4K to 64K to improve flashcp timing.
- Set fans to transitional speed instead of boost mode when fscd is down
- Fix SEL event parsing code's offset value to print even properly
- Keep JTAG engine in disabled mode at beginning and after CPLD version read
- Update CPU temperature UCT value dynamically based on CPU's Tj-MAX
- Add support for "LAN address enables" parameter for in-band command
- Make GPIOS3 as input for switching HSC access to ME
- Print CPLD device code in fw-util output along with version
- Assign i2c address for VRs based on EVT vs. DVT systems
- Add platform specific log clear api to fix error while using 'log-util all --clear"
- Start fscd after power-on host and check for explicit ON before starting fan control
- Fix ADC config to properly read Battery value

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Aug 29 2016 - 22:35:29 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Mon Aug 29 19:28:04 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.8

* [Notes]
- If using WinBond's SPI flash device, erase the whole flash before updating to this version.
- When host is rebooted using reboot command, gpiod logs the GPIO signal transitions that seem to happen on EVT systems.
- MB_PCH_TEMP always shows as NA


The change log for fbtp-v0.7 are:
=================================
* [Feature]
- Add crash dump script(dump.sh)
- Add support for OEM command 'set/get boot order'
- Add guid-util support to set/read Device/System GUID per RFC4122
- Add 'reset' option and remove 12V-* options from power-util
- Add support for inband command to read device/system GUID
- Add 'ipmi-util' to interact with IPMI stack using raw commands
- Move u-boot to latest v2016.07 version


* [Bug Fix]
- Correct platform name in SDR string from Yosemite->FBTP
- Increase DDR4 driving force in u-boot
- Update LCR threshold for VR/temp sensors
- Update correct initial state for GPIOs(UV_HIGH_SET, FM_PCH_BMC_THERMTRIP_N, FM_PMBUS_ALERT_BUF_EN_N, FM_CPU*_PROCHOT_LVT3_BMC_N, HSC_SMBUS_SWITCH_EN, FM_FAST_PROCHOT_EN_N)


* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2016.07;uname -a;cat /etc/issue
U-Boot 2016.07 (Aug 16 2016 - 13:33:07 -0700) fbtp-v0.4
Linux bmc 4.1.15 #1 Tue Aug 16 13:31:45 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.7

* [Notes]
- Need to do a fresh build due to get the new u-boot sources
- From now, fbtp will only be released as a single package and NO separate 'kernel' and 'rootfs' files.FYI, this is in preparation for upcoming secure verified boot feature.
- Updating the entire image can be done by simple command 'flashcp -v flash-fbtp /dev/mtd5'


The change log for fbtp-v0.6 are:
=================================
* [Feature]
- Add GPIO pin to indicate BMC_READY signal
- Add Version string to fscd config.json file
- Enable cfg-util to read/update power policy
- Change SoL feature to use dedicated UART1 stream
- Add support for Inband OEM command to read board ID
- Update fw-util output to show VR deviceID and checksum
- Add support for Inband command to get SoL Configuration
- Add CPLD image version output in fw-util
- Moved fido release to 1.8.2

* [Bug Fix]
- Increase IPMI packet max size from 100 to 300 bytes
- Disable NCSI function in u-boot to make host2bmc feature work.
- Define and use CONFIG_FTGMAC100_NCSI variable to control NCSI functionality

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Aug 08 2016 - 16:15:04) fbtp-v0.3
Linux bmc 4.1.15 #1 Mon Aug 8 16:13:51 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.6

* [Notes]
- Need to update entire flash as this release has u-boot changes
- Moved fido release to 1.8.2 and might need to create new build and handle any build dependencies
- For SoL to show Linux console, need to enable OS shell on ttyS1: @http://0pointer.de/blog/projects/serial-console.html. And also add ttyS1 in /etc/securetty


The change log for fbtp-v0.5.1 are:
=================================
* [Feature]
- Support/Fix DHCPv6 daemon automatic start

* [Bug Fix]
NA

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Jul 27 2016 - 14:58:19) fbtp-v0.2
Linux bmc 4.1.15 #1 Wed Jul 27 14:18:07 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.5.1


The change log for fbtp-v0.5 are:
=================================
* [Feature]
- Update U-Boot and Kernel to latest Aspeed SDK v3.22
- Apply power-policy for auto power on during sled cycle

* [Bug Fix]
- Fix me-util issue to transmit more than 16-bytes
- Fix ME version info in fw-util output
- Remove debug message while using power-util command
- Modify the me-util to print only the data portion
- Change blink rate for sled identify function
- Update VR/VSA threshold values

* [Notes]
- After updating f/w, need to remove old config on BMC before reset e.g. rm /mnt/data/kv_store/*
- Need to update entire flash as this release has u-boot changes


* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Jul 26 2016 - 16:19:18) fbtp-v0.2
Linux bmc 4.1.15 #1 Tue Jul 26 14:31:27 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.5


The change log for fbtp-v0.4 are:
=================================
* [Feature]
- Add NCSI support for Broadcom Mezzanine card
- Add GPIO support to control BIOS verbosity
- Add GPIO support to control Battery Sense mechanism
- Add support to read VR sensors for CPU0/VSA, CPU1/VSA, PCH/P1V05

* [Bug Fix]
- Fix kernel panic during reboot
- Update sensor thresholds to correct values
- Fix power reading of 0.00 for VR sensors
- Show VR version in fw-util output for all VR controllers
- Fix redundant fan/sensor events in log-util during power on/off

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Jul 19 2016 - 10:59:51) fbtp-v0.1
Linux bmc 4.1.15 #1 Tue Jul 19 16:11:17 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.4

The change log for fbtp-v0.3 are:
=================================
* [Feature]
- Support fw-util to read firmware versions (BIOS/ME/VR)
- Support me-util to communicate with Intel-ME
- Add support to read VR sensors (~36 sensors)
- Make sure fans are running at transient speed during BMC reset
- Add u-boot version string


* [Bug Fix]
- Fix IPMB slave communication issue in i2cdriver
- Remove various debug messages from console

* [Known Issues]
- Sensor-util reports 0.00 Watts for all VR/VDDQ/POWER sensors

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Jul 12 2016 - 11:47:45) fbtp-v0.1
Linux bmc 4.1.15 #1 Tue Jul 12 11:46:23 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.3

* Notes:
- Since this release has changes in u-boot, need to update the entire flash image

The change log for fbtp-v0.2 are:
=================================
* [Feature]
- Test LPC/KCS Driver
- Provide interface to Host user to interact via LPC
- Power Cycle entire SLED including BMC using HSC
- Read and print FRUID EEPROM contents
- Update FRUID EEPROM with user given file
- Chassis identification by blinking LED
- Heartbeat LED toggle at 50% duty cycle
- Record unknown SEL into syslog with 16-bytes raw data
- Implement FSC algorithm for inlet/nic temp sensors
- Support in-band commands (~20 commands)
- Enabled syslog to log critical events to Event Log


* [Bug Fix]
- Fixed occasional sensor-util N/A issue for temperature sensors


* [Release Info]
root@bmc:~#  strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Jul 05 2016 - 12:36:08)
Linux bmc 4.1.15 #1 Tue Jul 5 12:34:47 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.2


The change log for fbtp-v0.1 are:
=================================
* [Feature]
- Port platform specific u-boot changes
- Port platform specific kernel4.1 changes
- Port latest i2c driver to 4.1 kernel
- Port NCSI driver to 4.1 kernel
- Provide remote SSH access via Mezz/network
- Allow BMC to get IPv4 address using DHCPv4
- Support Power control functions(on/off/cycle)
- Allow user to interact with host console (aka SoL)
- Allow user to see the host console history
- Read the current status of sensors on MB and NIC
- Display threshold value and OK status for sensors
- Cache sensors to reduce hardware polling
- Ability to update BMC firmware from remote system
- Reset BMC remotely using 'reboot' command
- Support debug console when it is present
- Read firmware version for BMC firmware

* [Bug Fix]
NA

* [Release Info]
root@bmc:~# strings /dev/mtd0 | grep 2013.07;uname -a;cat /etc/issue
U-Boot 2013.07 (Jun 28 2016 - 10:30:14)
Linux bmc 4.1.15 #1 Tue Jun 28 10:28:55 PDT 2016 armv6l GNU/Linux
OpenBMC Release fbtp-v0.1

