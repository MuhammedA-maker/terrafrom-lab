terraform {
  backend "s3" {
    bucket = "terrafrom-newtf"
    key    = "terrafrom.tfstate"
    region = "us-east-1"
  }
}
