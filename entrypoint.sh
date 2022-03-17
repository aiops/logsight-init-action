#!/bin/bash

# Diagnostic output:
# echo "Using options $INPUT_USERNAME $INPUT_PASSWORD $INPUT_APPLICATION_NAME"

# Runs misspell-fixes:
output=$(python3 /code/main.py --username $INPUT_USERNAME --password $INPUT_PASSWORD --application_name $INPUT_APPLICATION_NAME)
status="$?"
which docker-compose
if ($INPUT_FLUENTBIT_ENABLE == 1)
then
  /usr/bin/bash fluentbit_config_generator.sh $INPUT_FLUENTBIT_INPUT $INPUT_FLUENTBIT_FILELOCATION $INPUT_FLUENTBIT_MATCHPATTERN $output $INPUT_TAG $INPUT_FLUENTBIT_MESSAGE $INPUT_FLUENTBIT_HOST $INPUT_FLUENTBIT_PORT $INPUT_USERNAME $INPUT_PASSWORD > fluent-bit.conf
  cat fluent-bit.conf
  which docker-compose
  docker-compose up -d
fi

#
## Sets the output variable for GitHub Action API:
## See: https://help.github.com/en/articles/development-tools-for-github-action
echo "::set-output name=application_id::$output"
echo '================================='
echo
#
# Fail the build in case status code is not 0:
if [ "$status" -ne 0 ]; then
  echo 'Failing with output:'
  echo "$output"
  echo "Process failed with the status code: $status"
  exit "$status"
fi