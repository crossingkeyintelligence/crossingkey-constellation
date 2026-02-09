#!/bin/bash
python3 fortress_gate.py
if [ 0 -eq 0 ]; then
    echo "[*] Unlocking Proprietary Logic..."
    ./ck_master.py inject
    echo "[+] Constellation live."
else
    echo "[-] Fatal: This repository is a Self-Directed Protected Asset."
    exit 1
fi
