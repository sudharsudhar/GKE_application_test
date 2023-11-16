# Build and push backend image
docker build -t gcr.io/glass-handler-404405/backend:latest backend/
docker push gcr.io/glass-handler-404405/backend:latest

# Build and push frontend image
docker build -t gcr.io/glass-handler-404405/frontend:latest frontend/
docker push gcr.io/glass-handler-404405/frontend:latest
