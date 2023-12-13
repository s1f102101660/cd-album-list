# Specify the base image
FROM python:3.8

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY pyproject.toml poetry.lock /app/

# Install poetry and project dependencies
RUN pip install poetry && poetry install

# Copy the project code into the container at /app
COPY . /app/

# Run migrations
RUN poetry run python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["poetry", "run", "python", "manage.py", "runserver", "0.0.0.0:8000"]
