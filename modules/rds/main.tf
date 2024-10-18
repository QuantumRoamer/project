resource "aws_db_instance" "this" {
  identifier             = var.db_instance_name
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  vpc_security_group_ids = [var.vpc_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot    = true

  tags = {
    Name = var.db_instance_name
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.db_instance_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_instance_name}-subnet-group"
  }
}
