install
cdrom
lang en_US.UTF-8
keyboard us
network --onboot yes --device eth0 --bootproto dhcp --noipv6
rootpw --plaintext vagrant
firewall --enabled --service=ssh
authconfig --enableshadow --passalgo=sha512
selinux --disabled
timezone UTC
bootloader --location=mbr

text
skipx
zerombr

clearpart --all --initlabel
autopart

auth  --useshadow  --enablemd5
firstboot --disabled
reboot

%packages --nobase
  @core
%end

%post
/usr/bin/yum -y install sudo
/usr/sbin/groupadd vagrant
/usr/sbin/useradd vagrant -g vagrant -G vagrant
echo "vagrant"|passwd --stdin vagrant
echo "vagrant    ALL=(ALL)    NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
%end
