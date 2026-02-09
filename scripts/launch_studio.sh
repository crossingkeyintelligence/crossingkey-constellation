#!/bin/bash
echo "--- 👑 CROSSINGKEY SYNTHETIC STUDIO: BOOT SEQUENCE ---"
cd ~/crossingkey-constellation/terraform/render_nodes && terraform apply -auto-approve
cd ~/crossingkey-constellation
python3 ccmb/production/engine/render_engine.py
echo "[+] STUDIO ACTIVE. MONITORING REVENUE AT $TheCrossingKey."
