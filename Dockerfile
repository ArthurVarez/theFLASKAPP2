FROM python:latest 

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt 

COPY . /app

ENV FLASK_APP=app.py

EXPOSE 5000 

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts
RUN chmod +x /scripts/wait-for-it.sh
ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]


CMD ["python","app.py","runserver","--host=0.0.0.0","--threaded"]
