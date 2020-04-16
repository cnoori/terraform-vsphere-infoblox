

provider "infoblox" {
  username = var.username #"infoblox-terraform"
  password = var.password #"Password123!"
  host     = var.host #"https://10.42.1.60"
  #    username = "${var.infoblox_username}"
  #    password = "${var.infoblox_password}"
  #    host  = "${var.infoblox_host}"
  #    sslverify = "${var.infoblox_sslverify}"
  #    usecookies = "${var.infoblox_usecookies}"
  sslverify  = "false"
  usecookies = "false"
}


# provider "infoblox" {
# host     = "https://10.42.1.60"
# # infoblox_password="Password123!"
# # infoblox_server="https://10.42.1.60"
# # infoblox_username="infoblox-terraform"
# }

# VM Name :: String Type
# VM ID :: String Type
# Tenant ID :: String Type
# CMP Type :: String Type
# Cloud API Owned :: List Type (Values True, False)
# Network Name :: String Type
