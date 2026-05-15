# R46S Community ArkOS Coldboot Fix

## IMPORTANT

This fix is specifically for the custom R46S ArkOS setup based on the RGB30 ArkOS image.

You MUST:

* use the RGB30 ArkOS image from the official ArkOS GitHub/community source
https://drive.google.com/file/d/1\_rYO1qe\_T1GxZMUZdeXVP\_kLgxEJPqHl/view
* DO NOT change or modify the RGB30 image further before applying this fix



This patch is intended to correct:

* cold boot instability
* failed startup after full shutdown
* needing another SD card to "wake" the system
* inconsistent boot behavior after complete power loss

\---

# REQUIRED FILES

Place:

mmcblk1\_first64mb.img

inside:

/roms/backup

on the NEW/CUSTOM RGB30 ArkOS SD card.

Do NOT rename the file.

\---

# INSTALLATION

1. Boot the RGB30 SD in R46S console.
2. Set low-level sleep in tools/advanced folder
3. Run R46S\_LowLevelBoot\_Patch.sh from tools folder
4. Wait for completion
5. Fully power OFF the handheld using ES Quit Menu.
\[DO NOT USE POWER OR RESET BUTTONS]
6. Wait approximately 10 seconds.
7. Perform a true cold boot test.

\---

# WHAT THIS PATCH DOES

This tool:

* backs up the current low-level boot region from the RGB30 ecosystem
* applies the stock-modified R46S low-level boot initialization region
* preserves everything after system low-level boot initialization region



The root changes:

* proper resume/init state handling
* framebuffer/power init sequencing
* bootloader compatibility expectations between the RGB30 base and R46S hardware.


This patch ONLY affects the earliest low-level boot region used for hardware initialization.

\---

# NOTES

This fix was developed specifically for:

* R46S hardware
* RGB30-based ArkOS adaptation builds
* community ArkOS environments

This patch should NOT be used on unrelated devices.

