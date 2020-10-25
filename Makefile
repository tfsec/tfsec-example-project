install-tfsec:
	go get -u https://github.com/tfse/tfsec/cmd/tfsec

test:
	tfsec . 

.PHONY: install-tfsec test