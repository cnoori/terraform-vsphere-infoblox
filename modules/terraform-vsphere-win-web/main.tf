resource "vsphere_virtual_machine" "vm" {
  for_each         = var.ipaddress
  name             = each.value.name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  num_cpus         = var.numCPU
  memory           = var.GB-memory * 1024
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  network_interface {
    adapter_type = "vmxnet3"
    network_id   = data.vsphere_network.network.id
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks[0].eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks[0].thin_provisioned
  }
  #Included a clone attribute in the resource
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      windows_options {
        computer_name         = each.value.name
        organization_name     = "DOMAIN_HERE"
        full_name             = "Administrator"
        admin_password        = "PASSWORD_HERE"
        auto_logon            = true
        join_domain           = each.value.domain
        domain_admin_user     = var.vsphere_user
        domain_admin_password = var.vsphere_password
        time_zone             = "020"


      }

      network_interface {
        ipv4_address    = each.value.ip
        dns_server_list = ["IP_HERE", "IP_HERE", "IP_HERE"]
        ipv4_netmask    = "24"
      }
      ipv4_gateway = var.ipv4_gateway
    }
  }

  provisioner "remote-exec" {
    inline = ["%SYSTEMROOT%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe c:\\demosite.ps1"]

    connection {
      type     = "winrm"
      https    = false
      user     = "Administrator"
      password = "PASSWORD_HERE"
      agent    = false
      insecure = true
      host     = each.value.ip
      timeout  = "25m"
    }
  }
}
