#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

OPTS=""
while [[ $# -gt 0 ]]; do
    OPTS="$OPTS -var ${1:2}=$2 "
    shift # past argument
    shift # past value
done

packer init "$SCRIPT_DIR/qemu20.pkr.hcl"
packer validate "$SCRIPT_DIR/qemu20.pkr.hcl"
packer build -debug $OPTS "$SCRIPT_DIR/qemu20.pkr.hcl"
