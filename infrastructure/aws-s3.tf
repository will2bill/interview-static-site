resource "aws_s3_bucket" "site" {
  bucket        = "${local.organisation}-${local.system_code}"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Organisation = local.organisation
    SystemCode   = local.system_code
  }
}

resource "aws_s3_bucket_policy" "site_policy" {
  bucket = aws_s3_bucket.site.id
  policy = data.aws_iam_policy_document.site_bucket_policy.json
}