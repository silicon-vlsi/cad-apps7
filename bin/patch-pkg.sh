#!/bin/sh
# This scripts checks for essential installation 
# CentOS 7.9.2009 (Core) to make it deployment ready
#
echo "*************************************"
echo "Checking CentOS Version"
echo "*************************************"
lsb_release -a | grep -i "Description"
echo ""


echo "*************************************"
echo "CHECKING INSTALLED PACKAGES"
echo "*************************************"
pckarr=( \
  environment-modules tree tigervnc-server subversion \
  numpy python-matplotlib tcl tk ypbind rpcbind \
  glibc glibc.i686 elfutils-libelf ksh mesa-libGL \ 
  mesa-libGLU motif libXp libpng libjpeg-turbo \
  expat glibc-devel gdb xorg-x11-fonts-misc \
  xorg-x11-fonts-ISO8859-1-75dpi redhat-lsb \
  libXScrnSaver apr apr-util compat-db47 \
  xorg-x11-server-Xvfb mesa-dri-drivers openssl-devel \ 
  cronie-anacron \
)

for i in  ${pckarr[*]}
 do
  isinstalled=$(rpm -q $i)
  #echo Package  $i 
  if [ !  "$isinstalled" == "package $i is not installed" ];
   then
    echo "--installed** $i"
  else
    echo "**NOT INSTALLED** INSTALLLING $i"
    yum install -y $i	# Installs without asking
  fi
done

## NOTE: The update part from the original scripts is not
## used right now.
#updatedb
echo "*************************************"
echo "DONE CHECKING" 
echo "*************************************"

