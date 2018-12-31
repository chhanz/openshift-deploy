#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'


# Check permission

if [ "$EUID" -ne 0 ]
  then echo -e "${RED}Please run as root ${NC}"
  exit
fi


# Check SElinux
echo -e "${RED} * * * * * Check Selinux * * * * * ${NC}"

selinux=`cat /etc/sysconfig/selinux  | grep "SELINUX=enforcing" | wc -l`

if [ "$selinux" -ne 1 ]
	then
	sed -i "s/^SELINUX=.*$/SELINUX=enforcing/" /etc/sysconfig/selinux
        echo -e "${RED}SElinux Change, Please System Reboot${NC}"
fi

# Firewalld disable
echo -e "${RED} * * * * * Check Firewalld * * * * * ${NC}"
systemctl disable firewalld
systemctl stop firewalld

# NetworkManager Check
echo -e "${RED} * * * * * Check NetworkManager * * * * * ${NC}"
systemctl enable NetworkManager
systemctl start NetworkManager

# preinstall yum package 

echo -e "${RED} * * * * * Preinstall Package * * * * * ${NC}"
yum -y install bash-com* wget git yum-utils createrepo epel-re* centos-release-openshift-origin39.noarch
yum clean all;yum repolist
yum -y install ansible docker

# docker enable
echo -e "${RED} * * * * * start docker service * * * * * ${NC}"
systemctl enable docker
systemctl start docker

# git clone
echo -e "${RED}openshift-ansible clone ${NC}"
cd ~
git clone https://github.com/openshift/openshift-ansible
cd openshift-ansible/
git checkout release-3.9

echo -e "${RED}= = = = = SCRIPT END = = = = = ${NC}"
