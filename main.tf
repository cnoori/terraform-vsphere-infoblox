module "ip" {
  source = "/PATH TO MODULE/modules/terraform-infoblox-ip"
 # If you like to use certian versions of your code use the version tags

  #  version = "0.1.14"

  cidr       = "${var.ip_cidr}"
  host       = "${var.ip_host}"
  password   = "${var.ip_password}"
  vm-names = "${var.vm-names}"
  sslverify  = "${var.ip_sslverify}"
  usecookies = "${var.ip_usecookies}"
  username   = "${var.ip_username}"
  domain     = "${var.ip_domain}"
 
}

module "win_web" {
  source = "/PATH TO MODULE/modules/terraform-vsphere-win-web"
  # If you like to use certian versions of your code use the version tags
  #  version = "0.1.3"
  vm-names         = var.vm-names
  cluster          = "${var.win_web_cluster}"
  datacenter       = "${var.win_web_datacenter}"
  datastore        = "${var.win_web_datastore}"
  esxiHost         = "${var.win_web_esxiHost}"
  GB-memory        = "${var.win_web_GB-memory}"
  ipaddress        = module.ip.infoblox-ip
  ipv4_gateway     = "${var.win_web_ipv4_gateway}"
  numCPU           = "${var.win_web_numCPU}"
  pool             = "${var.win_web_pool}"
  template         = "${var.win_web_template}"
  vLAN             = "${var.win_web_vLAN}"
  vsphere_password = "${var.win_web_vsphere_password}"
  vsphere_server   = "${var.win_web_vsphere_server}"
  vsphere_user     = "${var.win_web_vsphere_user}"
  domain           = "${var.win_web_domain}"
}


