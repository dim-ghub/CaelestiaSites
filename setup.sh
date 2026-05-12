#!/bin/bash

# CaelestiaSites Native Host Setup Script
# This script registers the caelestiasites native messaging host with Firefox.

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
HOST_PATH="$SCRIPT_DIR/caelestiasites_host.py"
MANIFEST_NAME="caelestiasites.json"
MANIFEST_PATH="$SCRIPT_DIR/extension/$MANIFEST_NAME"

echo "🦊 CaelestiaSites Setup"

# 1. Make host executable
echo "  > Making host script executable..."
chmod +x "$HOST_PATH"

# 2. Identify Firefox native messaging hosts directory
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    TARGET_DIR="$HOME/.mozilla/native-messaging-hosts"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    TARGET_DIR="$HOME/Library/Application Support/Mozilla/NativeMessagingHosts"
else
    echo "❌ Unsupported OS: $OSTYPE"
    exit 1
fi

mkdir -p "$TARGET_DIR"

# 3. Create/Update Manifest
echo "  > Generating native messaging manifest..."
cat <<EOF > "$TARGET_DIR/$MANIFEST_NAME"
{
  "name": "caelestiasites",
  "description": "CaelestiaSites Native Messaging Host",
  "path": "$HOST_PATH",
  "type": "stdio",
  "allowed_extensions": [
    "caelestiasites@dim.contact"
  ]
}
EOF

# 4. Copy template
TEMPLATE_DIR="$HOME/.config/caelestia/templates"
TEMPLATE_SRC="$SCRIPT_DIR/Website Templates/caelestiasites.css"

echo "  > Installing CaelestiaSites template..."
mkdir -p "$TEMPLATE_DIR"
if [ -f "$TEMPLATE_SRC" ]; then
    cp "$TEMPLATE_SRC" "$TEMPLATE_DIR/"
    echo "  ✅ Template copied to $TEMPLATE_DIR/caelestiasites.css"
else
    echo "  ⚠️ Template file not found at $TEMPLATE_SRC"
fi

echo "✅ Setup Complete!"
echo "--------------------------------------------------"
echo "To load the extension in Firefox:"
echo "  1. Open Firefox and go to about:debugging#/runtime/this-firefox"
echo "  2. Click \"Load Temporary Add-on…\""
echo "  3. Select: $MANIFEST_PATH"
echo ""
echo "Website CSS templates are served from: $SCRIPT_DIR/Website Templates/"
echo "Restart Firefox if the host doesn't connect."
echo "--------------------------------------------------"
echo "--------------------------------------------------"
echo "To load the extension in Firefox:"
echo "  1. Open Firefox and go to about:debugging#/runtime/this-firefox"
echo "  2. Click \"Load Temporary Add-on…\""
echo "  3. Select: $MANIFEST_PATH"
echo ""
echo "Restart Firefox if the host doesn't connect."
echo "--------------------------------------------------"
