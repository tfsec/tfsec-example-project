install-tfsec:
	go get -u https://github.com/tfse/tfsec/cmd/tfsec

test:
	bash -c "$GOPATH/bin/tfsec ."

.PHONY: install-tfsec test