#!/bin/bash

help() {
    cat <<-EOF
使用方法：
./enable -c xxx.conf
EOF
}

[ $# -eq 0 ] && help && exit 0

while getopts "ab:c:" arg           #选项后面的冒号表示该选项需要参数
do
    case $arg in
        a)
            echo "a $OPTARG"    #参数存在$OPTARG中
            echo a
        ;;
        b)
            echo "b $OPTARG"
        ;;
        c)
            echo "c $OPTARG"
            cp $(pwd)/$OPTARG ../conf.d/
        ;;
        ?)                     #当有不认识的选项的时候arg为?
            help
            exit 1
        ;;
    esac
done
