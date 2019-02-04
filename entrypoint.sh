#!/bin/sh
set -e

# Exit with an error message
die() {
    echo $1
    exit 1
}

REGION=${REGION:-nl-ams}

HOST="https://s3.$REGION.scw.cloud"
HOST_BUCKET="$HOST"
BUCKET_LOCATION=$REGION

[ -z "$ACCESS_KEY" ] && die "ACCESS_KEY secret is required"
[ -z "$SECRET_KEY" ] && die "SECRET_KEY secret is required"

s3cmd                                   \
    --host=$HOST                        \
    --host-bucket=$HOST_BUCKET          \
    --bucket-location=$BUCKET_LOCATION  \
    --access_key=$ACCESS_KEY            \
    --secret_key=$SECRET_KEY            \
    --verbose                           \
    $*
