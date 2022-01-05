# Build & Push Image
FROM ubuntu:20.04
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Copying install_dependencies.sh & give permissions
COPY install_dependencies.sh /
RUN chmod +x /install_dependencies.sh

# Install dependencies
RUN ./install_dependencies.sh

# Update the system
RUN apt-get update
RUN /usr/bin/python3 -m pip install --upgrade pip

# Install python package
COPY requirements.txt /
RUN pip3 --no-cache-dir install --upgrade setuptools && \
    pip3 --no-cache-dir install wheel && \
    pip3 --no-cache-dir install -r requirements.txt
	
# Making home & test folders
RUN mkdir dockerdemo
RUN mkdir tests

# Copying test files
COPY /tests/test_import.py /tests
COPY /tests/run_tests.sh /tests

# Giving permission to tests to run
RUN chmod +x /tests/test_import.py
RUN chmod +x /tests/run_tests.sh

# Run Tests  
RUN /tests/run_tests.sh

WORKDIR "docker-demo"
