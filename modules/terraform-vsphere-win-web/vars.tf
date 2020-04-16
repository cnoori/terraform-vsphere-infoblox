variable "vsphere_server" {
  default = "10.33.0.170"
}

variable "vsphere_user" {
}

variable "vsphere_password" {
}

variable "vLAN" {
  description = "Enter vLAN name as it appears in vCenter"
}

variable "numCPU" {
  description = "How many vCPUs?"
}

variable "GB-memory" {
  description = "VM requested Memory in Gigbytes, e.g 4"
}

// default VM domain for guest customization


variable "ipv4_gateway" {
}

variable "domain" {
}

variable "pool" {
}

variable "cluster" {
}

variable "template" {
}

variable "datastore" {
}

variable "datacenter" {
}

variable "esxiHost" {
}

variable "vm-names" {
  
}

variable "ipaddress" {
  
}


