variable "project" {
  description = "Nom court du projet : préfixe des ressources et du chemin du secret."
  type        = string
  default     = "pizza-del-esgi"
}

variable "environment" {
  description = "Environnement cible ; transmis à bootstrap.sh par templatefile."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment doit valoir \"dev\" ou \"prod\"."
  }
}

variable "vpc_id" {
  description = "VPC de la pile (sortie du module VPC du registre)."
  type        = string
}

variable "subnet_ids" {
  description = "Subnets publics de l'ALB et de l'ASG."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "Il faut au moins deux subnets, dans deux zones de disponibilité."
  }
}

variable "ami_id" {
  description = "AMI des instances (data aws_ami de l'environnement)."
  type        = string
}

variable "instance_type" {
  description = "Type des instances."
  type        = string
  default     = "t3.micro"
}

variable "instance_profile_name" {
  description = "Profil IAM des instances (Learner Lab : LabInstanceProfile)."
  type        = string
  default     = "LabInstanceProfile"
}

variable "min_size" {
  description = "Nombre minimal d'instances dans l'ASG."
  type        = number
  default     = 2

  validation {
    condition     = var.min_size >= 2
    error_message = "Le cahier des charges impose au moins 2 instances."
  }
}

variable "max_size" {
  description = "Nombre maximal d'instances dans l'ASG."
  type        = number
  default     = 4
}
