FROM python:3.11-slim
COPY  requirements.txt .
COPY  database.py /home/myapp/
COPY  callback.py /home/myapp/
COPY  consumer.py /home/myapp/
COPY  worker.py /home/myapp/
COPY  router_client.py /home/myapp/
RUN pip install netmiko
RUN pip install ntc_templates
RUN pip install -r requirements.txt

CMD python3 /home/myapp/worker.py
