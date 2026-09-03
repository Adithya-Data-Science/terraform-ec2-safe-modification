variable "aws_region" { type = string; default = "us-east-1" }
variable "instance_type" {
  type = string
  default = "t3.micro"
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Use t2.micro or t3.micro for this classroom lab."
  }
}
variable "environment" { type = string; default = "Classroom" }
variable "monitoring" { type = bool; default = false }

