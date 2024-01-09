resource "minio_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "minio_s3_bucket_policy" "policy" {
  depends_on = [minio_s3_bucket.bucket]
  bucket     = minio_s3_bucket.bucket.bucket
  policy     = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Deny",
            "Principal": {
                "AWS": [
                    "*"
                ]
            },
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "${minio_s3_bucket.bucket.arn}"
            ]
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "*"
                ]
            },
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": [
                "${minio_s3_bucket.bucket.arn}"
            ]
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "*"
                ]
            },
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "${minio_s3_bucket.bucket.arn}/*"
            ]
        }
    ]
}
EOF
}

resource "minio_s3_bucket_versioning" "bucket" {
  depends_on = [minio_s3_bucket.bucket]
  bucket     = minio_s3_bucket.bucket.bucket

  versioning_configuration {
    status = "Suspended"
  }
}

resource "minio_iam_user" "user" {
  name          = var.bucket_user
  secret        = var.bucket_user_password
  force_destroy = false
}

resource "minio_iam_policy" "policy" {
  name   = "${var.bucket_user}_policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
            "s3:ListBucket",
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
        ],
      "Resource": [
        "${minio_s3_bucket.bucket.arn}/*",
        "${minio_s3_bucket.bucket.arn}"
      ],
      "Sid": "bucketPolicy"
    }
  ]
}
EOF
}

resource "minio_iam_user_policy_attachment" "policy_to_user" {
  user_name   = minio_iam_user.user.id
  policy_name = minio_iam_policy.policy.id
}
