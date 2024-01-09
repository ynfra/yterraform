APPS =  live/devel1 \
		live/mtv1 \
		live/global1

MODULES := $(wildcard modules/*)

.PHONY: init
init:
	@for app in $(APPS); do \
		$(MAKE) _terraform TDIR=$$app TCMD=init ; \
	done


.PHONY: validate
validate:
	@for app in $(APPS); do \
		$(MAKE) _terraform TDIR=$$app TCMD=validate ; \
	done

_terraform:
	terraform -chdir=${TDIR} ${TCMD}

.PHONY: docs
docs:
	@for module in $(MODULES); do \
		terraform-docs -c .terraform-docs.yml $$module ; \
	done
