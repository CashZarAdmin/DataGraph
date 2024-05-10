# import json
# import uuid

# # Read JSON data from a file
# with open('/Users/BB/CashZar/datagraph/schema.json', 'r') as file:
#     data = json.load(file)

# # Extract the data from the "graph" key
# graph_data = data['graph']

# # Prepare the output dictionary
# output_data = {}

# # Process each key in the "graph" data
# for key, value in graph_data.items():
#     # Check if the current key should be processed
#     # You can add more conditions here if needed
#     if isinstance(value, list):  # Assuming we process if the value is a list
#         # Generate a unique identifier
#         unique_id = str(uuid.uuid4())

#         # Create a new entry in the output data with a new format
#         output_data[unique_id] = {
#             "name": key,
#             "description": "this is description",
#             "relationships": value
#         }

# # Output the JSON to a file or print it
# print(json.dumps(output_data, indent=4))

# # Optionally, write the output to a file
# with open('/Users/BB/CashZar/datagraph/output.json', 'w') as file:
#     json.dump(output_data, file, indent=4)
import json

# Sample data read from a file, assuming it's named 'data.json'
with open("/Users/BB/CashZar/datagraph/output.json", "r") as file:
    data = json.load(file)

# Create a lookup table for node names to IDs
name_to_id = {}
for node_id, node_info in data.items():
    name_to_id[node_info['name']] = node_id

# Replace names in relationships with IDs
for node_info in data.values():
    if 'relationships' in node_info:
        for relationship in node_info['relationships']:
            # Process every key in the relationship that contains a list
            for key, names in relationship.items():
                if isinstance(names, list):  # Ensure it's a list before processing
                    updated_items = []
                    for name in names:
                        # Map the name to its ID using the lookup table
                        if name in name_to_id:
                            updated_items.append(name_to_id[name])
                        else:
                            updated_items.append(name)  # Keep the original if no ID is found
                    relationship[key] = updated_items

# Output the updated data to a file or print it
print(json.dumps(data, indent=4))

with open("/Users/BB/CashZar/datagraph/output1.json", "w") as file:
    json.dump(data, file, indent=4)
