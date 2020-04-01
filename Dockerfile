FROM ubuntu-latest
RUN     apt-get update \
        && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            libpython3.6 \
            libyaml-0-2 \
            opa \
            python3.6 \
            tox \
            virtualenv \
        && apt-get clean

COPY    tox.ini requirements.txt /code/
RUN     cd /code && tox -e virtualenv_run

COPY    . /code

RUN     install -d --owner=nobody /code
RUN     install -d --owner=nobody /code/logs

USER    nobody
WORKDIR /code
ENV     BASEPATH=/code PATH=/code/virtualenv_run/bin:$PATH
