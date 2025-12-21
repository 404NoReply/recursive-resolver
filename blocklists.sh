#!/bin/bash

OUTPUT_DIR="/etc/knot-resolver/blocklists"
mkdir -p "$OUTPUT_DIR"

declare -A FILE_MAP=(
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/pro.txt"]="hagezi-pro.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.apple.txt"]="hagezi-apple.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.samsung.txt"]="hagezi-samsung.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.oppo-realme.txt"]="hagezi-oppo-realme.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.xiaomi.txt"]="hagezi-xiaomi.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.vivo.txt"]="hagezi-vivo.rpz"
    ["https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/native.winoffice.txt"]="hagezi-winoffice.rpz"
)

for URL in "${!FILE_MAP[@]}"; do
    OUTPUT_FILE="$OUTPUT_DIR/${FILE_MAP[$URL]}"
    curl -s "$URL" > "$OUTPUT_FILE"
done