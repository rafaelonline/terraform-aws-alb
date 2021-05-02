output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = join("", aws_lb.default.*.dns_name)
}