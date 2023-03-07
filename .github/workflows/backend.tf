
data "aws_subnets" "CloudEnablement_subnet" {

  filter {
    name   = "tag:Name"
    values = ["CloudEnablement Public Subnet (AZ1)"] 
  }
}

data "aws_iam_instance_profile" "ssm_profile" {
  name = "AmazonSSMRoleForInstancesQuickSetup"
}

resource "aws_instance" "web_server" {
  count         = 1
  ami           = "ami-0692dea0a2f8a1b35"
  instance_type = "t2.micro"
  iam_instance_profile = data.aws_iam_instance_profile.ssm_profile.name

  subnet_id     = data.aws_subnets.CloudEnablement_subnet.ids[0]

  tags = {
    Name = "team_lucky_ec2"
  }
}
