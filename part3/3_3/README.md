The docker-compose.yml, works simply by running:
```
docker-compose up
```

Changes needed for the previous tests to pass:
* Remove ENV definition in each Dockerfile, they overwrite the ones on docker-compose
* Configure nginx to the other routes