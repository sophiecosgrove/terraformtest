## Single Availability Zone Deployment
- Change to the deployment module
- Change the availability zone variable to equal data. aws_availability_zones.available.names[0] or whatever index number required
- Uncomment vpc module
- Comment out vpc parent level variable
- Change corresponding vpc_ids to vpc_id = module.vpc.vpc_id