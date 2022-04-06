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

#Check if /home/local/simulation exists
set localsim = /home/local/simulation/$USER 
if (! -d $localsim ) then
   #echo "!!WARNING!! /home/local/simulation/"$USER" DOES NOT EXISTS.."
   #echo "Creating it..."
   mkdir $localsim
endif

## Project Alias's
alias volta	'module load projects/volta-rev1'
alias tesla-tt	'module load projects/tesla-rev1-tt'
alias amp	'module load projects/ampere-rev1'
alias fman	'module load projects/feynman-rev1'
alias fman-tt	'module load projects/feynman-rev1-tt'
alias fman2	'module load projects/feynman-rev2'
alias fman2-tt	'module load projects/feynman-rev2-tt'
##Training Aliases
alias sky-22-1		'module load trainings/sky-22-1'
alias t28-22-1		'module load trainings/t28hpc-22-1'
alias xc06-22-1		'module load trainings/xc06-22-1'
alias xt18-22-1		'module load trainings/xt018-22-1'
