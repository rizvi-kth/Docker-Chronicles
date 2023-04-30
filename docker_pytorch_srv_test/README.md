## Commands

- Install PyTorch-Serve with pipenv
    
    - `pipenv install torchserve torch-model-archiver`

- Create the `requirements.txt` file

    - pipenv lock -r > requirements.txt

- Create the Dockerfile

    - Install packages from `requirements.txt`
    - Copy the entry-point script to startthe server
    - docker-compose up
        - Volume bind the .mar files with the image



