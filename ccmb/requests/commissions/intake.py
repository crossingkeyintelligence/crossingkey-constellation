def create_order(client_name, style, duration):
    order_id = "CK_242fe4"
    print(f"--- NEW COMMISSION ORDER: {order_id} ---")
    print(f"Client: {client_name}")
    print(f"Style: {style} (e.g., Rotoscoped/Hyper-Detailed)")
    print(f"Length: {duration} seconds")
    print(f"Deposit Required: $125.00 to $TheCrossingKey")
    print("------------------------------------------")
    return order_id

if __name__ == "__main__":
    name = input("Client Name: ")
    style = input("Visual Style: ")
    length = input("Target Runtime (sec): ")
    create_order(name, style, length)
