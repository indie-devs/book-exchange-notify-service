FROM python:3.10-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN mkdir /notify_app
WORKDIR /notify_app
COPY . /notify_app/

COPY requirements.txt /notify_app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user
