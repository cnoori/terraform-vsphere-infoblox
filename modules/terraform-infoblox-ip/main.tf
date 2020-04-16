resource "infoblox_ip" "ip" {
  for_each = var.vm-names
  cidr     = var.cidr
}
locals {
  ip_map = {
    for i in var.vm-names :
    i.name => {
      ip = infoblox_ip.ip[i.name].ipaddress
      domain = i.domain != null ? i.domain : var.domain 
      name = i.name
    }
  }
}
############################### More infoblox
resource "infoblox_record_host" "host" {
  for_each          = local.ip_map
  name              = "${each.key}.${each.value["domain"]}"
  configure_for_dns = true
  ipv4addr {
    address = each.value["ip"]
  }
}
output "infoblox-ip" {
  value = local.ip_map
}