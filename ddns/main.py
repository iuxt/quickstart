import cloud_api.dnspod as dnspod
import cloud_api.namesilo as namesilo
import ipv6_addr
import logging
import configparser

#默认的warning级别，只输出warning以上的
#使用basicConfig()来指定日志级别和相关信息

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


logging.basicConfig(level=logging.DEBUG #设置日志输出格式
                    ,filename="log.log" #log日志输出的文件位置和文件名
                    ,format="%(asctime)s - %(name)s - %(levelname)-9s - %(filename)-8s : %(lineno)s line - %(message)s" #日志输出的格式
                    # -8表示占位符，让输出左对齐，输出长度都为8位
                    ,datefmt="%Y-%m-%d %H:%M:%S" #时间输出的格式
                    ,encoding="utf-8"
                    )

real_value = ipv6_addr.getIPv6Address()

def dnspod_check():
    a = dnspod.DnsPodApi(id + "," + key, domain)

    if a.get_subdomain_info(sub_domain):
        if a.get_subdomain_info(sub_domain)[1] == real_value:
            logging.info("记录已存在，值也是我需要的，不做修改")
        else:
            a.modify_record(sub_domain, a.get_subdomain_info(sub_domain)[0], real_value)
            logging.info("修改现有的解析")
    else:
        a.create_record(sub_domain, real_value)
        logging.info("增加新的解析")
    

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
