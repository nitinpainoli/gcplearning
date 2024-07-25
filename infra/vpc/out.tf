output "id" {
  description = "value"
  value = module.vpc.id
}

output "vpc_self" {
   
  value = module.vpc.vpc_self
}

output "subnetwork_self" {
  
    
  value = module.vpc.subnetwork_self
}


output "name" {
  value = module.vpc.name
}

output "subnetname" {
  description = "value"
  value = module.vpc.subnetname
}


output "subnetnamedb" {
  description = "value"
  value = module.vpc.subnetnamedb
}


output "subnetnamegke" {
  description = "value"
  value = module.vpc.subnetnamegke
}



output "nat_ip" {
   value =  module.vpc.nat_ip
}