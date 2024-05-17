FROM python:3.9-slim

WORKDIR /data

# install required packages for system Like mysql Client library to run mysql commands & remove all temporary files
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

#copy alll content
COPY . .

# Specify the command to run your application
CMD ["python", "app.py"]
