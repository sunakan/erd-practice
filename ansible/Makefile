export ENVIRONMENT=vagrant
export ANSIBLE_COMMAND=/home/vagrant/.local/bin/ansible-playbook

version:
	${ANSIBLE_COMMAND} --version

dry-provision:
	${ANSIBLE_COMMAND} \
		--inventory ./inventories/${ENVIRONMENT}/hosts \
		--check \
		./main.yml

provision:
	${ANSIBLE_COMMAND} \
		--inventory ./inventories/${ENVIRONMENT}/hosts \
		./main.yml
