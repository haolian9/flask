FROM python:3.6-jessie

COPY . /app

RUN cd /app && pip install -e .

entrypoint ["/app/docker/entrypoint.sh"]
