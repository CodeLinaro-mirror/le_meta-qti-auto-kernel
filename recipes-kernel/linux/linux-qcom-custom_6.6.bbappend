FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://sa8797p-generic.cfg \
    file://0001-pinctrl-qcom-add-the-tlmm-driver-sa8797p-platforms.patch \
    file://0002-NOMERGE-drivers-iommu-Bypass-context_irq-error.patch \
    file://0003-ufs-Configure-UFS-driver-for-NordAU-RUMI.patch \
    file://0004-ufs-Disable-power-mode-change-during-hba-probe.patch \
    file://0005-scsi-ufs-Disable-64-bit-DMA-mask.patch \
    file://0006-QCLINUX-Fix-serial-probe-error.patch \
    file://0007-PENDING-soc-qcom-geni-se-Add-compatible-field-for-SA.patch \
    file://0008-usb-dwc3-qcom-Add-support-for-sa8775p-for-qcom-usb.patch \
    file://0009-usb-phy-Add-snapshot-of-USB-PHY-EMU-driver.patch \
"

KERNEL_CONFIG_FRAGMENTS:append = " ${WORKDIR}/sa8797p-generic.cfg"
