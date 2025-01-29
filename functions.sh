#!/bin/bash

# Global Bash Functions
#
# Author: Raul A. Flores

echo "TEMP UnixConfig/functions.sh"


#| - rclone *******************************************************************
export root_tmp=Computing

rc_files()
#| - rc_files
{
export root_tmp=Computing

rc_pm &
rc_sc &
rc_ss &
rc_cc &
rc_git

wait

echo "Syncing with Dropbox finished!!!!!"
}
#__|


rc_pm()
#| - rc_pm (rclone Python Modules)
{

echo "WARNING | WARNING"
echo "Changed 00_PythonModules (2024-06-18), probably need to fix this method"
echo "WARNING | WARNING"

export root_tmp=Computing

rclone --transfers=4 sync \
$rclone_dropbox:$root_tmp/00_PythonModules \
$dropbox/$root_tmp/00_PythonModules

wait
echo "Syncing PythonModules folder from Dropbox finished"
}
#__|

rc_sc()
#| - rc_sc (rclone scripts)
{
echo ">>> Syncing Scripts folder"
export root_tmp=Computing

rclone --transfers=8 sync \
$rclone_dropbox:$root_tmp/00_scripts \
$dropbox/$root_tmp/00_scripts &

wait
echo ">>> Syncing Scripts folder from Dropbox finished"
}
#__|

rc_ss()
#| - rc_ss (rclone System Settings)
{
echo ">>> Syncing System Settings folder"
export root_tmp=Computing

rclone --transfers=8 sync \
$rclone_dropbox:$root_tmp/00_system_settings \
$dropbox/$root_tmp/00_system_settings &

# raul_dropbox:$root_tmp/00_system_settings \

wait
echo "<<< Syncing System Settings folder from Dropbox finished"
}
#__|

rc_cc()
#| - rc_pm (rclone Computer Clusters)
{
export root_tmp=Computing

rclone --transfers=4 sync \
$rclone_dropbox:$root_tmp/00_Computer_Clusters \
$dropbox/$root_tmp/00_Computer_Clusters

wait
echo "Syncing Computer_Clusters folder from Dropbox finished"
}
#__|

rc_git()
#| - rc_git (rclone git repos)
{
echo "Syncing git dir"
export root_tmp=Computing


rclone sync \
$rclone_dropbox:$root_tmp/00_git_repos \
$dropbox/$root_tmp/00_git_repos \
--tpslimit 10 \
--transfers=4 \
--exclude .git/ \
--exclude "out_data/**" \
--exclude "out_data*/**" \
--exclude "out_plot/**" \
--exclude "out_plot*/**" \
--exclude "__temp__/**" \
--exclude "__test__/**" \
--exclude "__old__/**" \
--exclude ".ipynb_checkpoints**" \
--exclude "__pycache__**" \
--exclude _______________________________________________/ \
--exclude PROJ_IrOx_OER/ \
--exclude _______________________________________________/ \
--exclude _OLD_REPOS/ \
--exclude _______________________________________________/ \
--exclude CAMD/ \
--exclude CHEMENG185B_DFT/ \
--exclude CatHub/ \
--exclude CatKit/ \
--exclude CatLearn/ \
--exclude Enumerator/ \
--exclude GPflow/ \
--exclude MPContribs/ \
--exclude MPInterfaces/ \
--exclude MpSuncatContribs/ \
--exclude PAPER_IrOx_Active_Learning_OER/ \
--exclude PAPER_IrOx_Active_Learning_OER-2.0/ \
--exclude PAPER_IrOx_Active_Learning_OER-2_collated.tex/ \
--exclude PAPER_IrOx_OER/ \
--exclude PROJ_IrOx_Active_Learning_OER__temp/ \
--exclude PROJ_active_mat_discovery/ \
--exclude PROJ_col_iro2/ \
--exclude PROJ_oxides_dft/ \
--exclude StructurePrototypeAnalysisPackage/ \
--exclude Supported_Graphene_2018_Paper/ \
--exclude THESIS_Raul_Flores/ \
--exclude ase/ \
--exclude ase.old/ \
--exclude ase-espresso/ \
--exclude espresso/ \
--exclude feature-selector/ \
--exclude joblib/ \
--exclude legion/ \
--exclude protosearch/ \
--exclude pymatgen/ \
--exclude pymatgen_mine/ \
--exclude qmpy/ \
--exclude qmpy_mine/ \
--exclude rclonesync-V2/ \
--exclude vossjo_espresso/ \
--exclude _______________________________________________/ \
--verbose

# --exclude PROJ_IrOx_Active_Learning_OER/ \
# --exclude PROJ_IrOx_OER/ \
# --exclude pymatgen-diffusion/ \
# --exclude TEMPLATES/ \

# raul_dropbox:$root_tmp/00_git_repos \

wait
echo "Syncing Git folder from Dropbox finished"

#| - __old__

# rclone sync \
# raul_dropbox:$root_tmp/00_git_repos \
# $dropbox/$root_tmp/00_git_repos \
# --tpslimit 10 \
# --transfers=4 \
# --exclude .git/ \
# --exclude "out_data/**" \
# --exclude "out_plot/**" \
# --exclude __old__/ \
# --exclude __temp__/ \
# --exclude out_data/ \
# --exclude out_plot/ \
# --exclude pymatgen/ \
# --exclude pymatgen_mine/ \
# --verbose

#__|

# --exclude ".git/**" \

}
#__|


