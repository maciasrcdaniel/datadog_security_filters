#!/usr/bin/env bash

# Api key input from CLI
read -p "Api Key: " api_key
# App key input from CLI
read -p "App Key: " app_key

# Curl command get all security filters
curl -X GET "https://api.datadoghq.com/api/v2/security_monitoring/configuration/security_filters" \
-H "Accept: application/json" \
-H "DD-API-KEY: ${api_key}" \
-H "DD-APPLICATION-KEY: ${app_key}"

