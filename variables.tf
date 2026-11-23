variable "project" {
  description = "Nom du projet, préfixe de toutes les ressources."
  type        = string
  default     = "pizza-del-esgi"

  validation {
    condition     = can(regex("^[a-z0-9-]{3,30}$", var.project))
    error_message = "project : minuscules, chiffres et tirets (3 à 30 caractères)."
  }
}

variable "environment" {
  description = "Environnement cible : dev ou prod."
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment doit valoir dev ou prod."
  }
}
