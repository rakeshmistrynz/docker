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

    mkdir -p ${to_dir}
    sed "s/{PHP_TAG}/${tag}/" ${ROOT_DIR}/Dockerfile-block > ${to_dir}/Dockerfile
done