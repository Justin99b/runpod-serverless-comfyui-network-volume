FROM runpod/worker-comfyui:5.3.0-base-cuda12.8.1


WORKDIR /comfyui/custom_nodes

RUN comfy-node-install \
  comfyui-kjnodes \
  comfyui-ic-light \
  https://github.com/Smirnov75/ComfyUI-mxToolkit.git \
  https://github.com/rgthree/rgthree-comfy.git \
  https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git \
  https://github.com/cubiq/ComfyUI_essentials.git \
  https://github.com/jamesWalker55/comfyui-various.git \
  https://github.com/pollockjj/ComfyUI-MultiGPU.git \
  https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git \
  https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git \
  https://github.com/BadCafeCode/masquerade-nodes-comfyui.git \
  https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git \
  https://github.com/ltdrdata/ComfyUI-Manager.git