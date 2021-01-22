# Docker Run Action

Launches a docker image in the same network context as the services running in a GitHub action and automatically injects any passed in environment variables into the container.

## Basic Usage

```
  - name: docker run
    uses: imbellus2/docker-run-action@master
    with:
        image: ubuntu:latest
        run: |
          echo Hi $USERNAME
          echo Welcome to your docker image
    env:
        USERNAME: Test
```

## Private Registry
```
  - name: Login to DockerHub
    uses: docker/login-action@v1
    with:
      username: ${{ secrets.DOCKERHUB_USER }}
      password: ${{ secrets.DOCKERHUB_TOKEN }}
  - name: docker run
    uses: imbellus2/docker-run-action@master
    with:
        image: ubuntu:latest
        run: |
          echo Hi $USERNAME
          echo Welcome to your docker image
    env:
        USERNAME: Test
```

## Advanced
```
  - name: docker run
    uses: imbellus2/docker-run-action@master
    with:
        image: ubuntu:latest
        run: |
          echo Hi $USERNAME
          echo Welcome to your docker image
        shell: bash
        options: -v /tmp:/home/$USERNAME
    env:
        USERNAME: test