# #########################################################
rc_git_small()
#| - rc_git_small (rclone only select, critical git repos)
{
echo "Syncing git dir (small version)"

export root_tmp=Computing/00_git_repos
export dropbox_TEST=$HOME/__temp__/2022-05-03__rclone_dev_test

# | - rclone_flags
export rclone_flags="
    --exclude _______________________________________________/ \
    --exclude .git/ \
    --exclude 'out_data/**' \
    --exclude 'out_data*/**' \
    --exclude 'out_plot/**' \
    --exclude 'out_plot*/**' \
    --exclude '__temp__/**' \
    --exclude '__test__/**' \
    --exclude '__old__/**' \
    --exclude '.ipynb_checkpoints**' \
    --exclude '__pycache__**' \
    --exclude _______________________________________________/ \
    --verbose
    "
# __|

echo ""
echo "Syncing following Git repos:"
echo "  TEMPLATES"
echo ""


# TEMPLATES -----------------------------------------------
rclone sync \
$rclone_dropbox:$root_tmp/TEMPLATES \
$dropbox/$root_tmp/TEMPLATES   \
${=rclone_flags} \
&

wait
echo "Syncing Git folder from Dropbox finished"
}
#__|
# #########################################################

rc_pp()
#| - rc_pp (rclone Python Packages)
{
echo ">>> Syncing Python Packages folder"
export root_tmp=Computing

rclone --transfers=8 sync \
$rclone_dropbox:$root_tmp/00_packages \
$dropbox/$root_tmp/00_packages &

# raul_dropbox:$root_tmp/00_packages \

wait
}

#__|

#__| **************************************************************************


#| - Git **********************************************************************
alias git_st='git status'

#__| **************************************************************************


#| - Search for files or text in files
search_phrase(){
  grep --exclude-dir={.ipynb_checkpoints,__pycache__,__old__} -inR "$1" .
}

