#!/bin/sh
#
if [ $# -lt 2 ]
then
  echo " "
  echo "Usage: clean-nfs <option>"
  echo " "
  echo "DESCRIPTION:  Cleans the NFS mounts of disk space hogging files/dir"
  echo "  OPTIONS:"
  echo "  nfs2L1 du:    disk usage .mozilla, .cache/mozilla in /home/nfs2"
  echo "  nfs2L1 rm:    cleans .mozilla, .cache/mozilla in /home/nfs2"
  echo "  nfs2L2 du:    disk usage DRC/LVS files in /home/nfs2"
  echo "  nfs2L2 rm:    cleans DRC/LVS files in /home/nfs2"
  echo "  nfs2L3 du:    disk usage core,... in /home/nfs2"
  echo "  nfs2L3 rm:    cleans core,... in /home/nfs2"
  echo " "
  exit 1
fi

if [ $1 == "nfs2L1" ] && [ $2 == "du" ] ;  then
  echo "#################################"
  echo "# disk usage of   .mozilla , .cache/mozilla /home/nfs2"
  echo "#################################"
  find /home/nfs2 -type d -name .mozilla -exec du -BM -s {} \;
  find /home/nfs2 -type d -name .cache -exec du -BM -s {}/mozilla \;
fi 


if [ $1 == "nfs2L1" ] && [ $2 == "rm" ] ;  then
  echo "#################################"
  echo "# REMOVING .mozilla , .cache/mozilla in /home/nfs2#"
  echo "#################################"
  find /home/nfs2 -type d -name .mozilla -exec rm -rf {} \;
  find /home/nfs2 -type d -name .cache -exec rm -rf {}/mozilla \;
fi 

if [ $1 == "nfs2L2" ] && [ $2 == "du" ] ;  then
  echo "#################################"
  echo "# disk usage of DRC/LVS file "
  echo "#################################"
  #find /home/nfs2 -type f -name "*.drc.*" -exec ls {} \;
  find /home/nfs2 -type f -name "*.calibre.db" -exec du -Bk {} \;
  ## Assura DRC/LVS
  find /home/nfs2 -type f -name "*_DRC.*" -exec du -Bk {} \;
  find /home/nfs2 -type f -name "*_LVS.*" -exec du -Bk {} \;
  find /home/nfs2 -type d -name "*_LVS.lvsdb" -exec du -Bk -s {} \;
fi 


if [ $1 == "nfs2L2" ] && [ $2 == "rm" ] ;  then
  echo "#################################"
  echo "# removing DRC/LVS file "
  echo "#################################"
  find /home/nfs2 -type f -name "*.calibre.db" -exec rm -f {} \;
  ## Assura DRC/LVS
  find /home/nfs2 -type f -name "*_DRC.*" -exec rm -f {} \;
  find /home/nfs2 -type f -name "*_LVS.*" -exec rm -f {} \;
  find /home/nfs2 -type d -name "*_LVS.lvsdb" -exec rm -rf {} \;
fi 

if [ $1 == "nfs2L3" ] && [ $2 == "du" ] ;  then
  echo "#################################"
  echo "# disk usage of core, .. "
  echo "#################################"
  find /home/nfs2 -type f -name "core.*" -exec du -Bk {} \;
fi 

if [ $1 == "nfs2L3" ] && [ $2 == "rm" ] ;  then
  echo "#################################"
  echo "# REMOVING core, .. "
  echo "#################################"
  find /home/nfs2 -type f -name "core.*" -exec rm -f {} \;
fi 
