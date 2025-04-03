output "vm_ip" {
      value = proxmox_vm_qemu.ubuntu_vm.default_ipv4_address
    }