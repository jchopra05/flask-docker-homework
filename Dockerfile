FROM ubuntu:20.04

LABEL maintainer="Jaanvi Chopra jchopra@cmc.edu"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

RUN pip3 install --upgrade pip && pip3 install --upgrade flask


# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]

