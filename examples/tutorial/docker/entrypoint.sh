#!/usr/bin/env bash

ROOT=$(realpath $(dirname "$0"))

INITED_FILE="$ROOT/docker/inited"

export FLASK_APP=${FLASK_APP:-flaskr}
export FLASK_ENV=${FLASK_ENV:-development}

if [ ! -f "$INITED_FILE" ]; then
    if flask init-db; then
        if ! touch "$INITED_FILE"; then
            echo "init db succeded, but can not create inited_file: $INITED_FILE"
        fi
    else
        >&2 echo "can not init db."
        exit 1
    fi
fi

if [ "$1" != "flask" ]; then
    set -- flask run -h 0.0.0.0 "$@"
fi

exec "$@"
