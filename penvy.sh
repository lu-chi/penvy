#!/usr/bin/env bash

[ -z "$1" ] && { echo "No argument provided... Quitting!"; exit 1; }

proj=$1
env="venv"
log="${proj}.log"

function init_project() {

    [ ! -d $1 ] && { mkdir $1; }
    virtualenv $1/$2 --verbose
    # virtualenv $proj/$env --no-site-packages --verbose
    source  $proj/$env/bin/activate
    cd $proj
    pip install yolk
    touch init.py
    # pip install -a requirements.txt
    pip install --upgrade pip
    
}

# pip freeze

[ -e $proj/$env/bin/activate ] && { echo "Project already exist."; exit 1; } 
init_project $proj $env >> $log

echo "# To activate: source ${proj}/${env}/bin/activate"
echo "# To search for installed packages: yolk -l"
echo "# To deactivate: deactivate"

