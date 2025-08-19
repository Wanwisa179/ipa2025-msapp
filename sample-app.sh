#!/bin/bash

rm -rf tempdir
rm -rf web

mkdir web
mkdir web/templates
mkdir web/static

cp sample_app.py web/.
cp -r templates/* web/templates/.
cp -r static/* web/static/.

echo "COPY  requirements.txt ." >> web/Dockerfile
echo "COPY  ./static /home/myapp/static/" >> web/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> web/Dockerfile
echo "COPY  sample_app.py /home/myapp/" >> web/Dockerfile

echo "FROM python:3.11-slim" >> web/Dockerfile
echo "RUN pip install --no-cache-dir --progress-bar off flask" >> web/Dockerfile
echo "RUN pip install pymongo" >> web/Dockerfile
echo "RUN pip install -r requirements.txtS">> web/Dockerfile

echo "EXPOSE 8080" >> web/Dockerfile
echo "CMD python3 home/myapp/sample_app.py" >> web/Dockerfile

cd web
docker build -t web .
docker run -d -p 27017:27017 --network app-net -v mongo-data:/data/db --name mongo mongo:6
docker run -d -p 8080:8080 --network app-net --name web web
