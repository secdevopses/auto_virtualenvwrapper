#!/bin/bash

# The virtualenvwrapper will be activated automatically when you enter the directory.
# Installation:
#   Add this line to your .bashrc or .bash-profile:
#
#       source /path/to/secdevops_auto_virtualenvwrapper.sh
#

_auto_virtualenvwrapper() {

    _VENV_NAME=$(basename `pwd`)
    _VENV_PATH=$WORKON_HOME/$_VENV_NAME

    if [ -e "$_VENV_PATH" ]; then
        # Check to see if already activated to avoid redundant activating
        if [ "$VIRTUAL_ENV" != "$_VENV_PATH" ]; then
            _VENV_NAME=$(basename `pwd`)
            echo Activating virtualenvwrapper \"$_VENV_NAME\"...
            VIRTUAL_ENV_DISABLE_PROMPT=1
            source $WORKON_HOME/$_VENV_NAME/bin/activate
            _OLD_VIRTUAL_PS1="$PS1"
            PS1="($_VENV_NAME)$PS1"
            export PS1
        fi
    else 
        if [ "$VIRTUAL_ENV" != "" ]; then
            if [[ "$(pwd)" == *"$(basename $VIRTUAL_ENV)"* ]]; then
                echo ""
            else
                if [ "$VIRTUAL_ENV" != "$(pwd -P)" ]; then
                    echo Deactivating virtualenvwrapper \"$(basename $VIRTUAL_ENV)\"...
                    deactivate
                fi
            fi    
        fi       
    fi
}

export PROMPT_COMMAND=_auto_virtualenvwrapper
