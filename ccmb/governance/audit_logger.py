import json
import time

def log_transaction(user_key, model, tokens, cost):
    audit_entry = {
        "timestamp": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "navigator": user_key,
        "resource": model,
        "usage_metric": tokens,
        "arbitrage_gain": cost * 0.20, # Estimated savings vs direct OpenAI
        "compliance": "EU_AI_ACT_V1_READY"
    }
    with open("ccmb/governance/immutable_audit.log", "a") as f:
        f.write(json.dumps(audit_entry) + "\n")