search_phrase_py(){
  grep --exclude-dir={.ipynb_checkpoints,__pycache__,__old__} -inR "$1" **/*.py
}

search_file(){

  # grep --exclude-dir={.ipynb_checkpoints,__pycache__,__old__} -inR "$1" .
  # find . -name "$1"
  # find . -type d \( -name temp -o -name .ipynb_checkpoints -o \) -prune -false -o -name "run_unsub*"
  # find . -type d \( -name node_modules -o -name dir2               -o -path name \) -prune -false -o -name '*.json'
  # echo "IJFijsdidjfidsjtr678ikjhfder45tyuj"
  # echo "IJFijsdidjfidsjtr678ikjhfder45tyuj"
  # find . -type d \( -name temp \
  #     -o -name .ipynb_checkpoints -o -path name \) -prune -false -o -name "$1"

  find . -type d \( \
      -name __old__ -o \
      -name .ipynb_checkpoints -o \
      -path name \) -prune -false -o -name "$1"

}
#__|


#| - ASE **********************************************************************

ag()
#| - ag
{
  ase gui $1 &
}
#__|

#__| **************************************************************************


#| - Joe's Functions **********************************************************

all()
{
  for d in */
    do
      cd $d
      pwd
      ${@:1}
      cd ../
  done
}

cpall()
{
  for d in */ ; do
  cp $1 $d
  done
}

#__| **************************************************************************


hidden() { ls -a "$@" | grep '^\.'; }

tree_mine()
# | - tree_mine
{
    ignoredirs=""
    ignoredirs+="__old__|"
    ignoredirs+="__temp__|"
    ignoredirs+="__old__|"
    ignoredirs+="__test__|"
    ignoredirs+="out_data|"
    ignoredirs+="out_plot|"
    ignoredirs+="old*|"
    ignoredirs+="__pycache__|"
    ignoredirs+=".ipynb_checkpoints|"
    ignoredirs+="*SLURM_SUBMIT_DIR*|"

    # Ignore structure files, can have hundreds in a folder
    ignoredirs+="*.cif|"
    ignoredirs+="*.traj|"
    ignoredirs+="*.xyz|"

    # ignoredirs+="|"

    tree -I ${ignoredirs:0:(-1)} "$@"

    echo "Command:"
    # echo tree -I ${ignoredirs:0:(-1)} $1
    echo tree -I ${ignoredirs:0:(-1)} "$@"

    }

tree_mine_2()
# | - tree_mine
{
    # tree_mine -I "_1|_2|_3|_4|_5|_6|_7|_1-2|_1-3|_1-4|_1-5|_1-6|_2-2|_2-3|_2-4" "$@"
    tree_mine -I "_1*|_2*|_3*|_4*|_5*|_6*|_7*|_8*|_9*" "$@"
}

# __|

# COMBAK DELETE What was this
expsd()
#| - expsd
{
  export sd=$(<./.mirror_dir)
  echo "exporting sister dir to 'sd' system variable"
}
#__|

run()
#| - run
{
  $1 $2 2>&1 | tee $3
}
#__|

tail_mine()
#| - tail_mine
{
  tail -n 300
}
#__|

# #########################################################
# DFT | Computational Chemistry | Science
# #########################################################

vasp_grep_energy_OUTCAR()
#| - vasp_grep_energy_OUTCAR
{
# echo "Optional --all flag"

if [ "$1" = "--all" ]; then
   grep "energy without entropy" OUTCAR

else
  grep "energy without entropy" OUTCAR | tail -1

fi
}
#__|

vasp_grep_loop_time()
#| - vasp_grep_loop_time
{
grep "LOOP:  cpu time" OUTCAR | awk  '{print $7}'
}
#__|

# COMBAK These can go somewhere else

read_atoms()
#| - read_atoms
{
  # ipython -i "$sc"/01_dft/bin/read_atoms.py $1
  ipython -i "$sc"/01_dft/bin/read_atoms.py "$@"
}
#__|

read_atoms_2()
#| - read_atoms_2
{
  python -i "$sc"/01_dft/bin/read_atoms.py "$@"
}
#__|






catl()
#| - catl | cat specific line of file
{
  sed -n "$2{p;q}" $1
}
#__|

pwd_convert()
#| - pwd_convert_to_clipboard
{
  # Call once to print and then to capture to clipboard
  $sc/unix/bin/pwd_convert.py
  $sc/unix/bin/pwd_convert.py | clip.exe
}
#__|

