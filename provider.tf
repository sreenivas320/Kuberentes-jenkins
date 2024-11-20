####This is our access key path in my Local server #################
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
