variable "hcloud_token" {
  description = "the hcloud token"
  type = string
  sensitive = true
}

variable "hetznerdns_token" {
    description = "hetzner dns api token"
    type = string
    sensitive = true
}

variable "ssh_public_key_name" {
  description = "Name of public key"
  type = string
  default = "default"
}
