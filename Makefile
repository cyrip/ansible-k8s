# Makefile for managing Ansible tasks

# Variables
BOOTSTRAP = bootstrap.yml
JOIN = join-nodes.yml 
INSTALL_PACKAGES = install-pkgs.yml
DEPLOY=deploy-test-apps.yml

# Ansible targets
.PHONY: all lint bootstrap join

all: lint bootstrap join

# Target to run the Ansible playbook
bootstrap:
	ansible-playbook $(BOOTSTRAP) --become --become-method=sudo

bootstrap-simple:
	ansible-playbook $(BOOTSTRAP) --inventory inventory-simple.yml --become --become-method=sudo

join:
	ansible-playbook $(JOIN) --become --become-method=sudo

join-simple:
	ansible-playbook $(JOIN) --inventory inventory-simple.yml --become --become-method=sudo

install-pkgs:
	ansible-playbook $(INSTALL_PACKAGES) --inventory inventory-mgmt.yml --become --become-method=sudo

deploy:
	ansible-playbook $(DEPLOY) --inventory inventory-mgmt.yml --become --become-method=sudo

# Target to lint the Ansible playbook
lint:
	ansible-lint $(BOOTSTRAP)
	ansible-lint ${JOIN}

# Help target to display usage information
help:
	@echo "Makefile for managing Ansible tasks"
	@echo ""
	@echo "Usage:"
	@echo "  make bootstrap  Bootstrap the nodes"
	@echo "  make join       Join the nodes"
	@echo "  make lint       Lint the Ansible playbook with ansible-lint"
	@echo "  make all        Lint and then run the Ansible playbook"
	@echo "  make help       Display this help message"
