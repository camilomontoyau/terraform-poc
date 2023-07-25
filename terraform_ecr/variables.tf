variable "ecr_repo_names" {
    description = "The name of the ECR registry"
    type = any
    default = null
}

variable "image_tag_mutability" {
    description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
    type = string
    default = "IMMUTABLE"
}

variable "scan_on_push" {
    description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)"
    type = bool
    default = true
}

variable "encryption_type" {
    description = "The encryption type to use for the repository. Must be one of: AES256 or KMS"
    type = string
    default = "KMS"
}

variable "tags" {
    description = "A mapping of tags to assign to the resource"
    type = map(string)
    default = {}
}
  
