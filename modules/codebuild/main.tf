resource "aws_s3_bucket" "codebuild_bucket" {
  bucket = "io-shukum-codebuild"
}

resource "aws_codebuild_project" "codebuild_java_experiment" {
  name         = "codebuild_java_experiment"
  description  = "Codebuild project for building the java-experiment project"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type     = "GITHUB"
    location = "https://github.com/shubham908/java-experiments"
  }

  source_version = "main"
}

resource "aws_iam_role" "codebuild_role" {
  name               = "codebuild_service_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  role   = aws_iam_role.codebuild_role.name
  policy = data.aws_iam_policy_document.codebuild_policy_document.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "codebuild_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.codebuild_bucket.arn, "${aws_s3_bucket.codebuild_bucket.arn}/*"]
  }
}
