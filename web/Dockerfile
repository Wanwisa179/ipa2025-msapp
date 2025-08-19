FROM python:3.11-slim
COPY  requirements.txt .
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
COPY  sample_app.py /home/myapp/
RUN pip install --no-cache-dir --progress-bar off flask
RUN pip install pymongo
RUN pip install -r requirements.txt

EXPOSE 8080
CMD python3 home/myapp/sample_app.py
