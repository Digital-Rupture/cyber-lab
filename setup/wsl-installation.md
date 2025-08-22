# 🐧 WSL Installation Guide - Windows 11

## Windows Requirements for WSL

Windows (10 version 2004) and higher or Windows 11 to enter the commands found in this guide.

## Initial WSL Installation Steps

**If WSL is already installed, skip to `Linux Installation with WSL`**

 1. Begin by right clicking the **Start Menu** icon, then choose **Terminal (Admin)**.

 2. Enter `wsl --install` into the command line, allow the download and installation to complete.
    - WSL will ***NOT*** work until the computer is restarted.

 3. Once the install is finished, restart your computer and WSL is ready to use.

## Linux Installation with WSL

1. Once the restart is complete, WSL is now available on your Windows 11 machine. Confirm this by opening a terminal, and typing `wsl --version`. This should output the current version of WSL.

2. To start a Linux environment, enter `wsl --install`, this will install the default distribution (Ubuntu).

3. You have now successfully deployed a usable Linux environment within Windows using WSL. Simply type `wsl` into the terminal, and the default Linux will start.

4. Continue reading this guide for further information, including finding other Linux distros, accessing Microsoft's WSL documentation, and managing your WSL environments.

## WSL Commands and Installing Other Linux Distros

- To view the available options, enter `wsl --help`, this will bring up the help list for further WSL commands.

- The command `wsl --list --online` will list all Linux Distros currently available for download.

- If you wish to install a different Linux Distro, use the command `wsl --install --distribution distroName`, with `distroName` being replaced with your chosen distribution from the availability list (e.g. kali-linux, debian, opensuse).

- To open your non-default distro simply type `wsl --distribution [distro]` within the terminal. You may also click the down arrow next to the terminal tab at the top of the window, a list of your available distro terminals will appear.
