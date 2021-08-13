#!/usr/bin/env bash

cd backend
docker run -d -p 8080:8080 hello-backend

cd ../frontend
docker run -d -p 5000:5000 hello-frontend
