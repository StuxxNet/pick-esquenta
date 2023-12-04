#!/bin/bash

NAMESPACE_LIST=($(kubectl get ns --no-headers | awk -F" " '{print $1}'))

for NAMESPACE in "${NAMESPACE_LIST[@]}"
do
    echo "Checando PDB no namespace ${NAMESPACE}"
    PDB_LIST=($(kubectl get pdb -n ${NAMESPACE} --no-headers | awk -F" " '{print $1}'))
    for PDB in "${PDB_LIST[@]}"
    do  
        echo "Deletando PDB ${PDB} do namespace ${NAMESPACE}"
        kubectl delete pdb ${PDB} -n ${NAMESPACE}
    done
done