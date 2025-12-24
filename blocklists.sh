#!/bin/bash

OUTPUT_DIR="/etc/knot-resolver/blocklists"
mkdir -p "$OUTPUT_DIR"
WEBHOOK_URL="discord-webhook-url"

declare -A FILE_MAP=(
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/pro.txt"]="hagezi-pro.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.apple.txt"]="hagezi-apple.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.samsung.txt"]="hagezi-samsung.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.oppo-realme.txt"]="hagezi-oppo-realme.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.xiaomi.txt"]="hagezi-xiaomi.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.vivo.txt"]="hagezi-vivo.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.winoffice.txt"]="hagezi-winoffice.rpz"
)

FAILED_FILES=()

for URL in "${!FILE_MAP[@]}"; do
    FILE_NAME="${FILE_MAP[$URL]}"
    OUTPUT_FILE="$OUTPUT_DIR/$FILE_NAME"

    if ! curl -sf \
        --connect-timeout 10 \
        --max-time 30 \
        --retry 3 \
        --retry-delay 3 \
        "$URL" > "$OUTPUT_FILE"; then
        FAILED_FILES+=("$FILE_NAME")
    fi
done

if [ ${#FAILED_FILES[@]} -eq 0 ]; then
    MESSAGE="**Blocklist Update Successful**\nServer: Mumbai\nTime: $(date)"
else
    FAILED_LIST=$(printf "• %s\n" "${FAILED_FILES[@]}")
    MESSAGE="**Blocklist Update Partial Failure**\nServer: Mumbai\nTime: $(date)\n**Failed after retries:**\n$FAILED_LIST"
fi

curl -s -H "Content-Type: application/json" -X POST -d "{\"content\": \"$MESSAGE\"}" "$WEBHOOK_URL"