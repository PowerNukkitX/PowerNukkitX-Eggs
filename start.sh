#!/bin/bash
set -e

JAR_NAME="powernukkitx-shaded.jar"
DOWNLOAD_URL="https://github.com/PowerNukkitX/PowerNukkitX/releases/download/snapshot/powernukkitx-shaded.jar"

echo "=== PowerNukkitX Startup Script ==="

# Check Java
if ! command -v java >/dev/null 2>&1; then
  echo "ERROR: Java is not installed"
  exit 1
fi

java -version

# Download jar if missing
if [ ! -f "$JAR_NAME" ]; then
  echo "Downloading PowerNukkitX..."
  wget -O "$JAR_NAME" "$DOWNLOAD_URL"
fi

# Validate jar
echo "Validating jar..."
if ! jar tf "$JAR_NAME" >/dev/null 2>&1; then
  echo "ERROR: Jar is corrupted. Re-downloading..."
  rm -f "$JAR_NAME"
  wget -O "$JAR_NAME" "$DOWNLOAD_URL"

  if ! jar tf "$JAR_NAME" >/dev/null 2>&1; then
    echo "ERROR: Downloaded jar is still invalid"
    exit 1
  fi
fi

echo "Starting PowerNukkitX..."

exec java \
  -Dfile.encoding=UTF-8 \
  -Djansi.passthrough=true \
  -Dterminal.ansi=true \
  -XX:+UseG1GC \
  -XX:+UseStringDeduplication \
  -XX:MaxRAMPercentage=90.0 \
  -jar "$JAR_NAME"
