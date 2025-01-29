#!/bin/bash

# Creating a new config file | 2025-01-24
#
# Author: Raul A. Flores


echo "TEMP UnixConfig/bashrc.sh"


#| - Global Settings
# source $sys_sett/functions.sh
# source $sys_sett/aliases.sh
# source $sys_sett/sys_settings.sh

source $UnixConfig/functions.sh

#__|

#| - WSL Settings
# # source $sys_sett/00_system_specific/wsl/bashrc.sh
# source $sys_sett/00_system_specific/wsl/bash_paths.sh
# source $sys_sett/00_system_specific/wsl/bash_aliases.sh
# source $sys_sett/00_system_specific/wsl/bash_functions.sh
#__|

#| - WSL | Desktop Settings
# source $sys_spec_sett/bash_aliases.sh
# # source $sys_spec_sett/bash_functions.sh
# source $sys_spec_sett/bash_paths.sh
#__|

# source $sys_sett/00_system_specific/software_launch.sh


# #########################################################

# # alias ls='ls --color=auto -I __pycache__ -I .ipynb_checkpoints -I *.pyc'
# alias ls='ls --color=auto'

# # Activate default conda environment
# conda activate default

# export DISPLAY=:0

# dircolors
eval "$(dircolors $UnixConfig/dircolors.256dark.0)";

