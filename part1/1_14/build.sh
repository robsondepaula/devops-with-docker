#!/usr/bin/env bash

cd backend
docker build . -t hello-backend

cd ../frontend
docker build . -t hello-frontend

cd ..