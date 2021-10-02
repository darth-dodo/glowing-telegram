#https://medium.com/@samwelkanda/how-to-initialize-a-django-project-with-poetry-and-docker-ef4997006f2f

FROM python:3.9-slim-buster

ENV \
  # python:
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  # pip:
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  # poetry:
  POETRY_VERSION=1.1.10 \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_CACHE_DIR='/var/cache/pypoetry'

# System deps
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    bash \
    build-essential \
    curl \
    gettext \
    git \
    libpq-dev \
    wget \
  # Cleaning cache
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
  && pip install "poetry==$POETRY_VERSION" && poetry --version


# set work directory
WORKDIR /src/glowing-telegram/
COPY glowing-telegram/pyproject.toml ./
COPY glowing-telegram/poetry.lock ./

# Install dependencies
RUN poetry install

# copy project
COPY ./glowing-telegram ./


CMD poetry run python main.py
