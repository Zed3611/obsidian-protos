.PHONY: gen-auth

gen-auth:
	protoc -I proto proto/auth/v1/*.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative