# AS Documentation and Installation Guide

## Index
* [Prequisite](#prerequisite)
* [Build your AS](#build-your-as)
* [Save Configuration](#save-configuration)
* [Restore Configuration](#restore-configuration)
* [Access your AS](#access-your-as)
* [Cleanup the AS](#cleanup-the-as)


We run our mini-Internet on a server with Ubuntu 22.04.

## Prerequisite

To build your AS, you need to install the following software:

### Install Ubuntu VM

**1. Download Oracle VirtualBox**

Download Oracle VirtualBox from this [link](https://www.oracle.com/virtualization/technologies/vm/downloads/virtualbox-downloads.html).
Choose the appropriate installer based on your operating system.

:information_source:If you get a warning about Python core package and win32api bindings just ignore it.

**2. Download an Ubuntu Image**

Download an Ubuntu 22.04 image from this [link](https://releases.ubuntu.com/22.04/?_gl=1*j6ymv8*_gcl_au*MTgyMjQ4MzM5My4xNzQxMjkzMzI1&_ga=2.62694187.686985968.1741293324-83998459.1741293324). Choose desktop image so that you have a GUI.

**3. Setup the new virtual machine**

Follow [step 2](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#2-create-a-new-virtual-machine) and [step 3](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#3-install-your-image) of this tutorial to create a new VM and install your image.

:information_source:If you want to enable some extra features like Copy and Paste between the VM and the host, resize of the VM window etc. check the **Guest Additions** button during the [Create a user profile](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#p-66495-create-a-user-profile) part of the tutorial and use the ISO `VBoxGuestAdditions.iso`. This image file is located in the installation directory of Oracle VirtualBox.   
For example in windows: `c:\Program Files\Oracle\VirtualBox\VBoxGuestAdditions.iso`

Turn off your VM to be able to change the settings:
* Select your VM
* Click **Settings**
* Go to **General** > **Advanced**
* Find the **Shared Clipboard** option and select **Bidirectional**
* Click OK to save changes

:information_source:If you try to open the termimal but it fails to open then do the following: 
* Open settings
* Go to and Region and Language and switch language to some other (for example Canadian English) 
* Restart the VM and the terminal will work
* After you can switch back to the original language

**4. Add your user as sudo:**

Type:

`su -`

This will log you in as root. Your prompt should change to a "#". Then type:

`sudo adduser [username] sudo`

Where [username] is your user name. This adds your user to the sudo users list.  

Reboot or logout and log back in to have the changes take effect.

**5. Stay as superuser**

Run the following command to be able to run sudo commands wihout having to type your password:

`sudo su`

This will make you root.

### Install Docker Engine & Open vSwitch

Run the following script to install Docker Engine and Open vSwitch:
```bash
./requirements.sh
```

### Install OpenSSL

First check if OpenSSL is already downloaded with:

```bash
openssl version
```
If the response is something like the following then you are good to go:
```bash
OpenSSL 1.1.1f  31 Mar 2020
```

Otherwise intall OpenSSL:
```bash
sudo apt install openssl -y
```

## Build your AS

Install git:
```bash
apt install git -y
```

To build the AS, first clone this [repository](https://github.com/pavlos646/hy335b).
```bash
git clone https://github.com/pavlos646/hy335b.git
```

Run the initialization script using your group number as the parameter:

:information_source: Your group number will be your ASN (Autonomous System Number)

```bash
./init.sh <group_number>
```
For example, if your group number is 42, the command would look like this:
```bash
./init.sh 42
```

## Access your AS

You can use the `goto.sh` script to access a host, switch or router.  

**Access Hosts**

`./goto.sh UNIV <host_name>`

For instance if you want to access the host student_1 in the L2 topology, use the following command:

`./goto.sh UNIV student_1`

**Access Routers**

`./goto.sh <router_name> router`

For instance if you want to access the router ZURI, use the following command:

`./goto.sh ZURI router`

**Access Switches**

`./goto.sh UNIV <switch_name>`

For instance if you want to access the switch CERN, use the following command:

`./goto.sh UNIV CERN`

Once in a host, switch or router, just type `exit` to go back to your terminal.


## Save configuration

To save configuration files for your routers and hosts, run the following script:

`./save_configs.sh`

## Restore configuration

To restore your configuration from the files you previously saved, run the following script:

`./restore_configs.sh`


## Cleanup the AS

The are two ways to delete the AS. First, you can delete all the virtual ethernet pairs, docker containers and OVS switches processes used by the AS, with the following command:
```
./cleanup/cleanup.sh .
```

However, this script uses the configuration files, thus if they have changed since the time the AS was built, or if the AS did not setup properly, it might be that not all the components get deleted. That could be problematic if you try to start a new AS. We thus also provide a script that deletes *all* the ethernet pairs, containers and switches.

:warning: This also includes containers, switches and ethernet pairs which do not belong to your AS (e.g., other Docker containers you may have)!!!

If you do not have other Docker containers running then do not worry about running this script.

```
./mini_internet_project/platform/cleanup/hard_reset.sh
```

