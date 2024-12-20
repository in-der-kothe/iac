terraform {
  required_providers {
    hcloud = {
        source = "hetznercloud/hcloud"
    }
    hetznerdns = {
      source = "germanbrew/hetznerdns"
      version = "3.3.3"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

provider "hetznerdns" {
  api_token = var.hetznerdns_token
}

resource "hcloud_server" "nextcloud" {
  name        = "nextcloud" #### change name
  image       = "ubuntu-24.04"
  server_type = "cx22"
  location    = "fsn1"
  ssh_keys    = [var.ssh_public_key_name]
}

resource "hcloud_volume_attachment" "main" {
  volume_id = hcloud_volume.nextcloud.id
  server_id = hcloud_server.nextcloud.id
  automount = true
}

resource "hcloud_volume" "nextcloud" {
  name = "nextcloud"
  format = "ext4"
  location = "fsn1"
  size     = 10
  delete_protection = true 
}

data "hetznerdns_zone" "dns_zone" {
  name = "in-der-kothe.de"
}

resource "hetznerdns_record" "collabora" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "collabora"
  value   = hcloud_server.nextcloud.ipv4_address
  type    = "A"
  ttl     = 60  
}

resource "hetznerdns_record" "nextcloud" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = "cloud"
  value   = hcloud_server.nextcloud.ipv4_address
  type    = "A"
  ttl     = 60
}

output "server_ip" {
  value = hcloud_server.nextcloud.ipv4_address
}

resource "local_file" "volumne_id" {
  filename = "volume_id"
  content = hcloud_volume.nextcloud.id
}

resource "local_file" "inventory" {
  filename = "inventory"
  content = hcloud_server.nextcloud.ipv4_address
}