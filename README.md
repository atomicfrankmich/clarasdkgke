Clara GKE
===========



# Terraform usage

## Create a GCP Service account 

GCP console GUI Location: IAM & Admin -> Service Accounts

This will create a json key that you download.  This is a private key.  Save it in a safe location.

## Set your credentials

```
export TF_VAR_credentials_file_path=/media/veracrypt1/atomicfrankmich/august-water-273617-8e5125ed3ec3.json
export GOOGLE_APPLICATION_CREDENTIALS="${TF_VAR_credentials_file_path}"
export STATE_STORE_UNIQUE_KEY=august-water-273617
```

