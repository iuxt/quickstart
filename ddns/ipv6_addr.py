import os
import requests

def get_ipv6_addr():
    ipv6_addr = str(os.popen('ip a | grep "inet6.*global" | awk \'{print $2}\' | grep -v "^fe80::"').read())
    # cat /proc/net/if_inet6
    ipv6_addr = ipv6_addr.split("/")[0]
    print("ipv6_addr:", ipv6_addr)
    return ipv6_addr

def getIPv6Address():
    text = requests.get('https://v6.ident.me').text
    return text


if __name__ == "__main__":
    print(getIPv6Address())
