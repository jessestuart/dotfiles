#!/bin/bash

function depgrails() {
  echo ""; # Add a newline.
  if [[ $# -ne 2 ]]; then
    echo "Usage:\t\t[env] [build num]";
    return 1;
  fi
  local ENV=$1;
	local BUILD_NUM=$2;
  if [[ "$ENV" != "qa" && "$ENV" != "dev" ]]; then
    echo "";
    echo "Usage:\t\t[env] [build num]";
    echo "ENV must be one of 'dev' or 'qa'.";
    return 1;
  fi
  pushd ~/tt/config/ansible;
  ansible-playbook deploy_grails.yml \
		-i hosts/$ENV \
		--tags=deploy \
		-e build_num=$BUILD_NUM;
	terminal-notifier -title 'Ansible' -message "Finished deploying build $BUILD_NUM to $ENV."
	popd;
}
