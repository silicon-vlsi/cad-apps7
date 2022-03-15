#!/bin/sh
#
if [ $# -ne 1 ]
then
  echo " "
  echo "Usage: post-install-centos7.sh <option>"
  echo " "
  echo "DESCRIPTION:  Options are "
  echo "  all:       runs the entire scripts"
  echo "  addhosts:  Adds hostnames to /etc/hosts"
  echo "  mkmnt:     Makes all the mount points /CAD etc"
  echo "  fstab:     appends the NFS mounts to /etc/fstab"
  echo "  pkg:       Install all the necessary packages"
  echo "  link:      Creates the soft links silicon.csh and cron.daily.silicon"
  echo "  nis:       Sets up the NIS server"
  echo "  localsim:  sets up /home/local/simulation"
  echo "  localdoc:  creates /home/local/docs"
  echo " "
  exit 1
fi

if [ $1 == "addhosts" ] || [ $1 == "all" ]
then
  echo "ADDING hostnames in /etc/hosts"
  cat >> /etc/hosts <<EOF
192.168.11.221  srv01.vlsi.silicon.ac.in srv01
192.168.11.229  srv02.vlsi.silicon.ac.in srv02 srv02.silicon.ac.in cdslicserv mgclicsrv.vlsi.silicon.ac.in mgclicserv
192.168.11.237  srv03.vlsi.silicon.ac.in srv03
EOF

fi


if [ $1 == "mkmnt" ] || [ $1 == "all" ]
then
  mkdir /CAD
  chown nfsnobody:nfsnobody /CAD
  mkdir /PDK
  chown nfsnobody:nfsnobody /PDK
  mkdir /home/nfs1
  chown nfsnobody:nfsnobody /home/nfs1
  mkdir /home/nfs2
  chown nfsnobody:nfsnobody /home/nfs2
fi


if [ $1 == "fstab" ] || [ $1 == "all" ]
then
  echo "ADDING MOUNT POINTS TO /etc/fstab"
  cat >> /etc/fstab <<EOF
# NFS mounts from srv01.vlsi.silicon.ac.in
srv01:/home/nfs1  /home/nfs1      nfs     noatime,rsize=32768,wsize=32768
srv01:/home/nfs2  /home/nfs2      nfs     noatime,rsize=32768,wsize=32768
srv01:/CAD        /CAD            nfs     noatime,rsize=32768,wsize=32768
srv01:/PDK        /PDK            nfs     noatime,rsize=32768,wsize=32768
EOF

mount -a
fi

if [ $1 == "pkg" ] || [ $1 == "all" ]
then
  echo "CHECKING AND INSTALLING PACKAGES:"
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

fi


if [ $1 == "link" ] || [ $1 == "all" ]
then
  echo "Linking silicon.sh and cron.daily.silicon"
  # Link silicon.csh
  if [ ! -f /etc/profile.d/silicon.csh ]
  then
    ln -s /CAD/apps7/etc/silicon.csh /etc/profile.d/.
  fi
  #Link cron.daily
  if [ ! -f /etc/cron.daily/cron.daily.silicon ]
  then
    ln -s /CAD/apps7/bin/cron.daily.silicon /etc/cron.daily/.
  fi
fi


if [ $1 == "nis" ] || [ $1 == "all" ]
then
  echo "SETTING UP NIS CLIENT"
  # Setup NIS client
  ypdomainname vlsi.silicon.ac.in
  echo "NISDOMAIN=vlsi.silicon.ac.in" >> /etc/sysconfig/network
  authconfig --enablenis --nisdomain=vlsi.silicon.ac.in --nisserver=srv01.vlsi.silicon.ac.in --update
  systemctl start rpcbind ypbind
  systemctl enable rpcbind ypbind

  echo "NIS SERVER SET TO:"
  ypwhich
fi


if [ $1 == "localsim" ] || [ $1 == "all" ]
then
  echo "SETTING UP /home/local/simulation..."
  if [ ! -d /home/local/simulation ]
  then
    mkdir -p /home/local/simulation
  fi
  chgrp localsim /home/local/simulation
  chmod g=swrx,+t /home/local/simulation

  # set quota for the /home/local/simulation
  echo 01:/home/local/simulation >> /etc/projects
  echo localsim:01 >> /etc/projid
fi


if [ $1 == "localdoc" ] || [ $1 == "all" ]
then
  echo "CREATING /home/local/doc"
  if [ ! -d /home/local/docs ]
  then
    mkdir -p /home/local/docs
  fi
fi
