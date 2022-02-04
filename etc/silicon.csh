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

## Project Alias's
alias volta	'module load projects/volta-rev1'
alias tesla-tt	'module load projects/tesla-rev1-tt'
alias amp	'module load projects/ampere-rev1'
alias fman	'module load projects/feynman-rev1'
alias fman-tt	'module load projects/feynman-rev1-tt'
##Training Aliases
alias t28-22-1	'module load trainings/t28hpc-22-1'
