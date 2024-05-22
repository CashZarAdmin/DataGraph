import uuid
import hashlib
from datetime import datetime

def generate_id():
    # Generate UUID
    uuid_val = uuid.uuid4()
    # Create SHA-256 hash of the UUID
    sha256_val = hashlib.sha256(str(uuid_val).encode('utf-8')).hexdigest()
    # Get current date and hour
    date_str = datetime.now().strftime('%Y%m%d%H')
    # Combine date_str with the first 10 characters of sha256_val
    combined_id = date_str + sha256_val[:10]
    return uuid_val, combined_id

# Generate 20 UUID and ID pairs
uuid_id_pairs = [generate_id() for i in range(10)]

# Print the results
for uuid_val, generated_id in uuid_id_pairs:
    print(f"{uuid_val},{generated_id}")
