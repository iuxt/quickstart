import os

def get_ipv6_addr():
    ipv6_addr = str(os.popen('ip a | grep "inet6.*global" | awk \'{print $2}\' | grep -v "^fe80::"').read())
    ipv6_addr = ipv6_addr.split("/")[0]
    print("ipv6_addr:", ipv6_addr)
    return ipv6_addr

