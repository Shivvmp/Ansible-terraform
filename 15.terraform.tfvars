aws_region           = "ap-south-1"
vpc_cidr             = "10.37.0.0/16"
vpc_name             = "Ansible-Vpc"
key_name             = "secops"
public_subnet_cidrs  = ["10.37.1.0/24", "10.37.2.0/24"]    #List
private_subnet_cidrs = ["10.37.10.0/24", "10.37.20.0/24"] #List
azs                  = ["ap-south-1a", "ap-south-1b"]          #List
environment          = "production"
instance_type = {
  development = "t2.micro"
  testing     = "t2.micro"
  production  = "t2.micro"
}
amis = {
  ap-south-1 = "ami-0e35ddab05955cf57" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
  ap-southeast-1 = "ami-01938df366ac2d954" # Canonical, Ubuntu, 20.04 LTS, amd64 focal image
}
projid    = "PHOENIX-123"
imagename = "ami-0e35ddab05955cf57"
