include .env

clean:
	@rm -rf .aws-sam
	
build:
	sam build

debug:
	sam build
	sam local start-api

start:
	sam local start-api

deploy:
	sam deploy \
		--template-file package.yml

package:
	make build
	sam package \
		--template-file template.yaml \
		--s3-bucket $(AWS_BUCKET_NAME) \
		--region $(AWS_REGION) \
		--output-template-file package.yml