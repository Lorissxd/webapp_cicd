# start by pulling the python image
FROM python:3.12

# copy every content from the local file to the image
COPY . /app

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

WORKDIR /./app
# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

EXPOSE 8080

CMD ["main.py"]
