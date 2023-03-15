cd terraform

terraform init

terraform apply --auto-approve

mkdir ~/.kube/

terraform output kubeconfig > config

sed '1d;$d' config| cp /dev/stdin ~/.kube/config

rm config

cd ../deploy-laravel-app/

kubectl apply -f laravel-namespace.yml && kubectl apply -f laravel.yml && kubectl apply -f mysql-secret.yml && kubectl apply -f mysql.yml

sleep 30

kubectl get pods --no-headers -o custom-columns=":metadata.name" -n laravel| grep laravel | xargs echo > laravel-pod-name

export LARAVEL_POD_NAME="$(cat ./laravel-pod-name)"

rm laravel-pod-name

kubectl exec -n laravel -it $LARAVEL_POD_NAME -- service php8.1-fpm restart

kubectl exec -n laravel -it $LARAVEL_POD_NAME -- service nginx reload 

kubectl exec -n laravel -it $LARAVEL_POD_NAME -- php artisan migrate --seed 