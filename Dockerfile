FROM python:3.15.0a7-slim-trixie

# working directory in the container
WORKDIR /app

RUN apt update && \
	apt upgrade && \
	apt install -y --no-install-recommends procps
	
# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the app directory contents into the container
COPY runserver.py .
COPY ./ClientPortal ./ClientPortal

# Set environment variables
ENV SERVER_HOST=0.0.0.0
ENV SERVER_PORT=5555
ENV FLASK_ENV=production
ENV DB=later_dude

# Specify that the container listening port
EXPOSE 5555

# Define the command to run the application
CMD ["python", "runserver.py"]
