import dnspod
import ipv6_addr
import os
import config

id = config.id
key = config.key
domain = config.domain
sub_domain = config.sub_domain
value = ipv6_addr.get_ipv6_addr()

a = dnspod.DnsPodApi(id + "," + key, domain)

if a.get_subdomain_info(sub_domain):
    if a.get_subdomain_info(sub_domain)[1] == value:
        print("记录已存在，值也是我需要的，不做修改")
    else:
        a.modify_record(sub_domain, a.get_subdomain_info(sub_domain)[0], value)
        print("修改现有的解析")
else:
    a.create_record(sub_domain, value)
    print("增加新的解析")
    

