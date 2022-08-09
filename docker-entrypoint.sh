#!/usr/bin/env bash

# Check if arguments are provided.
if [ ! $# -eq 0 ];
then
  john $@;
else
  bash $@;
fi
