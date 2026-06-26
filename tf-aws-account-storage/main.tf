data "aws_caller_identity" "current" {}

# =============================================================================
# STATE BUCKET — Terraform remote state for all concerns
# =============================================================================

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket_name

  tags = {
    Name             = var.state_bucket_name
    AccountAlias     = var.account_alias
    ContentType      = "terraform-state"
    Sensitivity      = "high"
    PublicAccess     = "blocked"
    Encryption       = "AES256"
    Versioning       = "enabled"
    RetentionPolicy  = "${var.state_retention_days}-days"
    DeleteProtection = "true"
    Purpose          = "Remote Terraform state for all workspace-aws concerns"
    CreatedBy        = "terraform-admin"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    filter {}  

    noncurrent_version_expiration {
      noncurrent_days = var.state_retention_days
    }
  }
}

resource "aws_s3_bucket_policy" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyNonSSLAccess"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "arn:aws:s3:::${var.state_bucket_name}",
          "arn:aws:s3:::${var.state_bucket_name}/*"
        ]
        Condition = {
          Bool = { "aws:SecureTransport" = "false" }
        }
      },
      {
        Sid    = "AllowTerraformAdminOnly"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::450374453058:user/terraform-admin"
        }
        Action = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:ListBucket"]
        Resource = [
          "arn:aws:s3:::${var.state_bucket_name}",
          "arn:aws:s3:::${var.state_bucket_name}/*"
        ]
      }
    ]
  })
}

# =============================================================================
# DYNAMODB — State locking table
# =============================================================================

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-state-locks"
    AccountAlias = var.account_alias
    ContentType = "terraform-state-lock"
    Sensitivity = "high"
    Purpose     = "Terraform state locking for all workspace-aws concerns"
    CreatedBy   = "terraform-admin"
  }
}

# =============================================================================
# ARTIFACTS BUCKET — Demo artifacts, future use
# =============================================================================

resource "aws_s3_bucket" "artifacts" {
  bucket = var.artifacts_bucket_name

  tags = {
    Name            = var.artifacts_bucket_name
    AccountAlias    = var.account_alias
    ContentType     = "demo-artifacts"
    Sensitivity     = "low"
    PublicAccess    = "blocked"
    Encryption      = "AES256"
    Versioning      = "disabled"
    RetentionPolicy = "30-days"
    Purpose         = "Demo and practice artifacts storage"
    CreatedBy       = "terraform-admin"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "artifacts" {
  bucket                  = aws_s3_bucket.artifacts.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  rule {
    id     = "expire-old-artifacts"
    status = "Enabled"

    filter {}    # add this line

    expiration {
      days = 30
    }
  }
}
