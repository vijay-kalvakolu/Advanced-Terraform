This is the Advanced Terraform Reposotiresi covering all the modules 


Remote state:

backend state file: used to maintain remote state.

We created a backend gcs bucket for backend terraform state file storge and called this in root directory inside backend.tf file.
use tf init -backend-config"bucket=<bucketname>" (we didn;t explicitly hardcorded the bucket name in the file, we passed it manually)

Doesn't allo parllel use of the terraform state so no drifts.

