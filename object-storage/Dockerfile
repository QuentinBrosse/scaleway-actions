FROM python:3-alpine

LABEL "name"="scaleway-actions/object-storage"
LABEL "version"="1.0.0"
LABEL "repository"="http://github.com/quentinbrosse/scaleway-actions"
LABEL "homepage"="http://github.com/quentinbrosse/scaleway-actions"
LABEL "maintainer"="Quentin Brosse <quentin.brosse@icloud.com>"

LABEL "com.github.actions.name"="Scaleway - Object Storage"
LABEL "com.github.actions.description"="Wraps the s3cmd CLI to enable common Scaleway Object Storage actions."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update                                                                        && \
    apk add --no-cache s3cmd                                                          && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
