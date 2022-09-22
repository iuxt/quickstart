import configparser

config = configparser.ConfigParser()    #类中一个方法 #实例化一个对象
config.read("config.ini")

id = config["dnspod"]["id"]
key = config["dnspod"]["key"]
domain = config["dnspod"]["domain"]
sub_domain = config["dnspod"]["sub_domain"]
