output "ecs_cluster_id" {
  value = aws_ecs_cluster.wordpress.id
}

output "ecs_service_id" {
  value = aws_ecs_service.wordpress_service.id
}
