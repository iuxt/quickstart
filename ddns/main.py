import cloud_api.dnspod as dnspod
import cloud_api.namesilo as namesilo
import ipv6_addr
import configparser

config = configparser.ConfigParser()    #类中一个方法 #实例化一个对象
config.read("config.ini")

if config["main"]["cloud_api"] == "dnspod":
    id = config["dnspod"]["id"]
    key = config["dnspod"]["key"]
    domain = config["dnspod"]["domain"]
    sub_domain = config["dnspod"]["sub_domain"]
elif config["main"]["cloud_api"] == "namesilo":
    key = config["namesilo"]["key"]
    domain = config["namesilo"]["domain"]
    sub_domain = config["namesilo"]["sub_domain"]


real_value = ipv6_addr.getIPv6Address()

def dnspod_check():
    a = dnspod.DnsPodApi(id + "," + key, domain)

    if a.get_subdomain_info(sub_domain):
        if a.get_subdomain_info(sub_domain)[1] == real_value:
            print("记录已存在，值也是我需要的，不做修改")
        else:
            a.modify_record(sub_domain, a.get_subdomain_info(sub_domain)[0], real_value)
            print("修改现有的解析")
    else:
        a.create_record(sub_domain, real_value)
        print("增加新的解析")
    

def namesilo_check():
    a = namesilo.NamesiloApi(domain=domain, key=key)
    record_value = a.get_record(sub_domain).get("value")
    print(record_value)
    if record_value == real_value:
        print("不用更新")
    else:
        print("调用更新方法")
    

if __name__ == "__main__":
    namesilo_check()
