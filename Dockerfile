FROM python:3.12.7-slim

WORKDIR /application

RUN apt-get update && \
    apt-get install -y cmake g++ gcc && \
    rm -rf /var/lib/apt/lists/*


# RUN python3 -m pip install --user -U pip setuptools
    # python3 -m pip install --user pipx && \
    # python3 -m pipx ensurepath && \
    # pipx install poetry --python python3.12

# RUN poetry shell \
#     && poetry config virtualenvs.create false \
#     && poetry config virtualenvs.in-project true \
#     && poetry install

# RUN python3 -m venv /application/.venv && \
#     source /application/.venv/bin/activate && \
#     pip install --no-cache-dir -r requirements.txt

RUN python -m venv /application/.venv && \
    /application/.venv/bin/pip install --upgrade pip setuptools && \
    /application/.venv/bin/pip install poetry

COPY . .

RUN /application/.venv/bin/poetry install --no-cache --without quality

# RUN pip install --no-cache-dir -r requirements.txt
# RUN /bin/sh -c "source /application/.venv/bin/activate && \
#  pip install --no-cache-dir -r requirements.txt"

EXPOSE 5050

CMD ["/application/.venv/bin/mlflow", "server", "--port", "8080", "--host", "0.0.0.0"]
