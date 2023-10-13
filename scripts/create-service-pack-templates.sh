#!/bin/bash

# Creates Jinja2 templates for Terraform resources w/ variable files

PROVIDER_DIR="./providers"
SP_DIR="./service-packs"
SP_PLAYBOOK="./playbooks/service-pack-resource-template.yml"

PROVIDER="${1}"
SERVICEPACK="${2}"

if [[ "${PROVIDER}" != "" && "${SERVICEPACK}" != "" ]];
then
  SERVICEPACK_DIR="${SP_DIR}/${PROVIDER}/${SERVICEPACK}"
  if [[ -d "${SERVICEPACK_DIR}" ]];
  then
    echo -e "Processing ${SERVICEPACK_DIR}"
    ansible-playbook ${SP_PLAYBOOK} --extra-vars "provider_name=${PROVIDER} service_pack_name=${SERVICEPACK}"
  fi
  exit 0
fi

for p in `ls -1 ${PROVIDER_DIR}`;
do
  SP_RESOURCE_DIR="${SP_DIR}/${p}"

  # Service Pack Templates
  for s in `ls -1 ${SP_RESOURCE_DIR}`
  do
    if [[ -d "${SP_RESOURCE_DIR}/${s}" ]];
    then
      echo -e "Processing ${SP_RESOURCE_DIR}/${s}"
      ansible-playbook ${SP_PLAYBOOK} --extra-vars "provider_name=${p} service_pack_name=${s}"
    fi
  done

done


