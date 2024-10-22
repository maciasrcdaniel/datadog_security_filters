#!/usr/bin/env bash

# Api key input from CLI
read -p "Api Key: " api_key
# App key input from CLI
read -p "App Key: " app_key

# Security filter ID
read -p "Security Filter ID: " security_filter_id

# Curl command to delete a specific security filter
curl -X DELETE "https://api.datadoghq.com/api/v2/security_monitoring/configuration/security_filters/${security_filter_id}" \
-H "Accept: application/json" \
-H "DD-API-KEY: ${api_key}" \
-H "DD-APPLICATION-KEY: ${app_key}"