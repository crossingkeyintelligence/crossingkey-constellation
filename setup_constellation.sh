#!/bin/bash
echo "[*] Initializing CrossingKey Constellation Environment..."
# Verify Tools
command -v terraform >/dev/null 2>&1 || { echo "Terraform required. Install via 'pkg install terraform'"; exit 1; }

# Step 1: Initialize Cloud Infrastructure
cd terraform
terraform init
# terraform apply -auto-approve # Caution: Actual deployment starts here

# Step 2: Launch API Gateway
cd ../slots/gateway
python3 hub.py &
echo "[+] Constellation Gateway is live on port 8080."
echo "[+] Audit logging active in ccmb/governance/."
