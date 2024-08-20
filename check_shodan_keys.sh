#!/bin/bash

# File containing API keys
API_KEYS_FILE="api_keys.txt"

# Output file
OUTPUT_FILE="shodan_key_status.txt"

# Clear the output file if it exists
> $OUTPUT_FILE

# Check each API key
while IFS= read -r api_key; do
    echo "Checking API key: $api_key"
    response=$(curl -s -H "Authorization: $api_key" https://api.shodan.io/api-info)
    if echo "$response" | grep -q '"error":'; then
        echo "$api_key: Inactive" >> $OUTPUT_FILE
    else
        echo "$api_key: Active" >> $OUTPUT_FILE
        # Optionally, also check credits and scan information
        echo "$api_key: $(echo $response | grep -o '"total_credits":[^,]*')" >> $OUTPUT_FILE
        echo "$api_key: $(echo $response | grep -o '"scan_credits":[^,]*')" >> $OUTPUT_FILE
    fi
done < "$API_KEYS_FILE"

echo "Check complete. Results saved to $OUTPUT_FILE."
