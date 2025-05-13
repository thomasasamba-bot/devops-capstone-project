provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "ecommerce" {
  name     = "ai-ecommerce-cluster"
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    subnet_ids = [aws_subnet.public.id, aws_subnet.private.id]
  }
}

resource "aws_rds_cluster" "postgres" {
  cluster_identifier = "ecommerce-db"
  engine             = "aurora-postgresql"
  database_name      = "ecommerce"
  master_username    = "admin"
  master_password    = var.db_password
}