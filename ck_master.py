import sys

def main():
    if len(sys.argv) < 2:
        print("Usage: ck <command> (e.g., ck inject, ck project, ck audit)")
        return

    cmd = sys.argv[1]
    if cmd == "inject":
        print("[+] DBI Master Signal Sent. Infrastructure Updated.")
    elif cmd == "project":
        print("[+] Launching Cinematic Projection... [180s sequence initiated]")
    else:
        print(f"[-] Unknown Command: {cmd}. Refer to CCMB.")

if __name__ == "__main__":
    main()
