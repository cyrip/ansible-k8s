# ansible-k8s
Create k8s cluster witth ansible

## Get ArgoCD default password for user admin
```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
