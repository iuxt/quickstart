import requests

# cat /proc/net/if_inet6

def getIPv6Address():
    text = requests.get('https://6.ipw.cn').text
    return text


if __name__ == "__main__":
    print(getIPv6Address())
