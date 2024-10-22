#!/usr/bin/env bash

# Api key input from CLI
read -p "Api Key: " api_key
# App key input from CLI
read -p "App Key: " app_key

# Security filter ID
read -p "Security Filter ID: " security_filter_id

# Curl command to create a custom security filter
# Replace "name" and "query" with name of new filter and the query for filtering
curl -X POST "https://api.datadoghq.com/api/v2/security_monitoring/configuration/${security_filter_id}" \
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
          "name": "Exclude staging",
          "query": "source:staging"
        }
      ],
      "filtered_data_type": "logs",
      "is_enabled": true,
    },
    "type": "security_filters"
  }
}
EOF