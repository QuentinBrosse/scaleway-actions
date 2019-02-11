FROM debian:stable-slim

LABEL "name"="debug"
LABEL "version"="1.0.0"
LABEL "homepage"="http://github.com/quentinbrosse/scaleway-actions"
LABEL "maintainer"="Quentin Brosse <quentin.brosse@icloud.com>"

LABEL "com.github.actions.name"="Shell for GitHub Actions"
LABEL "com.github.actions.description"="Runs one or more commands in an Action"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        jq && \
	apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
