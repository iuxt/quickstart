FROM python:3.9-alpine3.16
ADD . /root
RUN pip install -r /root/requirements.txt
RUN echo "* * * * * python main.py" >> /etc/crontabs/root
CMD cd /root && /root/entrypoint.sh

