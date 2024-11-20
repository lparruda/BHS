variable "vnet_name" {
  type        = string
  description = "Nome da rede virtual"
}

variable "address_space" {
  type        = list(string)
  description = "Espaço de endereçamento da rede virtual"
}

variable "location" {
  type        = string
  description = "Localização da rede virtual"
}

variable "resource_group_name" {
  type        = string
  description = "Nome do grupo de recursos"
}

variable "subnet_name" {
  type        = string
  description = "Nome da subnet"
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Espaço de endereçamento da subnet"
}
