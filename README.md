# cloud-scripts

This repository contains a list of Jahia Cloud scripts. They ca either be executed manually, or casted as a magic charm by the Cloud Guru (see https://github.com/Jahia/cloud-guru).
These scripts fulfil various maintenance tasks.

## Apply monitoring tagging
Setups up a cron entry in order to retrieve tags from various sources (AWS API, filesystem files, environment variables) and set it in the datadog.yaml file in the tag entry.
