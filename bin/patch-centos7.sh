#!/bin/sh
# This script finshes all necessary patches,etc after installation of
# CentOS 7.9.2009 (Core) to make it deployment ready
# create and mount the NFS mounts /CAD, /PDK, /home/nfs1 /home/nfs2
# and then execute this script to finsih the rest of the installatioin:
#	* link /CAD/apps/etc/silicon.csh to /etc/profile.d/silicon.csh
#	* Create /home/local with req permissions 
#	* Check if hostname exists in /etc/hosts
#	* And load the remaining packages 
#	* Finally update 
# 01/18/2022 -srout
#
echo "*************************************"
echo "Checking CentOS Version"
echo "*************************************"
lsb_release -a | grep -i "Description"
echo ""

echo "*************************************"
echo "Linking (if does not exist) "
echo "/CAD/apps/etc/silicon.csh to /etc/profile.d/silicon.csh"
echo "*************************************"
if [ -f /etc/profile.d/silicon.csh ];
  then
    echo "/etc/profile.d/silicon.csh  EXISTS, check if it's the right one."
    echo ""
  else
    ln -s /CAD/apps/etc/silicon.csh /etc/profile.d/silicon.csh 
    echo "silicon.csh linked.."
    echo ""
fi
#
echo "*********************************************"
echo "CHECK (else CREATE) /home/local with 775 perm and users group"
echo "*********************************************"
#Check if /home/local exists
if [ -d /home/local ];
 then
   echo "/home/local EXISTS, with the following permissions:"
   ls -l /home | grep -w "local"
   echo ""
 else
   mkdir /home/local
   chmod 775 /home/local
   chgrp users /home/local
   echo "/home/local created with the req perms."
   echo ""
fi

echo "*************************************"
echo "CHECKING IF HOSTNAME IS IN /etc/hosts"
echo "*************************************"
myhost=$(hostname)
if grep -q $myhost /etc/hosts ; then
  echo "Hostname $myhost exists in /etc/hosts. Nothing to do here."
  echo ""
else
  echo "Hostname $myhost **DOES NOT** exists in /etc/hosts."
  echo ""
fi

echo "*************************************"
echo "CHECK ALL THE MOUNTS"
echo "Make sure the following are on the list:"
echo "/home/nfs1, /home/nfs2, /CAD, /PDK"
echo "*************************************"
mount -l -t nfs | awk '{print $3}'

echo "*************************************"
echo " CHECKING FOR PERL MODULE Shell.pm "
echo " Required for the Perl scripts." 
echo " NOTE: The firsrt time cpan is run,"
echo " it neds to get configured."
echo " Choose defaults and rerun 'cpan Shell'"
echo "*************************************"
cpan Shell

echo "*************************************"
echo "CHECKING INSTALLED PACKAGES"
echo "*************************************"
pckarr=( \
  environment-modules tree tigervnc-server subversion numpy \
  python-matplotlib tcl tk \ 
  glibc elfutils-libelf ksh mesa-libGL mesa-libGLU \
  motif libXp libpng libjpeg-turbo expat glibc-devel \
  gdb xorg-x11-fonts-misc xorg-x11-fonts-ISO8859-1-75dpi \
  redhat-lsb libXScrnSaver apr apr-util compat-db47 \
  xorg-x11-server-Xvfb mesa-dri-drivers openssl-devel \
)

#yum update -y
for i in  ${pckarr[*]}
 do
  isinstalled=$(rpm -q $i)
  #echo Package  $i 
  if [ !  "$isinstalled" == "package $i is not installed" ];
   then
    echo "$i **INSTALLED**"
  else
    echo "$i **DOES NOT EXIST**"
    yum install -y $i	# Installs without asking
  fi
done

## NOTE: The update part from the original scripts is not
## used right now.
updatedb
echo "*************************************"
echo "DONE CHECKING" 
echo "*************************************"

