FROM runpod/worker-comfyui:5.3.0-base

# Copy in your custom entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]