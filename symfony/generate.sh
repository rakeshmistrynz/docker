#!/bin/bash

PHP_TAGS=(
    5.4-cli 5.4-apache 5.4-fpm
    5.5-cli 5.5-apache 5.5-fpm
    5.6-cli 5.6-apache 5.6-fpm
)
ROOT_DIR=$(dirname $0)

for tag in ${PHP_TAGS[@]}; do
    infos=($(echo ${tag} | tr '-' ' '))
    to_dir=${ROOT_DIR}/php${infos[0]}/${infos[1]}
    sed_commands="-e 's/{PHP_TAG}/${tag}/'"

    if [[ "${infos[0]}" = "5.4" ]]; then
        sed_commands="${sed_commands} -e '/opcache/d'"
    fi

    mkdir -p ${to_dir}
    sed "${sed_commands}" ${ROOT_DIR}/Dockerfile-block > ${to_dir}/Dockerfile
done