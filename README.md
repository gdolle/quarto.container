# Quarto CLI

You may wish to use [quarto](https://quarto.org) though `docker` (or `podman`).

The minimal quarto docker image can be built using the
command

```sh
# Minimal image.
docker build -t quarto .

# Full image (with R, python, latex)
docker build --target quarto-full -t quarto .
```

To compile the documentation locally via docker, just type

```sh
docker run -v ${PWD}:/data --rm quarto render /data --to html --output-dir /data/work

# Print quarto help:
docker run --rm quarto --help
```

