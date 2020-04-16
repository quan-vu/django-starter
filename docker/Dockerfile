FROM python:3.6-alpine

# Set work directory
WORKDIR /usr/src/app

## Set environment variables
# Prevents Python from writing pyc files to disc
# Prevents Python from buffering stdout and stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# Install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

# Copy project
COPY ./app /usr/src/app/

# Copy entrypoint.sh
COPY ./docker/entrypoint.sh /usr/src/entrypoint.sh

# Run entrypoint.sh
ENTRYPOINT ["/usr/src/entrypoint.sh"]