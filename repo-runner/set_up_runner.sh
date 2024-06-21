#!/bin/bash

# prepare the environment
./bin/installdependencies.sh

# Create the runner and start the configuration experience
./config.sh --url https://github.com/Telefonica/"${REPO_NAME}" --token "${TOKEN}"

# Last step, run it!
./run.sh