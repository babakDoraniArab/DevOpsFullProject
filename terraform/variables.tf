#////////////////////////////////
#  Variables
#////////////////////////////////
variable "web_app_name" {
  type = string
}
variable "whitelist" {
  type = list(string)
}
variable "web_instance_type" {
  type = string
}
variable "web_key_name" {
  type = string
}

variable "profile" {
  description = "The profile used to auth to AWS"
}

variable "region" {
  description = "The region our instance will be in (i.e. us-east-1)"
}
