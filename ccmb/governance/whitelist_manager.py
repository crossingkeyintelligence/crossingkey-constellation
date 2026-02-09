import json
import os

WHITELIST_FILE = "ccmb/governance/authorized_navigators.json"

def add_navigator(username, transaction_id):
    if not os.path.exists(WHITELIST_FILE):
        with open(WHITELIST_FILE, "w") as f:
            json.dump({}, f)
    
    with open(WHITELIST_FILE, "r") as f:
        data = json.load(f)
    
    data[username] = {"status": "ACTIVE", "tx": transaction_id, "level": "GODMODE"}
    
    with open(WHITELIST_FILE, "w") as f:
        json.dump(data, f, indent=4)
    
    print(f"[+] Navigator {username} authorized via Transaction {transaction_id}.")

if __name__ == "__main__":
    user = input("Enter Paid GitHub Username: ")
    tx = input("Enter Cash App Transaction ID: ")
    add_navigator(user, tx)
