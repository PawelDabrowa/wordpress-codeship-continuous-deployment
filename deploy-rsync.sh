#!/bin/bash
# If any commands fail (exit code other than 0) entire script exits
set -e

# Check for required environment variables and make sure they are setup
: ${PROD_INSTALL_IP?"PROD_INSTALL_IP Missing"}   # IP for production install
: ${DEV_INSTALL_IP?"DEV_INSTALL_IP Missing"}   # IP for development install
: ${REPO_NAME?"REPO_NAME Missing"}    # theme repo name (Typically the folder name of the project)
: ${SSH_USERNAME?"SSH_USERNAME Missing"}    # Username for the SSH connection

# Set repo based on current branch, by default master=production, develop=staging
# @todo support custom branches

if [ "$CI_BRANCH" == "master" ]
then
    target_install=${PROD_INSTALL_IP}
else
    target_install=${DEV_INSTALL_IP}
fi

# Install plugin/theme packages
composer install

# Install theme packages and compile into production version
yarn cache clean && yarn && yarn run build:production

# Rsync to directory on server
# Create theme directory if not exist
ssh ${SSH_USERNAME}@${target_install} 'mkdir -p ~/public_html/wp-content/themes/${REPO_NAME}'

echo "Syncing theme to server: ${SSH_USERNAME}@${target_install}:~/public_html/wp-content/themes/${REPO_NAME}"
rsync -avz -e "ssh" ~/clone/ ${SSH_USERNAME}@${target_install}:~/public_html/wp-content/themes/${REPO_NAME}
