#!/bin/bash

#variables
run="docker run --rm -v"
image="go-ci-image"
commands=("build" "format" "lint" "security" "deps")

#build the docker image once
docker build -t "$image" .


for command in "${commands[@]}"
do
	$run "$PWD":/workspace "$image" make "$command" || exit $?
done








