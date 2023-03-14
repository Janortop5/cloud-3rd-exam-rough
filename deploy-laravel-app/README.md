# Deploy laravel app
```
kubectl create -f laravel-namespace.yml
kubectl create -f laravel.yml
kubectl create -f mysql-secret.yml
kubectl create -f mysql.yml
kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep laravel | xargs echo > laravel-pod-name
export LARAVEL_POD_NAME="$(cat ./laravel-pod-name)"
kubectl exec -it $LARAVEL_POD_NAME -- service php8.1-fpm restart
kubectl exec -it $LARAVEL_POD_NAME -- service nginx reload
kubectl exec -it $LARAVEL_POD_NAME -- php artisan migrate --seed
```
