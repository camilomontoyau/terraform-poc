# terraform proof of concept

## terraform scripts

plan with dev.tfvars ```terraform plan -var-file=dev.tfvars``` 


apply with prod.tfvars ```terraform apply -var-file prod.tfvars```

destroy with prod.tfvars ```terraform destroy -var-file prod.tfvars```

validate current .tf files ```terraform validate```
