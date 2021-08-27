resource "aws_lb" "default" {
  name                             = var.name_lb
  internal                         = var.internal
  load_balancer_type               = "application"
  security_groups                  = compact(concat(var.security_group_ids, [aws_security_group.default.id]), )
  subnets                          = var.subnet_ids
  enable_cross_zone_load_balancing = var.cross_zone_load_balancing_enabled
  enable_http2                     = var.http2_enabled
  idle_timeout                     = var.idle_timeout
  ip_address_type                  = var.ip_address_type
  enable_deletion_protection       = var.deletion_protection_enabled


  access_logs {
    bucket  = var.access_logs_bucket_id
    prefix  = var.access_logs_prefix
    enabled = var.access_logs_enabled
  }

  tags = {
    Name = var.name_lb
  }

  drop_invalid_header_fields = true
}

resource "aws_lb_listener" "http_forward" {
  count             = var.http_enabled && var.http_redirect != true ? 1 : 0
  load_balancer_arn = aws_lb.default.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "http_redirect" {
  count             = var.http_enabled && var.http_redirect == true ? 1 : 0
  load_balancer_arn = aws_lb.default.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  count             = var.https_enabled ? 1 : 0
  load_balancer_arn = aws_lb.default.arn

  port            = var.https_port
  protocol        = "HTTPS"
  ssl_policy      = var.https_ssl_policy
  certificate_arn = var.certificate_arn

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group" "default" {
  name                          = var.target_group_name
  port                          = var.target_group_port
  protocol                      = var.target_group_protocol
  vpc_id                        = var.vpc_id
  target_type                   = var.target_group_target_type
  deregistration_delay          = var.deregistration_delay
  load_balancing_algorithm_type = var.algorithm_type

  stickiness {
    enabled         = var.stickiness_enable
    type            = var.stickiness_type
    cookie_duration = var.stickiness_duration
  }

  health_check {
    protocol            = var.target_group_protocol
    path                = var.health_check_path
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "default" {
  count            = length(var.target_id)
  target_group_arn = aws_lb_target_group.default.arn
  target_id        = element(var.target_id, count.index)
  port             = var.target_group_port
}

