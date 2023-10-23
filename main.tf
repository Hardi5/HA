terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.9.2"
    }
  }
}

provider "linode" {
  token = "48e19305920db79ab2eef51826a72b9c193ac7ce05527b9ce716afa9d3dce025"
}

data "linode_sshkey" "Akamai" {
  label = "Akamai"
}

resource "linode_instance" "Terraform1" {
  image = "linode/ubuntu18.04"
  label = "Hardi1"
  region = "se-sto"
  type = "g6-nanode-1"
  authorized_keys = [data.linode_sshkey.Akamai.ssh_key]
}

resource "linode_instance" "Terraform2" {
  image = "linode/ubuntu18.04"
  label = "Hardi2"
  region = "se-sto"
  type = "g6-nanode-1"
  authorized_keys = [data.linode_sshkey.Akamai.ssh_key]
}

resource "linode_instance" "lb" {
  image = "linode/ubuntu18.04"
  label = "Loadbalancer"
  region = "se-sto"
  type = "g6-nanode-1"
  authorized_keys = [data.linode_sshkey.Akamai.ssh_key]
}