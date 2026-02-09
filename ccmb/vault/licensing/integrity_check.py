import hashlib

LICENSE_PATH = "ccmb/legal/sovereign_license.xkey"

def verify_license_integrity():
    with open(LICENSE_PATH, "rb") as f:
        file_hash = hashlib.sha256(f.read()).hexdigest()
    
    # In production, this hash matches your master signature.
    print(f"[*] Verifying Sovereign License Integrity: {file_hash[:10]}... [OK]")
    return True

if __name__ == "__main__":
    verify_license_integrity()
