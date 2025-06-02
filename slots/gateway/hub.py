import os
import requests
from flask import Flask, request, jsonify

app = Flask(__name__)

# CONFIGURATION: OCI (Always Free) + GCP (Elastic)
GCP_ENDPOINT = os.getenv("GCP_INFERENCE_URL", "https://crossingkey-inference-gcp.a.run.app")
USAGE_LOG = "ccmb/history/usage.log"

@app.route('/v1/crossingkey/invoke', methods=['POST'])
def invoke():
    auth_key = request.headers.get("X-Kennkarte-Key")
    if not auth_key:
        return jsonify({"error": "Unauthorized: Missing Kennkarte"}), 401

    # ARBITRAGE LOGIC: Route to GCP for high-load, OCI for local logic
    data = request.json
    print(f"[*] Signal received from {auth_key}. Routing to GCP...")
    
    response = requests.post(GCP_ENDPOINT, json=data)
    
    # TELEMETRY: Log usage for monetization tracking
    with open(USAGE_LOG, "a") as f:
        f.write(f"{auth_key} | {data.get('model')} | {len(response.text)} bytes\n")
        
    return response.json()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
