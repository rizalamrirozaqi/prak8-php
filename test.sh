#!/usr/bin/env bash
set -e

# 1) Lint semua file PHP
echo "Running PHP lint..."
for file in $(git ls-files '*.php'); do
    php -l "$file"
done

# 2) Functional check menggunakan PHP built‑in server + curl
echo "Running functional check..."
php -S 127.0.0.1:8000 -t public >/dev/null 2>&1 &
SERVER_PID=$!
sleep 2                     # beri waktu server menyala

EXPECTED="Hello, PHP Docker from Jenkins!"
RESPONSE=$(curl -s http://127.0.0.1:8000 | tr -d '\n')

kill $SERVER_PID

if [ "$RESPONSE" != "$EXPECTED" ]; then
  echo "❌ Functional test failed: expected '$EXPECTED' got '$RESPONSE'"
  exit 1
fi

echo "✅ All checks passed."
