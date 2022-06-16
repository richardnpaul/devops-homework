# Bootstrapping for Terraform

Terraform needs state related resources in place before you can run Terraform for the first time.

Install Terraform and the gcloud SDK and authenticate with `gcloud init`

```
# Create a new project
gcloud projects create <project-name>

# Create a new gcs bucket in the new project
gsutil mb -p <project-name> -l <location> --pap enforced gs://<unique-bucket-name>

# Generate local gcp auth credentials for terraform to use
gcloud auth application-default login
```
