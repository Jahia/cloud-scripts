# Useful manifests & scripts

This repository contains a list of useful Jelastic manifests or scripts which. They can either be executed manually, or casted as a magic charm by the Cloud Guru (see https://github.com/Jahia/cloud-guru).

These scripts fulfil various maintenance tasks.

## jahia-cloud-env-update

These manifests are run when a new Jahia cloud version is released, they aim at updating environments to make them aligned with modifications on universal/unomi install JPS and Docker images.

Basically, there is one subfolder per Jahia Cloud release usually containing at least one *update.yml* manifest which is run right after the release, possibly without any downtime.

Other manifests can be added if specific actions need to be run on some environments, as weel as any other file (config file, scripts) required.

## galera-nodes

### restart-galera-nodes

Allows to restart Galera nodes sequentially without stopping Tomcat as the manifest will put the Jahia cluster in Full Read-only mode.

### redeploy-galera-nodes

Allows to redeploy Galera nodes sequentially without stopping Tomcat as the manifest will put the Jahia cluster in Full Read-only mode.

## es-nodes

### redeploy-es-nodes

Allows to redeploy Elasticsearch nodes sequentially.

## thread-dump

This manifest allows to enable/disable thread dumps generation every minute on Tomcat nodes.

## utils

### region-migrate

Migrates an environment to another region.

## Archives

### backrest & backup-restore

These are (very) old versions of backup & restore scripts/manifests which are now maintained in paas_jelastic_backup repository.

### disable-phpmyadmin

Manifest's purpose was to disable phpmyadmin on database nodes by stopping httpd & removing the init script. It is now handled by install.yaml manifest of paas_jelastic_dx_universal repository.

### fixToolsPassword

This manifest was used to fix tools password in Jahia conf when MANAGER_PASSWORD envvar was still containing unencrypted password (old topology).

### remove-passwords

This one aimed at removing root passwords from envvars on Tomcat nodes.
