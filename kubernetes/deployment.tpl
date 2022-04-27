apiVersion: apps/v1
kind: Deployment
metadata:
  name: moj-prototype-app
  namespace: ${KUBE_NAMESPACE}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: moj-prototype-app
  template:
    metadata:
      labels:
        app: moj-prototype-app
    spec:
      containers:
        - name: moj-prototype-app
          image: ${ECR_URL}:${IMAGE_TAG}
          env:
            - name: USERNAME
                valueFrom:
                  secretKeyRef:
                    name: basic-auth
                    key: username
            - name: PASSWORD
                valueFrom:
                  secretKeyRef:
                    name: basic-auth
                    key: password
          ports:
            - name: http
              containerPort: 3000