FROM python:slim-bullseye

# install all the dependencies except libcairo2 from jessie
RUN apt-get -y update \
    && apt-get install -y \
    python3-pip python3-cffi python3-brotli libpango-1.0-0 libpangoft2-1.0-0 \
    && apt-get -y clean

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

COPY server.py .
CMD ["python3", "server.py"]
