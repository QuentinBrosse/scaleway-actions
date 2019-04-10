#!/bin/sh
set -e

# Exit with an error message
die()
{
    echo $1
    exit 1
}

REGION=${REGION:-fr-par}
HOST="https://s3.$REGION.scw.cloud"
HOST_BUCKET="$HOST"
BUCKET_LOCATION=$REGION

# Check required secrets
[ -z "$SCW_ACCESS_KEY" ] && die "SCW_ACCESS_KEY secret is required"
[ -z "$SCW_SECRET_KEY" ] && die "SCW_SECRET_KEY secret is required"

# Run command
sh -c "
    s3cmd                                   \
        --host=$HOST                        \
        --host-bucket=$HOST_BUCKET          \
        --bucket-location=$BUCKET_LOCATION  \
        --access_key=$SCW_ACCESS_KEY        \
        --secret_key=$SCW_SECRET_KEY        \
        --verbose                           \
        --debug                             \
        $*
"
