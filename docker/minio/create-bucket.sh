# #!/bin/bash

# # Configure MinIO Client
# # Note: Use the internal hostname 'minio' and the internal port (usually 9000)
# mc alias set minioserver http://minio:9000 "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"

# # Create the buckets using the variable from your .env
# echo "Creating bucket: ${MLFLOW_BUCKET_NAME}"
# mc mb --ignore-existing minioserver/mlflow-artifacts

# # Create Feast/Other buckets
# mc mb --ignore-existing minioserver/offline-store
# mc mb --ignore-existing minioserver/feature-registry

# echo "Buckets created successfully."



#!/bin/bash
set -e

# Configure MinIO Client
mc alias set minioserver http://minio:"${MINIO_INTERNAL_PORT}" "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"

# Function to create bucket if variable is set
create_bucket() {
    local BUCKET_NAME=$1
    if [ -n "$BUCKET_NAME" ]; then
        echo "Creating bucket: $BUCKET_NAME"
        mc mb --ignore-existing minioserver/"$BUCKET_NAME"
    else
        echo "Error: Bucket variable is empty, skipping..."
    fi
}

# Create buckets using variables
create_bucket "${MLFLOW_BUCKET_NAME}"
create_bucket "${FEAST_OFFLINE_BUCKET}"
create_bucket "${FEAST_REGISTRY_BUCKET}"

echo "Buckets created successfully."