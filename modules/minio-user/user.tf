resource "minio_iam_user" "user" {
  name          = var.user
  secret        = var.user_password
  force_destroy = false
}

locals {
  buckets = flatten([
    for bucket in var.buckets : [
      "arn:aws:s3:::${bucket}", "arn:aws:s3:::${bucket}/*"
    ]
  ])
}

resource "minio_iam_policy" "policy" {
  name   = "${var.user}_policy"
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
      "Resource": ${jsonencode(local.buckets)},
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

# resource "minio_iam_policy" "anonymouse_policy" {
#   name   = "${var.user}_anonymouse_policy"
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Action": [
#             "s3:GetObject",
#             "s3:GetBucketLocation"
#        ],
#       "Resource": [
#         "${minio_s3_bucket.bucket.arn}/*",
#         "${minio_s3_bucket.bucket.arn}"
#       ],
#       "Sid": "bucketAnonymousePolicy"
#     }
#   ]
# }
# EOF
# }

