variable "name_prefix" {
  type        = string
  description = "Prefixo do nome das VMs"
}

variable "location" {
  type        = string
  description = "Localização das VMs"
}

variable "resource_group_name" {
  type        = string
  description = "Nome do grupo de recursos"
}

variable "vm_count" {
  type        = number
  description = "Número de VMs"
}

variable "vm_size" {
  type        = string
  description = "Tamanho da VM"
}

variable "admin_username" {
  type        = string
  description = "Nome de usuário administrador da VM"
}

variable "admin_password" {
  type        = string
  description = "Senha do administrador da VM"
}

variable "subnet_id" {
  type        = string
  description = "ID da Subnet"
}
