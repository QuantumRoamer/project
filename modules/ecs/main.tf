# Create the IAM role for ECS Task Execution
resource "aws_iam_role" "ecs_execution_role" {
  name               = "wordpress-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json
}

data "aws_iam_policy_document" "ecs_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "wordpress" {
  name = "wordpress-cluster"
}

resource "aws_ecs_task_definition" "wordpress_task" {
  family                   = var.task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = var.log_group_name
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "wordpress"
        }
      }
      environment = [
        {
          name  = "WORDPRESS_DB_HOST"
          value = var.db_endpoint
        },
        {
          name  = "WORDPRESS_DB_USER"
          value = var.db_username
        },
        {
          name  = "WORDPRESS_DB_PASSWORD"
          value = var.db_password
        },
        {
          name  = "WORDPRESS_DB_NAME"
          value = var.db_name
        },
        {
          name  = "WORDPRESS_TABLE_PREFIX"
          value = "wp_"
        },
        {
          name  = "WORDPRESS_WP_HOME"
          value = "http://${var.alb_dns_name}"
        },
        {
          name  = "WORDPRESS_WP_SITEURL"
          value = "http://${var.alb_dns_name}"
        },
        {
          name  = "WORDPRESS_FORCE_SSL_ADMIN"
          value = "false"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "wordpress_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.wordpress.id
  task_definition = aws_ecs_task_definition.wordpress_task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = 80
  }
}

resource "aws_cloudwatch_log_group" "wordpress_log_group" {
  name              = var.log_group_name
  retention_in_days = 7
}
