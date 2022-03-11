#!/bin/sh
# This script adds the quota to the /home/local/simulation
# 02/12/2022 -srout
#
echo "*********************************************"
echo " Quota for /home/local/simulation"
echo "*********************************************"
#Check if /home/local/simulation exists
if [ -d /home/local/simulation ];
 then
   ##Sometimes the kickstarter is not setting the permissions
   ##properly. So redoing it just to make sure
   echo "Setting permissions"
   chgrp localsim /home/local/simulation
   chmod g=swrx,+t /home/local/simulation
   # Now set the quota
   echo "Adding quota for /home/local/simulation..."
   xfs_quota -x -c 'project -s localsim' /home
   xfs_quota -x -c 'limit -p bsoft=95G bhard=100G localsim' /home
   echo ""
   echo "Quota report for /home..."
   xfs_quota -x -c 'report -h' /home
 else
   echo "ERROR: /home/local/simulation DOES NOT EXIST" 
   echo "CREATING ...."
   echo ""
   mkdir -p /home/local/simulation
   echo "Setting Permissions"
   chgrp localsim /home/local/simulation
   chmod g=swrx,+t /home/local/simulation
   # Now set the quota
   echo "Adding quota for /home/local/simulation..."
   xfs_quota -x -c 'project -s localsim' /home
   xfs_quota -x -c 'limit -p bsoft=95G bhard=100G localsim' /home
   echo ""
   echo "Quota report for /home..."
   xfs_quota -x -c 'report -h' /home
fi
