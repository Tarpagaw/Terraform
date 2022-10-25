From python:latest
RUN pip install --upgrade pip
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
ADD . /app
RUN export TC_DYNAMO_TABLE=Candidates
EXPOSE 8000
ENTRYPOINT ["python3"]
CMD ["test_candidates.py"]