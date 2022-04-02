# -*- coding=utf-8
from json import load
from qcloud_cos import CosConfig
from qcloud_cos import CosS3Client
import sys
import logging
import shutil
import time
import os
from dotenv import load_dotenv

load_dotenv()
now = time.strftime("%Y-%m-%d_%H%M%S", time.localtime())

filename = "halo-" + now


def backup(filename):
    shutil.make_archive(filename, 'zip', os.getenv("backup_dir"))


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

    #### 高级上传接口（推荐）
    # 根据文件大小自动选择简单上传或分块上传，分块上传具备断点续传功能。
    response = client.upload_file(
        Bucket=bucket,
        LocalFilePath=filename,
        Key=filename,
        PartSize=1,
        MAXThread=10,
        EnableMD5=False
    )
    print(response['ETag'])

def clean_tmp(filename):
    os.remove(filename)

if __name__ == "__main__":
    try:
        backup(filename)
        upload_cos(os.getenv("bucket"), filename + ".zip")
    except:
        clean_tmp(filename + ".zip")
    clean_tmp(filename + ".zip")