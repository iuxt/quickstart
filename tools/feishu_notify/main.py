from dotenv import load_dotenv
import requests
import time
import os
import json
import sys

# 加载.env 文件中的环境变量
load_dotenv() 

# 获取环境变量的值
url = os.getenv("url") 
sign_key = os.getenv("sign_key") 


import hashlib
import base64
import hmac

def gen_sign(timestamp, secret):
    # 拼接timestamp和secret
    string_to_sign = '{}\n{}'.format(timestamp, secret)
    hmac_code = hmac.new(string_to_sign.encode("utf-8"), digestmod=hashlib.sha256).digest()

    # 对结果进行base64处理
    sign = base64.b64encode(hmac_code).decode('utf-8')

    return sign


timestamp = str(round(time.time()))
print(timestamp)

data = {
        "timestamp": timestamp,
        "sign": gen_sign(timestamp=timestamp, secret=sign_key),
        "msg_type": "interactive",
        "card": {
            "elements": [{
                    "tag": "div",
                    "text": {
                            "content": "**西湖**，位于浙江省杭州市西湖区龙井路1号，杭州市区西部，景区总面积49平方千米，汇水面积为21.22平方千米，湖面面积为6.38平方千米。",
                            "tag": "lark_md"
                    }
            }, {
                    "actions": [{
                            "tag": "button",
                            "text": {
                                    "content": "更多景点介绍 :玫瑰:",
                                    "tag": "lark_md"
                            },
                            "url": "https://www.example.com",
                            "type": "default",
                            "value": {}
                    }],
                    "tag": "action"
            }],
            "header": {
                    "title": {
                            "content": "luck告警",
                            "tag": "plain_text"
                    }
            }
        }
}


header = {'Content-Type': 'application/json'}

r = requests.post(url=url, headers=header, data=json.dumps(data))
print(r.text)