file_to_clipboard()
#| - file_to_clipboard | cat specific line of file
{

  # echo "Pass -d flag to remove folders leading up to Dropbox/"

  # | - Processing command line flag arguments
  # local flag=false
  # OPTIND=1
  #
  # while getopts 't' opt; do
  #     case $opt in
  #         t) flag=true ;;
  #         *) echo 'Error in command line parsing' >&2
  #            exit 1
  #     esac
  # done
  # shift "$(( OPTIND - 1 ))"
  #
  # # local param1="$1"
  # # local param2="$2"
  # __|

  # | - Processing command line flag arguments
  local flag=false
  OPTIND=1

  while getopts 'd' opt; do
      case $opt in
          d) flag=true ;;
          *) echo 'Error in command line parsing' >&2
             exit 1
      esac
  done
  shift "$(( OPTIND - 1 ))"

  # local param1="$1"
  # local param2="$2"
  # __|

  # | - Generating file_path
  # echo "-----------"
  # echo "Full file path:"
  file_path="$(readlink -f $1)"  # ORIG
  # echo $file_path
  # echo ""
  # __|

  # echo "Path copied to clipboard:"
  # echo "TEMP COMBAK | For now, not trying to copy to clipboard, breaks Office Desktop w/ Windows 11:"
  if "$flag"; then
      echo "$(readlink -f $1 | cut -d'/' -f5-)"
      readlink -f $1 | cut -d'/' -f5- | xclip -selection clipboard
  else
      echo "$(readlink -f $1)"
      readlink -f $1 | xclip -selection clipboard
  fi

}
#__|

pwd_to_clipboard()
# | - pwd_to_clipboard
{
  PWD_var=$PWD
  NEW_PWD='"'$PWD_var'"'

  echo $NEW_PWD
  echo "$NEW_PWD" | xargs -0 | xclip -selection clipboard # Works


  #| - OLD
  # echo "$NEW_PWD" | xargs echo -n | xclip -selection clipboard
  # echo "$NEW_PWD" | xargs -0 echo -n | xclip -selection clipboard


  # $(eval echo $NEW_PWD)
  # $(eval echo $NEW_PWD) | xclip -selection clipboard
  #__|

}

# __|

find_f()
# | - find_f | Not sure
{
  echo "Finding $1"
  echo ""

  find . \
  -not -path "*__pycache__*" \
  -name $1
}
# __|

date_mine()
# | - date_mine
{
  date +%Y%m%d
  date +%Y%m%d | xclip -sel clip
}
# __|



# #########################################################
# Jupyter notebooks
# #########################################################

run_jupy()
# | - run_jupy
{
echo Converting $1 to python and running
echo ""

jupytext --to py $1

# echo "notebook_ex.ipynb" | cut -d'.' -f 1

FILENAME="$(echo $1 | cut -d'.' -f 1)"

FILENAMEPY=$FILENAME.py
python $FILENAMEPY

rm $FILENAMEPY
}

# __|
























# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################
# #############################################################################

# #############################################################################
# Aliases
# #############################################################################






#| - Jupyter
alias jlab='jupyter lab'
# alias jlab='jupyter lab --NotebookApp.iopub_data_rate_limit=1.0e10'

# jupyter nbconvert --to script *.ipynb
alias jconv_2py='jupyter nbconvert --to script $1'
#__|

#| - Chrome Apps
alias wf_app='chrome --app=https://workflowy.com/'

# Didn't work | 181025 | RF
# alias wf_app='chrome --hide-scrollbars --app=https://workflowy.com/'
# chrome --hide-scrollbars --app=https://workflowy.com/
#__|

#| - Bash Aliases
alias head='head -24'
alias space='df -h $HOME'
alias mkdir="mkdir -p"
alias hs='history | grep'

# Source and vim .bashrc file
# alias src='source $HOME/.bashrc'
alias src='source $HOME/.bashrc'

alias vrc='vim ~/.bashrc'

alias rmd='rm -r'
alias cp='cp -r'
alias di='display'
alias cl='clear'

