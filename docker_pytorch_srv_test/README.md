## Commands

- Install PyTorch-Serve with pipenv
    
    - `pipenv install torchserve torch-model-archiver`

- Create the `requirements.txt` file

    - pipenv lock -r > requirements.txt

- Create the Dockerfile

    - Install packages from `requirements.txt`
    - ?? Copy the .MAR file in the image
    - Copy the entry-point script to startthe server
    - docker-compose up



