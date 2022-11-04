import dnspod
import ipv6_addr
import config
import logging

#默认的warning级别，只输出warning以上的
#使用basicConfig()来指定日志级别和相关信息

logging.basicConfig(level=logging.DEBUG #设置日志输出格式
                    ,filename="log.log" #log日志输出的文件位置和文件名
                    ,format="%(asctime)s - %(name)s - %(levelname)-9s - %(filename)-8s : %(lineno)s line - %(message)s" #日志输出的格式
                    # -8表示占位符，让输出左对齐，输出长度都为8位
                    ,datefmt="%Y-%m-%d %H:%M:%S" #时间输出的格式
                    ,encoding="utf-8"
                    )

id = config.id
key = config.key
domain = config.domain
sub_domain = config.sub_domain
value = ipv6_addr.getIPv6Address()

a = dnspod.DnsPodApi(id + "," + key, domain)

if a.get_subdomain_info(sub_domain):
    if a.get_subdomain_info(sub_domain)[1] == value:
        logging.info("记录已存在，值也是我需要的，不做修改")
    else:
        a.modify_record(sub_domain, a.get_subdomain_info(sub_domain)[0], value)
        logging.info("修改现有的解析")
else:
    a.create_record(sub_domain, value)
    logging.info("增加新的解析")
    

