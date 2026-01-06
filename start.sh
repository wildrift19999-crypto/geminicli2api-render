#!/bin/bash

# Write credentials from environment variable
if [ ! -z "$GEMINI_CREDENTIALS" ]; then
    echo "$GEMINI_CREDENTIALS" > /root/.gemini/oauth_creds.json
    echo "✅ Credentials loaded successfully"
else
    echo "❌ ERROR: GEMINI_CREDENTIALS environment variable not set!"
    exit 1
fi

# Start the server
echo "🚀 Starting geminicli2api server..."
python run.py
