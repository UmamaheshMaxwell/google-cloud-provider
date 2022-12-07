# Create VPC 1
gcloud compute networks create custom-network-1 --subnet-mode=custom 

# create a subnet for custom network 1
gcloud compute networks subnets create subnet-1a --network=custom-network-1 --region=us-west4 --range=10.3.1.0/24
gcloud compute networks subnets create subnet-1b --network=custom-network-1 --region=us-west4 --range=10.3.2.0/24

# create instance-1
gcloud compute instances create instance-1 --zone=us-west4-b --machine-type=f1-micro --subnet=subnet-1a

# creating a firewall for custom-network-1
gcloud compute firewall-rules create allow-ssh-custom-network-1 --network=custom-network-1 --direction=INGRESS --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0 --project=gcp-training-369216
gcloud compute firewall-rules create allow-ping-custom-network-1 --network=custom-network-1 --direction=INGRESS --action=ALLOW --rules=icmp --source-ranges=0.0.0.0/0 --project=gcp-training-369216


# Create VPC 2
gcloud compute networks create custom-network-2 --subnet-mode=custom

# create a subnet for custom network 2
gcloud compute networks subnets create subnet-2a --network=custom-network-2 --region=us-west4 --range=10.4.1.0/24
gcloud compute networks subnets create subnet-2b --network=custom-network-2 --region=us-west4 --range=10.4.2.0/24

# create instance-2
gcloud compute instances create instance-2 --zone=us-west4-b --machine-type=f1-micro --subnet=subnet-2a

# creating a firewall for custom-network-2
gcloud compute firewall-rules create allow-ssh-custom-network-2 --network=custom-network-2 --direction=INGRESS --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0 --project=gcp-training-369216
gcloud compute firewall-rules create allow-ping-custom-network-2 --network=custom-network-2 --direction=INGRESS --action=ALLOW --rules=icmp --source-ranges=0.0.0.0/0 --project=gcp-training-369216

# Create VPC 3
gcloud compute networks create custom-network-3 --subnet-mode=custom
# create a subnet for custom network 2
gcloud compute networks subnets create subnet-3a --network=custom-network-3 --region=us-west4 --range=10.5.1.0/24
gcloud compute networks subnets create subnet-3b --network=custom-network-3 --region=us-west4 --range=10.5.2.0/24

# create instance-3
gcloud compute instances create instance-3 --zone=us-west4-b --machine-type=f1-micro --subnet=subnet-3a

# creating a firewall for custom-network-3
gcloud compute firewall-rules create allow-ssh-custom-network-3 --network=custom-network-3 --direction=INGRESS --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0 --project=gcp-training-369216
gcloud compute firewall-rules create allow-ping-custom-network-3 --network=custom-network-3 --direction=INGRESS --action=ALLOW --rules=icmp --source-ranges=0.0.0.0/0 --project=gcp-training-369216
