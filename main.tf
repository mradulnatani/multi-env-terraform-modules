module "dev_infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "terraform-infra-app-bucket-multienv"
    instance_count = 1
    instance_type = "t2.micro"
    ami_id = "ami-0360c520857e3138f"
    hash_key = "LockID"
}

module "stg_infra" {
    source = "./infra-app"
    env = "stg"
    bucket_name = "terraform-infra-app-bucket-multienv"
    instance_count = 1
    instance_type = "t2.micro"
    ami_id = "ami-0360c520857e3138f"
    hash_key = "LockID"

}

module "prd_infra" {
    source = "./infra-app"
    env = "prd"
    bucket_name = "terraform-infra-app-bucket-multienv"
    instance_count = 2
    instance_type = "t2.medium"
    ami_id = "ami-0360c520857e3138f"
    hash_key = "LockID"

}

