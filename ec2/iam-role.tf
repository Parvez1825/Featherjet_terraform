
resource "aws_iam_instance_profile" "profile" {
  name = "featherjet-profile"
  role = aws_iam_role.session-role.name
}

resource "aws_iam_role" "session-role" {
  name               = "ec2-role"
  assume_role_policy = <<-JSON
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
  JSON
}

resource "aws_iam_role_policy_attachment" "AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.session-role.name

}


