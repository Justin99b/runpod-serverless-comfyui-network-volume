#!/usr/bin/env bash
set -e

# 1) Remove bundled dirs so we don’t clash
rm -rf /comfyui/models
rm -rf /comfyui/custom_nodes

# 2) Symlink in your shared volume
ln -s /workspace/ComfyUI/models       /comfyui/models
ln -s /workspace/ComfyUI/custom_nodes /comfyui/custom_nodes

# 3) Handoff to the original RunPod start script
exec /start.sh "$@"