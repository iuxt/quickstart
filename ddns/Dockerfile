FROM python:3.9-alpine3.16
ADD . /root
RUN pip install -r /root/requirements.txt
RUN echo "*/10 * * * * python main.py" >> /etc/crontabs/root
CMD crond -f
