# kubectl apply -f backend-deployment.yaml
# kubectl apply -f backend-service.yaml

# kubectl apply -f frontend-deployment.yaml
# kubectl apply -f frontend-service.yaml

# 1. Create the "frontend" namespace
kubectl create namespace frontend

# 2. Deploy frontend microservices to the "frontend" namespace
kubectl apply -f frontend-deployment.yaml --namespace=frontend
kubectl apply -f frontend-service.yaml --namespace=frontend

# 3. Create the "backend" namespace
kubectl create namespace backend

# 4. Deploy backend microservices to the "backend" namespace
kubectl apply -f backend-deployment.yaml --namespace=backend
kubectl apply -f backend-service.yaml --namespace=backend
