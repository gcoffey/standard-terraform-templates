#!/bin/bash

# Creates Jinja2 templates for Terraform resources w/ variable files

PROVIDER_DIR="./providers"
SP_DIR="./service-packs"
RESOURCE_PLAYBOOK="./playbooks/create-tf-resource-template.yml"
SP_PLAYBOOK="./playbooks/service-pack-resource-template.yml"

for p in `ls -1 ${PROVIDER_DIR}`;
do
  RESOURCE_DIR="${PROVIDER_DIR}/${p}"
  SP_RESOURCE_DIR="${SP_DIR}/${p}"

  # Resource Templates
  for r in `ls -1 ${RESOURCE_DIR}`
  do
    echo -e "Processing ${RESOURCE_DIR}/${r}"
#    ansible-playbook ${RESOURCE_PLAYBOOK} --extra-vars "provider_name=${p} resource_name=${r}" 
  done

  # Service Pack Templates
  for s in `ls -1 ${SP_RESOURCE_DIR}`
  do
    echo -e "Processing ${SP_RESOURCE_DIR}/${s}"
    ansible-playbook ${SP_PLAYBOOK} --extra-vars "provider_name=${p} service_pack_name=${s}"
  done

done


