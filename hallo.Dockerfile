# Use ubuntu as the base image
FROM ubuntu:latest

# Set working directory
WORKDIR /app

# Update apt package index and install necessary packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Copy the application code into the container
COPY . /app

# Install application dependencies
RUN pip3 install -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Set the entrypoint and default command
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

