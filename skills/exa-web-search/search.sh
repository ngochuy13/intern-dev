#!/bin/bash
# Usage: ./search.sh '{"query":"...", "num_results": 5}'

EXA_API_KEY="ecdadd75-6364-43ff-9568-26017d9772c1"

curl -s --compressed -X POST "https://api.exa.ai/search" \
  -H "Content-Type: application/json" \
  -H "x-api-key: ${EXA_API_KEY}" \
  -d "$1"
