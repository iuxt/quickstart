import requests
import xml.etree.ElementTree as ET

class NamesiloApi:
    def __init__(self, key, domain) -> None:
        self.key = key
        self.domain = domain

    def get_record(self, sub_domain):
        params = {
            "version": 1,
            "type": "xml",
            "key": self.key,
            "domain": self.domain
        }

        r = requests.request(method="GET", url="https://www.namesilo.com/api/dnsListRecords", params=params)

        root = ET.XML(r.text)

        print(root.tag)

        for resource_record in root.iter('resource_record'):
            data = {}
            if resource_record.findtext("host") == sub_domain:
                data["host"] = resource_record.findtext("host")
                data["type"] = resource_record.findtext("type")
                data["value"] = resource_record.findtext("value")
                return data
        return None