# alias ls='ls --color=auto -I __pycache__ -I .ipynb_checkpoints -I *.pyc'
# alias ls='ls --color=auto --hide="*.pyc"'

alias clls='clear ; ls'
alias clsl='clear ; ls'
alias cls='clear ; ls'
alias clss='clear ; ls'
alias csl='clear ; ls'
alias lcs='clear ; ls'

alias cdd='cd'
alias ccd='cd'

alias pw='pwd'
alias pwdd='pwd'


alias ..='cd ..'
alias ...='cd ../..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'
alias 6.='cd ../../../../../..'
alias 7.='cd ../../../../../../..'
alias 8.='cd ../../../../../../../..'

#| - ls Aliases
# alias ls='ls --color=auto'

alias mls='ls --color=auto \
    -I "*.pyc" \
    -I "TEST1.py" \
    -I "TEST2.py" \
    -I "TEST3.py"'

# alias sl='ls'
alias lls='ls'

alias la='ls -a'
alias l='ls --format single-column -v'
alias lp='ls --format single-column -v *py'
alias lm='ls -l --block-size=MB'
alias lsd='ls -1p | grep "/$"'
#__|


alias size_sort='du -sh * | sort -hr'

alias size='du * -sh'
#__|

#| - SSH Aliases

# NERSC
alias nersc_ssh_key='$dropbox/Computing/00_Computer_Clusters/nersc/sshproxy.sh -u flores12'
alias edison='ssh -i ~/.ssh/nersc -Y flores12@edison.nersc.gov'
alias cori='ssh -i ~/.ssh/nersc -Y flores12@cori.nersc.gov'
alias ssh_perlmutter='ssh flores12@perlmutter-p1.nersc.gov'


# | - __old__

# # CAMD
# alias gbar='ssh -XY summer087@login.gbar.dtu.dk'

# echo "Removing alias for LRC ssh command"
# # LBNL LRC cluster
# alias ssh_lrc='ssh -XY raflores@lrc-login.lbl.gov'

# alias kin='kinit flores12@stanford.edu'


#| - OLD | Stanford
# #Sherlock
# # alias sher='ssh -XY flores12@sherlock.stanford.edu'
# alias sher='ssh -X flores12@login.sherlock.stanford.edu'

# #SLAC
# # alias slac='ssh -XY flores12@suncatls1.slac.stanford.edu'
# alias slac='ssh -XY flores12@suncatls3.slac.stanford.edu'
# alias slac2='ssh -XY flores12@suncatls2.slac.stanford.edu'

# # MISC
# alias corn='ssh -X flores12@corn.stanford.edu'
# alias rice='ssh -X flores12@rice.stanford.edu'
# alias rice_stacie='ssh -X staciek@rice.stanford.edu'
#__|

# __|

#__|



#| - Python Aliases
alias py='python'
alias pi='python -i'

# iPython
alias ipi='ipython -i'
alias ipi_test='ipython -i $sc/unix/ipython_start_script.py'
alias ipy='ipython'

alias read_pickle='ipi $sc/unix/bin/read_pickle.py $1'
#__|

#| - SLURM Aliases

# #########################################################
# | - squeue
alias squeue_mine='squeue -o"%.9i %.12P %.8j %.8u %.2t %.10M %.6D %.4C %Z" --me |(sed -u 1q; sort -k9)'
# __|


# #########################################################
alias slurm__status='sinfo -O "partition,available:6,time:.12,nodes:.6,nodeai:.12"'
#__|

# C++ Aliases
alias cr='g++ -std=c++11 -Wall -Wconversion -Wextra'



# Atom text editor
alias atoma='atom -a .'

# cbonsai
alias cbonsai_mine='cbonsai -L 75 -M 4 -l -p -i'

alias exp='explorer.exe .'


#| - __old__

# # AWS Aliases
# alias aws_ve='source $aws_dir/bin/activate ; cd $aws_dir/matr.io'
# alias awsd='cd $aws_dir/matr.io'

#__|
