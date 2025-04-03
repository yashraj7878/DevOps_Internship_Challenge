 provider "proxmox" {
      pm_api_url = "https://your-proxmox-ip:8006/api2/json"
      pm_user    = "root@pam"
      pm_password = "your-password"
      pm_tls_insecure = true
    }

    resource "proxmox_vm_qemu" "ubuntu_vm" {
      name        = "ubuntu22"
      target_node = "pve"
      clone       = "ubuntu-template"
      cores       = 2
      memory      = 4096
      network {
        model  = "virtio"
        bridge = "vmbr0"
      }
    }