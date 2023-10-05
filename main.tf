#Create S3 bucket

resource "aws_s3_bucket" "projectbucket" {
  bucket = var.bucketname
} 

#Objects uploaded to the bucket change ownership to the bucket owner
resource "aws_s3_bucket_ownership_controls" "eaabucket" {
  bucket = aws_s3_bucket.projectbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#Make the bucket public
resource "aws_s3_bucket_public_access_block" "eaabucket" {
  bucket = aws_s3_bucket.projectbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#Bucket ACL - Public Read
resource "aws_s3_bucket_acl" "eaabucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.eaabucket,
    aws_s3_bucket_public_access_block.eaabucket,
  ]

  bucket = aws_s3_bucket.projectbucket.id
  acl    = "public-read"
}

#Uploading files to bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.projectbucket.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.projectbucket.id
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

#Website Configuration
resource "aws_s3_bucket_website_configuration" "projectwebsite" {
  bucket = aws_s3_bucket.projectbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.eaabucket ]
}