import json

def load_star_dna(file_path):
    with open(file_path, 'r') as f:
        dna = json.load(f)
    print(f"[*] DNA_INGESTED: {dna['persona_name']} v{dna['version']}")
    print(f"[+] HAPTIC_RESONANCE_LOCKED: {dna['technical_specs']['haptic_frequency']}")
    return dna

if __name__ == "__main__":
    load_star_dna('ccmb/vault/persona_lattices/talira_dna.json')
