#!/bin/bash

# Globals
BINARY="bin/bs.jar"
AUTO_PATH="automation_inputs/"

main() {
    print_separator "AUTOMATION TESTS"

    option=$(
        dialog --backtitle "AUTOMATION TESTS v0.1"\
            --title "Which automation test do you want to run?"\
            --cancel-label "EXIT"\
            --ok-label "SELECT"\
            --menu "Please select an option:"\
            13 80 5\
            "E1.TC1"            "Quick match, player doesn't fail."\
            "E5.TC2"            "Overlaping ships in setup."\
            "E1.TC2"            "Normal game both players shoot."\
            "E3.TC1"            "Ply1: letters for coors Ply2: number for orientation."\
            "<All of them>"     "Run all the previous tests."\
            3>&1 1>&2 2>&3 3>&-\
    )

    local quit=$?

    clear

    if [ $quit -eq 1 ]; then exit 0; fi

    local res=0

    echo "##################### START TEST #########################"
    echo
    echo

    case $option in
        
        ## All the cases
        "<All of them>")
            (\
                java -jar $BINARY "${AUTO_PATH}E1.TC1" &&\
                java -jar $BINARY "${AUTO_PATH}E5.TC2" &&\
                java -jar $BINARY "${AUTO_PATH}E1.TC2" &&\
                java -jar $BINARY "${AUTO_PATH}E3.TC1" \
            ) || res=1
        ;;
        ## Only one in specific
        *)
            java -jar $BINARY "${AUTO_PATH}$option"
            res=$?
        ;;
    esac

    echo
    echo
    echo "##################### END TEST #########################"
    echo
    
    if [ $res -eq 0 ]; then
        echo "SUCCESSFUL TEST!"
    else
        echo "TEST DID FAIL, PLEASE REVIEW THE OUTPUT!"
    fi
    
    echo "Press any key to go back to the test selection menu....."
    read -r    

    main
}

main

