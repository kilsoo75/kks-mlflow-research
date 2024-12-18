#!/bin/bash
set -e

APP_VERSION=0.1.0
APP_NAME=kks-mlflow-app

# docker build -t localhost/${APP_NAME}:${APP_VERSION} .
docker build --platform linux/amd64 -t localhost/${APP_NAME}:${APP_VERSION} .
docker tag localhost/${APP_NAME}:${APP_VERSION} v2-zcr.cloudzcp.io/cloudzcp/${APP_NAME}:${APP_VERSION}
docker push v2-zcr.cloudzcp.io/cloudzcp/${APP_NAME}:${APP_VERSION}
