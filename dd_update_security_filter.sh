#!/usr/bin/env bash

# Api key input from CLI
read -p "Api Key: " api_key
# App key input from CLI
read -p "App Key: " app_key

# Security filter ID
read -p "Security Filter ID: " security_filter_id

# Curl command to update a security filter
# "name" and "query" are the required fields to change if an update is required to the specified security field
curl -X PATCH "https://api.datadoghq.com/api/v2/security_monitoring/configuration/security_filters/${security_filter_id}" \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${api_key}" \
-H "DD-APPLICATION-KEY: ${app_key}" \
-d @- << EOF
{
  "data": {
    "attributes": {
      "exclusion_filters": [
        {
            "name": "Exclude USB_Disconneted Devices"
            "query": "source:sentinelone @data.interface:USB @data.eventType:disconnected"
        }  
      ],
      "filtered_data_type": "logs",
      "is_enabled": true,
      "version": 1
    },
    "type": "security_filters"
  }
}
EOF
