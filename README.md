# terraform-aws-pizza-del-esgi

Pile web de l'équipe : Security Groups, Launch Template, ALB, target group, listener, ASG.
Aucun bloc provider : l'environnement appelant le configure.

## Appel
module "web" {
  source        = "git::https://github.com/mateoBG77/terraform-aws-pizza-del-esgi.git?ref=v0.2.0"
  environment   = var.environment
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.vpc.public_subnets
  ami_id        = data.aws_ami.<nom>.id
  instance_type = var.instance_type
}

## Entrées
project, environment (dev|prod), vpc_id, subnet_ids (>= 2), ami_id, instance_type,
instance_profile_name (LabInstanceProfile), min_size (>= 2), max_size

## Sorties
alb_dns_name, target_group_arn, asg_name

## Convention
Secret lu au démarrage : /pizza-del-esgi/<environment>/db_password (SecureString)

## Versions
v0.2.0  contrat d'interface (entrées, sorties), pas encore de ressource
v0.1.0  ne pas utiliser : ancien squelette (erreur de tag)
