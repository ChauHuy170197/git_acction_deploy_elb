variable "env" {
  type    = string
  default = "dev"
}

variable "db_username" {
  type = string
  default = "huydb"
}

variable "db_password" {
  type = string
  default = "huy170197"
}

variable "app_key" {
  type = string
  default = ""
}

variable "mail_username" {
  type = string
  default = ""
}

variable "mail_password" {
  type = string
  default = ""
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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLJ3vs7xdl9NjHzgXUcdwahEHSUvHsVxsiGgkPNcQGgz+2D9CCsztyX+7Vby7NuV2BLGj6T78bMaGHwB7IXyW8phCR50QMmrbVouQquiufZIa2CdRjnSgY+yrZgRl+01/jo8YEH+Fx94/F0BIv5BUP3MW8GPQQXRZWd00xlx127VKi1eACNM4bsqG32mUgUYmu6fbN4QYmDYC1xJ1DYS3rqaVxhYviBsYU2ach3hIAEkt62vus63iwsrhqei22lawwzfUUcsUUKSH8AOmex89YUO/Hxv2sFA5cUtjPXzMV2XQFmk2WVf4ALafxZVfR/Ikg22/7orTnecHVY93OMi0ms4fwzU1UlDhB5dnr6MBH67qA+u5ApHVEX9l0FUlS3WhhhxDXoVPaDc/T4nOPINfgXmhULttI3d9ESE2I+8s3wb9kdoPFgZWn3bubcKSBsY9A07kNR+G7UTZMQ5+NvLkARgoBsSkIonnZEy588oTsZZ8h90ncd//fenvC4pgmGaE= root@ip-10-120-4-14"
}

variable "app_url" {
  type    = string
  default = ""
}