#!/bin/bash
COLOR_LB='\033[1;34m'
COLOR_NONE='\033[0m'

ENV_KEYS=`echo $INPUT_ENV | jq -jr '. | to_entries[] | "-e \(.key) "'`
NETWORK=`docker network ls | grep github_network | awk '{ print $2 }'`
RUN=`echo "$INPUT_RUN" | sed -ze 's/[ \n]*$//' -e 's/\\n/;/g'`

echo -e $COLOR_LB docker run $INPUT_OPTIONS --network $NETWORK $ENV_KEYS -v $GITHUB_WORKSPACE:/workspace -w /workspace --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "$RUN" $COLOR_NONE
exec docker run $INPUT_OPTIONS --network $NETWORK $ENV_KEYS -v $GITHUB_WORKSPACE:/workspace -w /workspace --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "$RUN"