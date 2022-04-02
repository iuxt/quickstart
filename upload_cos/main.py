# -*- coding=utf-8
from json import load
from qcloud_cos import CosConfig
from qcloud_cos import CosS3Client
import sys
import logging
import time
import os
from dotenv import load_dotenv

load_dotenv()
now = time.strftime("%Y-%m-%d_%H%M%S", time.localtime())

filename = "halo-" + now

def backup(filename):
    command = "tar zc --exclude=logs " + os.getenv("backup_dir") + " -f " + filename + ".tar.gz"
    os.system(command)


def upload_cos(bucket, filename):
    # 正常情况日志级别使用INFO，需要定位时可以修改为DEBUG，此时SDK会打印和服务端的通信信息
    logging.basicConfig(level=logging.INFO, stream=sys.stdout)

    # 1. 设置用户属性, 包括 secret_id, secret_key, region等。Appid 已在CosConfig中移除，请在参数 Bucket 中带上 Appid。Bucket 由 BucketName-Appid 组成
    secret_id = os.getenv("secret_id")
    secret_key = os.getenv("secret_key")
    region = os.getenv("region")
    token = None
    scheme = 'https'

    config = CosConfig(Region=region, SecretId=secret_id, SecretKey=secret_key, Token=token, Scheme=scheme)
    client = CosS3Client(config)

    # 本地路径 简单上传
    response = client.put_object_from_local_file(
        Bucket=bucket,
        LocalFilePath=filename,
        Key=filename,
    )
    print(response['ETag'])

def clean_tmp(filename):
    os.remove(filename)

if __name__ == "__main__":
    try:
        backup(filename)
        upload_cos(os.getenv("bucket"), filename + ".tar.gz")
    finally:
        clean_tmp(filename + ".tar.gz")
