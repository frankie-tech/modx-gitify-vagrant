#! /bin/bash
if ! [[ "$PWD" == [/vagrant$] ]]; then
    echo "Moving to right directory"
    echo "$PWD -> $PWD/vagrant"
    cd ./vagrant
    echo "Now in $PWD"
fi

STATUS=0
while getopts :cushd option
do
case "${option}" in
    c)
        vagrant status
        #? Why will this not echo the status?
        #? Can this be echoed outside of the loop?
        # STATUS=$(($?))
        # echo $STATUS
        ;;
    u)
        vagrant up
        ;;
    s)
        vagrant ssh
        ;;
    h)
        vagrant halt
        exit 0
        ;;
    d)
        vagrant destroy
        exit 0
        ;;
    \?)
        echo -e "Invalid option: $@ is not a valid option"
        echo -e "Valid options are:"
        echo -e "    -c"
        echo -e "    -u"
        echo -e "    -s"
        echo -e "    -h: Halts Vagrant VM to be used later, will be listed as "
        echo -e "    -d: Destroys Vagrant VM, will be listed as 'not created' by \`vagrant global-status\`"
        ;;
    *)
        echo -e "there has been an error"
        exit 1
        ;;
esac
done
exit 0;