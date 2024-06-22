#!/bin/bash

# comma separated list of labels
LABELS="solstix"


# prepare the environment
./bin/installdependencies.sh

# Create the runner and start the configuration experience
CONFIG_TOKEN=$(curl -s -X POST https://api.github.com/repos/"${ORGA}"/"${REPO_NAME}"/actions/runners/registration-token \
    -H "accept: application/vnd.github.everest-preview+json" -H "authorization: token ${TOKEN}" | jq -r '.token')

./config.sh --unattended --url https://github.com/"${ORGA}"/"${REPO_NAME}" --token "${CONFIG_TOKEN}" --labels "${LABELS}"

# remove runner on exit
cleanup() {
echo "Removing runner..."
    ./config.sh remove --unattended --token "${CONFIG_TOKEN}"
}
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

# Last step, run it!
./run.sh & wait $!