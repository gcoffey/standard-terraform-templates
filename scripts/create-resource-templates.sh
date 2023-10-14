#!/bin/bash

# Creates Jinja2 templates for Terraform resources w/ variable files

PROVIDER_DIR="./providers"
RESOURCE_PLAYBOOK="./playbooks/create-tf-resource-template.yml"

PROVIDER="${1}"
RESOURCE="${2}"
ARGS="${3}"

if [[ "${PROVIDER}" != "" && "${RESOURCE}" != "" ]];
then
  RESOURCE_DIR="${PROVIDER_DIR}/${PROVIDER}/${RESOURCE}"
  if [[ -d "${RESOURCE_DIR}" ]];
  then
    echo -e "Processing ${RESOURCE_DIR}"
    ansible-playbook ${RESOURCE_PLAYBOOK} --extra-vars "provider_name=${PROVIDER} resource_name=${RESOURCE}" ${ARGS}
  fi
  exit 0
fi

for p in `ls -1 ${PROVIDER_DIR}`;
do
  RESOURCE_DIR="${PROVIDER_DIR}/${p}"

  # Resource Templates
  for r in `ls -1 ${RESOURCE_DIR}`
  do
    if [[ -d "${RESOURCE_DIR}/${r}" ]];
    then
      echo -e "Processing ${RESOURCE_DIR}/${r}"
      ansible-playbook ${RESOURCE_PLAYBOOK} --extra-vars "provider_name=${p} resource_name=${r}" ${ARGS}
    fi
  done

done


