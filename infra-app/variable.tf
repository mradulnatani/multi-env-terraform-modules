variable "env" {
  description = "environment for the infra"
  type = string
}

variable "bucket_name" {
  description = "bucket name for the desired environment"
  type = string

}

variable "instance_count" {
  description = "number of instances for the environment"
  type = number
}

variable "instance_type" {
  description = "type of aws ec2 instance"
  type = string
}

variable "ami_id" {
  description = "ami id of the ec2 instance"
  type = string
}

variable "hash_key" {
  description = "hash key for the dynamoDB table"
  type = string

    }
