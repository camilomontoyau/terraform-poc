terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "my_postgres" {
  name       = "my-postgres"
  chart      = "./postgres"
  namespace  = "default"
}

#resource "helm_release" "my_app" {
#  name       = "my-app"
#  chart      = "./myapp/helm"
#  namespace  = "default"
#}
