# Linux Common Process

## Tested Linux Distributions

* AlmaLinux 9.2

## About

This Script takes the following actions

* Set the Timezone to Asia/Tokyo
* Update the System
* Installing: base development yum-utils
* Adding Repository: EPEL Remi
* Disable Unnecessary Services: atd kdump mdmonitor
* Remove Unnecessary Packages: cockpit
* Disable SELinux

## Usage

Execute the following command as a user with root privileges.

```
curl -s https://raw.githubusercontent.com/Takeru-Yamamoto/Linux-Common-Process/master/script.bash | bash
```
