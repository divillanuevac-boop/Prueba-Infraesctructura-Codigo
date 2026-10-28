variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "users" {
  type    = list(string)
  default = ["./user1", "./user2"]
}
```[cite: 2, 3]