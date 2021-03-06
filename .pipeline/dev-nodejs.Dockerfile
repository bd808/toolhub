# Dockerfile for *local development*.
# Generated by Blubber from .pipeline/blubber.yaml
FROM docker-registry.wikimedia.org/nodejs10-devel AS dev-nodejs
USER "root"
ENV HOME="/root"
RUN groupadd -o -g "65533" -r "somebody" && useradd -l -o -m -d "/home/somebody" -r -g "somebody" -u "65533" "somebody" && mkdir -p "/srv/app" && chown "65533":"65533" "/srv/app" && mkdir -p "/opt/lib" && chown "65533":"65533" "/opt/lib"
RUN groupadd -o -g "900" -r "runuser" && useradd -l -o -m -d "/home/runuser" -r -g "runuser" -u "900" "runuser"
USER "somebody"
ENV HOME="/home/somebody"
WORKDIR "/srv/app"
ENV PIP_DISABLE_PIP_VERSION_CHECK="on" PIP_NO_CACHE_DIR="off" PYTHONBUFFERED="1" PYTHONDONTWRITEBYTECODE="1"
COPY --chown=65533:65533 ["package.json", "./"]
RUN npm install
COPY --chown=65533:65533 [".", "."]
ENV NODE_ENV="development"

LABEL blubber.variant="dev-nodejs" blubber.version="0.8.0+5718d4d"
