FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "\
    file://generic.cfg \
    file://earlyboot.cfg \
    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://selinux.cfg', '', d)} \
    ${@bb.utils.contains_any('VARIANT', 'perf user', '', 'file://devmem.cfg', d)} \
    ${@bb.utils.contains_any('VARIANT', 'perf user', 'file://perf.cfg', '', d)} \
    file://0001-QCLINUX-vfio-Disable-iommu_group_claim_dma_owner-tem.patch \
    file://0002-PENDING-soc-qcom-geni-se-Enable-QUPs-on-SA8255p-Qual.patch \
    file://0003-PENDING-serial-qcom-geni-Enable-Serial-on-SA8255p-pl.patch \
    file://0004-PENDING-i2c-qcom-geni-Enable-I2C-on-SA8255p-Qualcomm.patch \
    file://0005-PENDING-spi-geni-qcom-Enable-SPI-on-SA8255p-Qualcomm.patch \
    file://0006-PENDING-spi-geni-qcom-Enable-SPI-GSI-mode-for-SA8255.patch \
    file://0007-PENDING-scsi-ufs-qcom-Enable-sa8255p-platform.patch \
    file://0008-PENDING-phy-qcom-qmp-usb-Call-qmp_usb_remove-during-.patch \
    file://0009-PENDING-phy-qcom-qmp-usb-Add-support-for-SA8255P.patch \
    file://0010-PENDING-usb-dwc3-qcom-Add-support-for-sa8255p-for-qc.patch \
    file://0011-PENDING-phy-qcom-snps-femto-v2-Call-qcom_snps_hsphy_.patch \
    file://0012-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch \
    file://0001-FROMLIST-of-of_reserved_mem-Increase-limit-for-reser.patch \
    file://0013-net-stmmac-dwmac-qcom-ethqos-Enable-SCMI-ETH.patch \
    file://0014-PENDING-qcom-Add-sa7255p-compatibles-for-core-driver.patch \
    file://0015-PENDING-PCI-Add-Qualcomm-PCIe-ECAM-root-complex-driv.patch \
    file://0016-PENDING-ice-Enable-ICE-on-SA8255p-Qualcomm-platforms.patch \
    file://0017-PCI-qcom-ep-Add-support-for-SCMI-based-PCIe-EP.patch \
    file://0018-PENDING-bus-mhi-host-pci_generic-Disable-auto-suspen.patch \
    file://0019-PCI-Safety-Initial-Commit.patch \
    file://scm_adci/0001-QCLINUX-arm64-dts-qcom-sa8255p-Modify-correct-dt-nam.patch \
    file://scm_adci/0002-QCLINUX-arm64-dts-qcom-sa8775p-Modify-correct-dt-nam.patch \
    file://scm_adci/0003-QCLINUX-arm64-dts-qcom-sa7255p-Modify-correct-dt-nam.patch \
    file://scm_adci/0004-BACKPORT-FROMLIST-firmware-qcom-scm-Support-multiple.patch \
    file://scm_adci/0005-PENDING-firmware-qcom-scm-Add-support-for-WAITQ_WAKE.patch \
    file://scm_adci/0006-PENDING-firmware-qcom-scm-Selectively-skip-mutex-for.patch \
    file://scm_adci/0007-UPSTREAM-firmware-qcom-scm-Remove-QCOM_SMC_WAITQ_FLA.patch \
    file://scm_adci/0008-PENDING-firmware-qcom-scm-Introduce-new-locking-mech.patch \
    file://scm_adci/0009-QCLINUX-arm64-dts-qcom-qcs9100-Modify-correct-dt-nam.patch \
    file://0019-net-phy-AQR-phy-10M-fix.patch \
"

SRC_URI:append:sa8797 = " \
    file://sa8797p-generic.cfg \
    file://0001-pinctrl-qcom-add-the-tlmm-driver-sa8797p-platforms.patch \
    file://0003-scsi-ufs-Disable-auto-hibern8-and-mcq-feature.patch \
    file://0007-PENDING-soc-qcom-geni-se-Add-compatible-field-for-SA.patch \
    file://0008-usb-dwc3-qcom-Add-support-for-sa8775p-for-qcom-usb.patch \
    file://0009-usb-phy-Add-snapshot-of-USB-PHY-EMU-driver.patch \
    file://0008-Window-Watchdog-support-for-Sa8797.patch \
    file://0010-phy-qcom-phy-qcom-snps-eusb2-Add-support-for-SA8797P.patch \
    file://0011-usb-phy-qmp-combo-Add-scmi-related-changes-for-SA879.patch \
    file://0010-usb-phy-Disable-DP-hardcode-lane-B.patch \
    file://0012-PENDING-cpufreq-scmi-Skip-SCMI-devices-that-aren-t-u.patch \
    file://0012-PENDING-i2c-i2c-qcom-geni-Add-compatible-field-for-S.patch \
    file://0013-PENDING-spi-spi-geni-qcom-Add-compatible-field-for-S.patch \
    file://0014-mailbox-qcom-cpucp-restructure-the-cpucp-mailbox-dri.patch \
    file://0015-scmi-support-for-scmi-vendor-protocol-and-log-driver.patch \
"

SRC_URI:remove:sa8797 = " \
    file://earlyboot.cfg \
    file://0017-PCI-qcom-ep-Add-support-for-SCMI-based-PCIe-EP.patch \
    file://0018-PENDING-bus-mhi-host-pci_generic-Disable-auto-suspen.patch \
    file://0019-net-phy-AQR-phy-10M-fix.patch \
    file://0019-PCI-Safety-Initial-Commit.patch \
"

KERNEL_CONFIG_FRAGMENTS:append:sa8797 = " ${WORKDIR}/sa8797p-generic.cfg"
KERNEL_CONFIG_FRAGMENTS:append = " ${WORKDIR}/generic.cfg"
KERNEL_CONFIG_FRAGMENTS:append:sa8775 = " ${WORKDIR}/earlyboot.cfg"
KERNEL_CONFIG_FRAGMENTS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', '${WORKDIR}/selinux.cfg', '', d)}"
KERNEL_CONFIG_FRAGMENTS:append = " ${@bb.utils.contains_any('VARIANT', 'perf user', '', '${WORKDIR}/devmem.cfg', d)}"
