data "aws_secretsmanager_secret_version" "credentials" {
  secret_id = "prod/irecharge/terraform"
}

# Use locals to grab the decrypted key from secret manager
locals {
  credentials = jsondecode(
    data.aws_secretsmanager_secret_version.credentials.secret_string
  )

}