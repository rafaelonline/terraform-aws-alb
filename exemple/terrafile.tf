
module "alb" {
  source                = "./modules/alb"
  target_group_port     = "80"
  target_group_protocol = "HTTP"
  name_lb               = "myalb"
  subnet_ids            = ["subnet-6a48xxxxxx", "subnet-9d0bxxxxxx"]
  https_enabled         = true
  http_redirect         = true
  certificate_arn       = "arn:aws:acm:us-east-1:3838xxxxxx12:certificate/112f0735-xxxx-4ea4-xxxx-9bbc8bafff72"

  target_group_name = "tg-my-alb-80"
  vpc_id            = "vpc-f60xxxxxx"
  target_id         = ["172.31.46.113", "172.31.10.67"]

  environment = "prod"
  owner       = "TI"
}