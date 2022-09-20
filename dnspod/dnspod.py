import requests
import json

class DnsPodApi:
    def __init__(self, token, domain) -> None:
        self.token = token
        self.domain = domain

    def get_record_info(self):
        """
        获取记录详情
        """
        data = {
            "login_token": self.token,
            "format": "json",
            "domain": self.domain
        }
        r = requests.post("https://dnsapi.cn/Record.List", data=data)
        return r.json()["records"]

    def create_record(self, sub_domain, value):
        """
        创建记录
        """
        data = {
            "login_token" : self.token,
            "format": "json",
            "domain": self.domain,
            "sub_domain": sub_domain,
            "record_type": "A",
            "record_line": "默认",
            "value": value
        }
        r = requests.post("https://dnsapi.cn/Record.Create", data=data)
        print(r.json())

    def get_subdomain_id(self, sub_domain):
        for i in self.get_record_info():
            if i["name"] == sub_domain:
                return i["id"]
        return None
    
    def modify_record(self, sub_domain, record_id, value):
        data = {
            "login_token" : self.token,
            "format": "json",
            "domain": self.domain,
            "sub_domain": sub_domain,
            "record_id": record_id,
            "record_type": "A",
            "record_line": "默认",
            "value": value
        }
        r = requests.post("https://dnsapi.cn/Record.Modify", data=data)
        print(r.json())


a = DnsPodApi(token="345512,xxxxx", domain="babudiu.com")

# print(a.get_subdomain_id("t-box"))
# a.create_record("aaa", "1.1.2.2")

if a.get_subdomain_id("t-box"):
    a.modify_record("t-box", a.get_subdomain_id("t-box"), "8.8.8.8")
else:
    a.create_record("t-box", "9.9.9.9")