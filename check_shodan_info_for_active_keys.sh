#!/bin/bash

# File containing active API keys
ACTIVE_KEYS_FILE="active_api.txt"

# Output file for Shodan account information
INFO_FILE="shodan_info_for_active_keys.txt"

# Clear the output file if it exists
> $INFO_FILE

# Check each API key
while IFS= read -r api_key; do
    echo "Fetching information for API key: $api_key"
    response=$(curl -s -H "Authorization: $api_key" https://api.shodan.io/api-info)

    if echo "$response" | grep -q '"error":'; then
        echo "$api_key: Inactive or Error" >> $INFO_FILE
    else
        echo "$api_key: Active" >> $INFO_FILE
        echo "Total Credits:" $(echo $response | grep -o '"total_credits":[^,]*') >> $INFO_FILE
        echo "Scan Credits:" $(echo $response | grep -o '"scan_credits":[^,]*') >> $INFO_FILE
        echo "-----" >> $INFO_FILE
    fi
done < "$ACTIVE_KEYS_FILE"

echo "Info check complete. Results saved to $INFO_FILE."
