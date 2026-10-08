{ ... }:

{
    # Panther Lake graphics are supported by the Xe driver. This host has only
    # an Intel iGPU, so it intentionally imports no NVIDIA or PRIME settings.
    hardware.intelgpu.driver = "xe";
}
