/*
Network output
*/
output "load_balancer_dns" {
  value = module.load_balancer.lb_dns
  description = "Load Balancer DNS record"
}

output "db_endpoint"{
    value = module.db.db_instance_endpoint
    description = "DB endpoint"
}