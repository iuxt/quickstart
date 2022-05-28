#!/bin/bash -e

show_help() {
    echo "$0 [-h|-?|--help] [--ou ou] [--cn cn] [--email email]"
    echo "-h|--help    显示帮助"
    echo "--ou            设置组织或部门名，如: 技术部"
    echo "--cn            设置FQDN或所有者名，如: 冯宇"
    echo "--email         设置FQDN或所有者邮件，如: fengyu@example.com"
}

while [[ $# -gt 0 ]]
do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        --ou)
            OU="${2}"
            shift
            ;;        
        --cn)
            CN="${2}"            
            shift
            ;;
        --email)
            emailAddress="${2}"            
            shift
            ;;
        --)
            shift
            break
        ;;
        *)
            echo -e "Error: $0 invalid option '$1'\nTry '$0 --help' for more information.\n" >&2
            exit 1
        ;;
    esac
shift
done


# 国家名
C=CN
# 省
ST=Shanghai
# 市
L=Shanghai
# 公司名
O=张理坤
# 组织或部门名
OU=${OU:-demo}
# 服务器FQDN或授予者名
CN=${CN:-demo}
# 邮箱地址
emailAddress=${emailAddress:-demo@example.com}

mkdir -p "${CN}"

[ ! -f "${CN}/${CN}.key" ] && openssl req -utf8 -nodes -newkey rsa:2048 -keyout "${CN}/${CN}.key" -new -days 36500 -out "${CN}/${CN}.csr" -subj "/C=${C}/ST=${ST}/L=${L}/O=${O}/OU=${OU}/CN=${CN}/emailAddress=${emailAddress}"
[ ! -f "${CN}/${CN}.crt" ] && openssl ca -utf8 -batch -days 36500 -in "${CN}/${CN}.csr" -out "${CN}/${CN}.crt"
[ ! -f "${CN}/${CN}.p12" ] && openssl pkcs12 -export -CApath ./demoCA/ -inkey "${CN}/${CN}.key" -in "${CN}/${CN}.crt" -certfile "./demoCA/cacert.pem" -passout pass: -out "${CN}/${CN}.p12"
