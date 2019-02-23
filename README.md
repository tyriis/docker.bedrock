# Dockerfile for minecraft bedrock server

```
docker build -t tyriis/bedrock .
```

```
docker run -d -h bedrock --name=bedrock --network=host tyriis/bedrock:latest
```
