.PHONY: gen-auth gen-signaling gen-gateway gen-shared gen

gen-auth:
	protoc -I proto proto/auth/v1/*.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
gen-shared:
	protoc -I proto proto/shared/v1/*.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
gen-signaling:
	protoc -I proto proto/shared/v1/*.proto proto/signaling/v1/*.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
gen-gateway:
	protoc -I proto proto/gateway/v1/*.proto --go_out=./gen/go/ --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
gen:
	$(MAKE) gen-shared
	$(MAKE) gen-auth
	$(MAKE) gen-signaling
	$(MAKE) gen-gateway
