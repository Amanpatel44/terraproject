provider "aws" {
region = "us-east-2"
access_key = "AKIAWM6ULWHBEYLGE3DQ"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-05bfbece1ed5beb54"
instance_type = "t2.medium"
  key_name = "terrakey"
  vpc_security_group_ids = [aws_security_group.three.id]
  availibiltiy_zone = "us-east-2a"
  user_data    = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hello everybody this is my website created by terraform infrastructure by aman sir server-1"  > /var/www/html/index.html
EOF
tags = {
Name = "swiggy-01"
}
}

resource "aws_instance" "two" {
ami = "ami-05bfbece1ed5beb54"
instance_type = "t2.medium"
  key_name = "terrakey"
  vpc_security_group_ids = [aws_security_group.three.id]
  availibiltiy_zone = "us-east-2b"
  user_data    = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hello everybody this is my website created by terraform infrastructure by aman sir server-2"  > /var/www/html/index.html
EOF
tags = {
Name = "swiggy-02"
}
}
