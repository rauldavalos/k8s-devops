#!/usr/bin/env bash

target_env=${1}
if [[ -z "${target_env}" || ! -d "${target_env}" ]]; then
    echo "Syntax: $0 <target_environment_directory_name>"
    exit 1
fi

echo "+ Cleaning ${target_env}..."
kubectl delete -f ${target_env}/.

echo "Done!!!"
