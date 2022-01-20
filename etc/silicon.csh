# Manually created on May 17, 2018 -Saroj Rout
# Contains Silicon/VLSI Lab specific environments
setenv SIPROJ_DIR	/home/nfs1/projects
setenv SVN_EDITOR vim
setenv EDITOR vim
setenv MGCLICPORT 1717
setenv CDSLICPORT 5280

##Since this script is executed twice, all appending has
# to be done conditionally to avoid multiple definition

# 
if ( "${MODULEPATH}" !~ */CAD/apps7/modulefiles* ) then
    setenv MODULEPATH	/CAD/apps7/modulefiles:$MODULEPATH
endif
#
if ( "${path}" !~ */CAD/apps7/bin* ) then 
    set path = (/CAD/apps7/bin $path)
endif

#Check if /local exists
if (! -d /home/local) then
   echo "WARNING /home/local DOES NOT EXISTS.."
   echo "Ask root to create  /home/local and change the group/permission to:"
   echo ">sudo chmod 775 /home/local; chgrp eng /home/local"
   echo "OR"
   echo "Use the script /CAD/apps7/bin/create-local"
endif

## Alias's
#alias xc06	'module load project/cad-xfab/xc06m3-18-a0-1.0'
#alias xt18	'module load project/cad-xfab/xt018-19-a0'
#alias xh18	'module load project/cad-xfab/xh018-20-a0'
#alias fman2	'module load project/cad-xfab/feynman-rev2'
#alias fman2-tt	'module load project/cad-xfab/feynman-rev2-tt18'
#alias von	'module load project/cad-xfab/neumann-rev1'
#alias amp	'module load project/cad-tsmc/ampere-rev1'
#alias tesla-tt	'module load project/cad-xfab/tesla-rev1-tt18'
#alias tesla	'module load project/cad-xfab/tesla-rev1'
