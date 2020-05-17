export ANSIBLE_IP=192.168.4.123
export DB1_IP=192.168.4.21

################################################################################
# up
################################################################################
plugin:
	vagrant plugin install vagrant-hosts
up: plugin
	vagrant up

################################################################################
# ssh command to vm
################################################################################
chmod:
	chmod 600 .vagrant/machines/*/virtualbox/private_key

# SSHのオプションとSSH先
# $1：VMマシン名
# $2：VM側のIP
define ssh-option
	-o StrictHostKeyChecking=no \
	-o UserKnownHostsFile=/dev/null \
	-i .vagrant/machines/$1/virtualbox/private_key \
	vagrant@$2
endef
ansible: chmod
	ssh $(call ssh-option,ansible,${ANSIBLE_IP})

db1: chmod
	ssh $(call ssh-option,db1,${DB1_IP})

################################################################################
# command to ansible vm from host
################################################################################
ansible-version: chmod
	ssh $(call ssh-option,ansible,${ANSIBLE_IP}) 'cd ansible && make version'
provision: chmod
	ssh $(call ssh-option,ansible,${ANSIBLE_IP}) 'cd ansible && make provision'

################################################################################
# command to db1 vm from host
################################################################################
db1-pull:
	ssh $(call ssh-option,db1,${DB1_IP}) 'cd db && make pull'
db1-clean:
	ssh $(call ssh-option,db1,${DB1_IP}) 'cd db && make clean'
