# Shodan API Key Management and Info Check

## Overview
This repository contains scripts and files for managing and checking Shodan API keys. Use these scripts to verify the status of your Shodan API keys and fetch account information, including credits.

## Files

1. **`api_keys.txt`**
   - **Description**: Contains a list of Shodan API keys, one per line.
   - **Usage**: Add your Shodan API keys to this file for checking their status.

2. **`check_shodan_keys.sh`**
   - **Description**: Checks the status of each API key in `api_keys.txt`.
   - **Output**: `shodan_key_status.txt` – Lists the status of each API key (Active/Inactive) and optionally includes credits information.
   - **Usage**:
     ```bash
     chmod +x check_shodan_keys.sh
     ./check_shodan_keys.sh
     ```

3. **`active_api.txt`**
   - **Description**: Contains a list of active Shodan API keys, one per line.
   - **Usage**: This file is used by `check_shodan_info_for_active_keys.sh` to fetch account information for the listed active API keys.

4. **`check_shodan_info_for_active_keys.sh`**
   - **Description**: Fetches and checks Shodan account information for each active API key in `active_api.txt`.
   - **Output**: `shodan_info_for_active_keys.txt` – Contains detailed account information, including credits and scan credits.
   - **Usage**:
     ```bash
     chmod +x check_shodan_info_for_active_keys.sh
     ./check_shodan_info_for_active_keys.sh
     ```

5. **`shodan_key_status.txt`**
   - **Description**: Output file from `check_shodan_keys.sh` that lists the status of all API keys and their credits.

6. **`shodan_info_for_active_keys.txt`**
   - **Description**: Output file from `check_shodan_info_for_active_keys.sh` that contains detailed information for each active API key.

## Usage Instructions

1. **Prepare API Keys**:
   - Add your Shodan API keys to `api_keys.txt`. Ensure each key is on a new line.

2. **Check API Key Status**:
   - Run `check_shodan_keys.sh` to determine the status of each API key.
     ```bash
     ./check_shodan_keys.sh
     ```
   - Review `shodan_key_status.txt` for the results.

3. **Filter Active API Keys**:
   - Copy active API keys from `shodan_key_status.txt` to `active_api.txt`.

4. **Check Account Information for Active Keys**:
   - Run `check_shodan_info_for_active_keys.sh` to fetch detailed information for each active API key.
     ```bash
     ./check_shodan_info_for_active_keys.sh
     ```
   - Review `shodan_info_for_active_keys.txt` for detailed account information.

## Notes

- Ensure you have `curl` installed on your system to run the scripts.
- Replace placeholder API keys in `api_keys.txt` and `active_api.txt` with your actual Shodan API keys.
- Keep your API keys secure and do not share them publicly.
