
    
# Dockerfile for the investerpool_co_uk service
# Set the base image to use for this service
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /app

# Copy the Django project files into the container
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install django gunicorn
RUN pip install -r requirements.txt

# Expose the port that Gunicorn will listen on
EXPOSE 8000

# Command to run the Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "ecommerce.wsgi:application"]

    
