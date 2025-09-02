FROM python:3.11-slim
COPY  requirements.txt .
COPY  database.py /home/myapp/
COPY  producer.py /home/myapp/
COPY  scheduler.py /home/myapp/
RUN pip install pika
RUN pip install -r requirements.txt

CMD python3 /home/myapp/scheduler.py