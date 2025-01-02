FROM python:3.11-alpine

WORKDIR /app

COPY requerimientos.txt .

RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev && \
    pip install --no-cache-dir -r requerimientos.txt && \
    apk del gcc musl-dev python3-dev libffi-dev

COPY . .
WORKDIR /app/apiproject
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
