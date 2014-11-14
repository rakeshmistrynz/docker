# IRSSI in Docker

## Supported tags and respective `Dockerfile` links

- `0.8.17`, `0.8`, `latest`
  ([Dockerfile](https://github.com/chadrien/docker/blob/74e626c7a6618ce21baefe477e844d2426ebb59e/irssi/Dockerfile))
- `arm`
  ([Dockerfile](https://github.com/chadrien/docker/blob/d064228cf0938de3884d3fa5f2905506f6195b36/irssi/Dockerfile))

## How to use

    docker run --rm -it chadrien/irssi

If you'd like to use you own irssi configuration, there is a volume for
this purpose :

    docker run --rm -it -v /path/to/your/config:/home/irssi/.irssi chadrien/irssi
