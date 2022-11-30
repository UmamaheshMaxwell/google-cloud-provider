# Create a VPC
gcloud compute networks create custom-network --subnet-mode custom 

# Create subnet-a in VPC
gcloud compute networks subnets create sub-a --network custom-network --region us-west4 --range 10.2.1.0/24 

# Create subnet-b in VPC
gcloud compute networks subnets create sub-b --network custom-network --region us-west4 --range 10.2.2.0/24

# Create a VM
gcloud compute instances create instance-1a --zone=us-west4-b --machine-type=f1-micro --subnet=sub-a
gcloud compute instances create instance-1b --zone=us-west4-b --machine-type=f1-micro --subnet=sub-a --no-address
gcloud compute instances create instance-1c --zone=us-west4-b --machine-type=f1-micro --subnet=sub-a --no-address

gcloud compute instances create instance-2 --zone=us-west4-b --machine-type=f1-micro --subnet=sub-b --no-address 
gcloud compute instances create instance-3 --zone=us-west4-b --machine-type=f1-micro --subnet=sub-b --no-address

# Create a firewall for opening 22 port for 0.0.0.0/0 across all instances 
gcloud compute --project=gcp-training-369216 firewall-rules create allow-ssh-custom-network --direction=INGRESS --priority=1000 --network=custom-network --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0

# Create a firewall for icmp 
gcloud compute --project=gcp-training-369216 firewall-rules create allow-ping-custom-network --direction=INGRESS --priority=1000 --network=custom-network --action=ALLOW --rules=icmp --source-ranges=0.0.0.0/0

gcloud compute --project=gcp-training-369216 firewall-rules create allow-ping-internally --direction=INGRESS --priority=1000 --network=custom-network --action=ALLOW --rules=icmp --source-ranges=10.2.1.0/24,10.2.2.0/24
