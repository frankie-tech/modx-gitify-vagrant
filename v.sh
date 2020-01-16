#! /bin/bash
if ! [[ $PWD = [^/vagrant$] ]]; then
    echo "Moving to right directory"
    cd $PWD/vagrant
fi

while getopts :ushd option
do
case "${option}" in
    u)
        vagrant up
        exit 0
        ;;
    s)
        vagrant ssh
        exit 0
        ;;
    h)
        vagrant halt
        exit 0
        ;;
    d)
        vagrant destroy
        exit 0
        ;;
    *)
        echo -e "there has been an error"
        exit 1
        ;;
esac
done
exit 0;