#!/bin/bash

# Create JSON data files

PROVIDER_DIR="./providers"
SP_DIR="./service-packs"
JSON_DIR="./json"

PROVIDER_FILE="${JSON_DIR}/providers.json"
SP_FILE="${JSON_DIR}/sp_providers.json"

if [[ -d "${PROVIDER_DIR}" ]];
then
  # Provider List
  echo "{ \"providers\": [ " > ${PROVIDER_FILE}; for p in `ls -1 ${PROVIDER_DIR}`; do echo "\"$p\"," >> ${PROVIDER_FILE}; done; echo " ] }" >> ${PROVIDER_FILE}

  for p in `ls -1 ${PROVIDER_DIR}`;
  do
    RESOURCE_DIR="${PROVIDER_DIR}/${p}"
    RESOURCE_FILE="${JSON_DIR}/${p}_resources.json"
    SP_RESOURCE_DIR="${SP_DIR}/${p}"

    # Resource List
    if [[ -d "${RESOURCE_DIR}" ]];
    then
      echo -e "{  \n\"resources\": [ \n" > ${RESOURCE_FILE} ; 
      for i in `ls -1 ${RESOURCE_DIR}`; 
      do 
        echo "\"$i\"," >> ${RESOURCE_FILE}; 
      done; 
      echo -e " ]\n}" >> ${RESOURCE_FILE}
    fi
    if [[ -d "${SP_RESOURCE_DIR}" ]];
    then
      # Service Pack List
      echo -e "{  \n\"servicepacks\": [ \n" >> ${RESOURCE_FILE}
      for p in `ls -1 ${SP_RESOURCE_DIR}`; 
      do 
        echo "\"$p\"," >> ${RESOURCE_FILE};
      done; 
      echo -e " ]\n}" >> ${RESOURCE_FILE}
    fi
  done
fi
