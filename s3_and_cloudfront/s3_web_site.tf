locals {
  s3_origin_id = "cleitinho"
}

resource "aws_s3_bucket" "my_S3_Web_Site" {
  bucket = "cleitinho"

}

resource "aws_s3_bucket_acl" "my_S3_Web_Site_Acl" {
  bucket = aws_s3_bucket.my_S3_Web_Site.id
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "my_S3_Web_Site_Versioning" {
  bucket = aws_s3_bucket.my_S3_Web_Site.id

  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_s3_bucket_website_configuration" "my_S3_Web_Site_Configuration" {
  bucket = aws_s3_bucket.my_S3_Web_Site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "my_S3_Web_Site_Policy" {
  bucket = aws_s3_bucket.my_S3_Web_Site.id
  policy = data.aws_iam_policy_document.allow_public_access.json
}

data "aws_iam_policy_document" "allow_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.my_S3_Web_Site.arn}/*"
    ]

  }
}

resource "aws_s3_object" "index_page" {
  bucket       = aws_s3_bucket.my_S3_Web_Site.id
  key          = "index.html"
  content_type = "text/html; charset=UTF-8"
  source       = "website/index.html"
  etag         = filemd5("website/index.html")
}

resource "aws_s3_object" "error_page" {
  bucket       = aws_s3_bucket.my_S3_Web_Site.id
  key          = "error.html"
  content_type = "text/html; charset=UTF-8"
  source       = "website/error.html"
  etag         = filemd5("website/error.html")
}