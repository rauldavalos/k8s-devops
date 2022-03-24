#!/usr/bin/env bash

function pause {
    echo -n "> Execution paused. Press enter to continue..."
    read -r cont
}

target_env=${1}
if [[ -z "${target_env}" || ! -d "${target_env}" ]]; then
    echo "Syntax: $0 <target_environment_directory_name>"
    exit 1
fi

echo "+ Installing secrets..."
kubectl apply -f ${target_env}/02-secrets.yaml
echo "+ Installing Storage Class..."
kubectl apply -f ${target_env}/02-storage-storageclass.yaml
echo "+ Installing Peristent Volume Claim..."
kubectl apply -f ${target_env}/02-storage-pvc.yaml

pause

echo "+ Deploying DB..."
kubectl apply -f ${target_env}/02-db-deployment.yaml
echo "+ Starting DB Service..."
kubectl apply -f ${target_env}/02-db-service.yaml

pause

echo "+ Deploying WordPress..."
kubectl apply -f ${target_env}/02-wordpress-deployment.yaml
echo "+ Starting WordPress Service..."
kubectl apply -f ${target_env}/02-wordpress-service.yaml

pause

echo "+ Forwarding Service Port to the outside..."
kubectl port-forward service/wordpress-service 8080:80&

echo "Done!!!"

# Diffs
#     02-storage-storageclass.yaml
#     02-storage-pvc.yaml
#     02-wordpress-service.yaml
