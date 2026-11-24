output "alb_dns_name" {
  description = "Nom DNS public de l'ALB (la page de l'environnement)."
  value       = null
}

output "target_group_arn" {
  description = "ARN du target group de la pile."
  value       = null
}

output "asg_name" {
  description = "Nom du groupe d'auto-scaling."
  value       = null
}
