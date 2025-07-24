#!/usr/bin/env bash
set -euo pipefail

SRC_BASE="${COMFY_REMOTE_BASE:-/workspace/ComfyUI}"

SRC_MODELS="${COMFY_MODELS_DIR:-$SRC_BASE/models}"
SRC_CUSTOM="${COMFY_CUSTOM_DIR:-$SRC_BASE/custom_nodes}"

DST_MODELS="/comfyui/models"
DST_CUSTOM="/comfyui/custom_nodes"

echo "[entrypoint] Mount volume at: $SRC_BASE"
echo "[entrypoint] Source models:       $SRC_MODELS"
echo "[entrypoint] Source custom_nodes:  $SRC_CUSTOM"
echo "[entrypoint] Target models dir:    $DST_MODELS"
echo "[entrypoint] Target custom dir:    $DST_CUSTOM"

if [ -d "$SRC_MODELS" ]; then
  echo "[entrypoint] Linking models → $DST_MODELS"
  rm -rf "$DST_MODELS"
  ln -s "$SRC_MODELS" "$DST_MODELS"
else
  echo "[entrypoint][ERROR] $SRC_MODELS not found; creating empty $DST_MODELS"
  rm -rf "$DST_MODELS"
  mkdir -p "$DST_MODELS"
fi

if [ -d "$SRC_CUSTOM" ]; then
  echo "[entrypoint] Linking custom_nodes → $DST_CUSTOM"
  rm -rf "$DST_CUSTOM"
  ln -s "$SRC_CUSTOM" "$DST_CUSTOM"
else
  echo "[entrypoint][WARN] $SRC_CUSTOM not found; creating empty $DST_CUSTOM"
  rm -rf "$DST_CUSTOM"
  mkdir -p "$DST_CUSTOM"
fi

echo "[entrypoint] Starting ComfyUI…
"
exec /start.sh "$@"
