variable "env" {
  type    = string
  default = "dev"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "app_key" {
  type = string
}

variable "mail_username" {
  type = string
}

variable "mail_password" {
  type = string
}

variable "pusher_app_id" {
  type    = string
  default = ""
}

variable "pusher_app_key" {
  type    = string
  default = ""
}

variable "pusher_app_secret" {
  type    = string
  default = "" 
}

variable "pusher_app_cluster" {
  type    = string
  default = "abc"
}

variable "mix_pusher_app_key" {
  type    = string
  default = ""
}

variable "mix_pusher_app_cluster" {
  type    = string
  default = ""
}

variable "public_key" {
  type = string
}

variable "app_url" {
  type    = string
  default = "https://Test.io/"
}