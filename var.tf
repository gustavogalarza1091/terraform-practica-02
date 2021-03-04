variable "location" {
	type= string
	default = "brazilsouth"
	description = "Region de Azure"
}

variable "vpc_cidr" {
	type= string
	default = "10.0.0.0/16"
	description = "CIDR de la VPC"
}

variable "vm_size" {
	type=string
	description="Tamaño de la maquina virtual"
	default = "Standard_D1_V2" #3.5GB, 1CPU
}

variable "vms" {
	type=list(string)
	description="Maquinas virtuales a crear"
	default = ["master", "nfs", "worker01"]
}