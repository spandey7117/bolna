FROM python:3.10.13-slim

WORKDIR /app
COPY ./requirements.txt /app
COPY ./quickstart_server.py /app

RUN apt-get update && apt-get install libgomp1 git -y
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y --no-install-recommends ffmpeg
RUN pip install -r requirements.txt


EXPOSE 5001
CMD ["uvicorn", "quickstart_server:app", "--host", "0.0.0.0", "--port", "5001"]
