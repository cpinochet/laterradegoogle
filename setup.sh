#!/bin/bash
terraform plan 

terraform apply -auto-approve

printf 'waiting ';for i in {1..3}; do printf '.'; sleep 1; done; echo""

gcloud compute firewall-rules create terra-out-allow-all-1 --direction EGRESS --priority 1000 --allow all --network terraform-network --project my-terra-project-9323

printf 'waiting ';for i in {1..3}; do printf '.'; sleep 1; done; echo""

gcloud compute firewall-rules create terra-in-allow-ping-1 --direction INGRESS --priority 1000 --allow icmp --network terraform-network --project my-terra-project-9323

printf 'waiting ';for i in {1..3}; do printf '.'; sleep 1; done; echo""

gcloud compute firewall-rules create terra-in-allow-ssh-1 --direction INGRESS --priority 1000 --allow tcp:22 --network terraform-network --project my-terra-project-9323

printf 'waiting ';for i in {1..3}; do printf '.'; sleep 1; done; echo""

gcloud compute firewall-rules create terra-in-allow-web-1 --direction INGRESS --priority 1000 --allow tcp:80,tcp:443 --network terraform-network --project my-terra-project-9323

printf 'waiting ';for i in {1..3}; do printf '.'; sleep 1; done; echo""

gcloud compute instances add-metadata terra-insta --zone us-central1-c --metadata-from-file startup-script=startup2.sh --project my-terra-project-9323

printf 'waiting ';for i in {1..3}; do printf '.'; sleep 1; done; echo""

gcloud compute instances reset terra-insta --project my-terra-project-9323 --zone us-central1-c

