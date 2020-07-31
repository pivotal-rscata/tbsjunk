#! /usr/bin/env bash

echo "Images"
kubectl delete images -n tbs-demo --all
echo "CCBs"
kubectl delete custombuilder -n tbs-demo --all
echo "Stacks"
kubectl delete stacks --all
echo "Stores"
kubectl delete stores --all
echo "Secrets"
kubectl delete secrets -n tbs-demo --all
echo "Namespace"
kubectl delete ns tbs-demo