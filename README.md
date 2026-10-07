# Simple Node.js App

A small web server built with Node.js and its built-in `http` module.

## Run

```bash
npm start
```

Open http://localhost:3000 in your browser.

Health check: http://localhost:3000/health

## Docker

Build and run the image:

```bash
docker build -t simple-node-app:1.0.0 .
docker run --rm -p 3000:3000 simple-node-app:1.0.0
```

## Kubernetes

Load the image into your cluster if it is a local cluster, then apply the manifest:

```bash
kubectl apply -f k8s/app.yaml
kubectl port-forward service/simple-node-app 3000:80
```

Open http://localhost:3000.

## Terraform

The Terraform configuration deploys the same Kubernetes Deployment and Service:

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Use either the Kubernetes manifest or Terraform for a cluster, rather than applying both at the same time.
