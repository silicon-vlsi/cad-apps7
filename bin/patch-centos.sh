#!/bin/sh
# This script finshes all necessary patches,etc after installation of
# CentOS 7.9.2009 (Core) to make it deployment ready
#
echo "*************************************"
echo "Checking CentOS Version"
echo "*************************************"
lsb_release -a | grep -i "Description"
echo ""

#
echo "*********************************************"
echo "CHECK /home/local/docs" 
echo "*********************************************"
#Check if /home/local exists
if [ -d /home/local/docs ];
 then
   echo ""
 else
   mkdir /home/local/docs
   echo ""
fi

echo "*********************************************"
echo "CHECK if /etc/cron.daily/cron.daily.silicon EXISTS"
echo "*********************************************"
#
if [ -f /etc/cron.daily/cron.daily.silicon ];
  then
    echo "CHECK: file exists"
    echo ""
  else
    echo "DOESN'T EXIST: creating the link"
    ln -s /CAD/apps7/bin/cron.daily.silicon /etc/cron.daily/.
    echo ""
fi


echo "*************************************"
echo "INSTALLING REQ PACKAGES"
echo "*************************************"
pckarr=( \
  cronie-anacron \
)
#pckarr=()
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

