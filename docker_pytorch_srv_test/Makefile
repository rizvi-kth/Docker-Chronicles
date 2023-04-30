# Working directory :
#		- Application root 
# 		- Should contain Pipfile and Makefile

# Step 1: cd working_directory

# Step 2: Get .mar files from cloud
getmars:
	aws s3 cp s3://lotus-ds-resources/models/xsumm-sf.mar ./model_mars/xsumm-sf.mar --profile rz-lotus
	aws s3 cp s3://lotus-ds-resources/models/xsenti-nlptown.mar ./model_mars/xsenti-nlptown.mar --profile rz-lotus

# Step 3: Check the models
models:
	curl http://localhost:8081/models/

# Step 4: Register the models
regmodel:
	# curl -X POST "http://localhost:8081/models?url=https://lotus-ds-resources.s3.eu-west-1.amazonaws.com/models/xsumm-sf.mar&initial_workers=1&synchronous=true&model_name=xsumm&batch_size=1"
	curl -X POST "http://localhost:8081/models?url=xsumm-sf.mar&initial_workers=1&synchronous=true&model_name=xsumm&batch_size=1"
	curl -X POST "http://localhost:8081/models?url=xsenti-nlptown.mar&initial_workers=1&synchronous=true&model_name=xsenti&batch_size=1"

# Step 5: Check the Inferancing 
infr:
	# pipenv run python SvNerClient.py
	# python xSentiClientBatch.py
	python xSummClient.py

