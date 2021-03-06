#!/bin/bash

source "$PYTHONPATH/activate" && {

    python manage.py collectstatic --noinput;
    
    if [[ $EB_IS_COMMAND_LEADER == "true" ]];
    then 
        # log which migrations have already been applied
        python manage.py showmigrations;
        
        # migrate
        python manage.py migrate --noinput;
    else 
        echo "this instance is NOT the leader";
    fi
    
}