output "alb_dns" {
  value = aws_lb.strapi_alb.dns_name
}

output "strapi_url" {
  value = aws_lb.strapi_alb.dns_name
}
