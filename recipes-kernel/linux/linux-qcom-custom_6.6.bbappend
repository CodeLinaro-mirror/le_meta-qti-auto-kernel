FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "\
    file://generic.cfg \
    file://earlyboot.cfg \
    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://selinux.cfg', '', d)} \
    ${@bb.utils.contains_any('VARIANT', 'perf user', '', 'file://devmem.cfg', d)} \
    ${@bb.utils.contains_any('VARIANT', 'perf user', 'file://perf.cfg', '', d)} \
    file://0001-QCLINUX-vfio-Disable-iommu_group_claim_dma_owner-tem.patch \
    file://qup/0001-PENDING-soc-qcom-geni-se-Enable-QUPs-on-SA8255p-Qual.patch \
    file://qup/0002-PENDING-serial-qcom-geni-Enable-Serial-on-SA8255p-pl.patch \
    file://qup/0003-PENDING-i2c-qcom-geni-Enable-I2C-on-SA8255p-Qualcomm.patch \
    file://qup/0004-PENDING-spi-geni-qcom-Enable-SPI-on-SA8255p-Qualcomm.patch \
    file://qup/0005-PENDING-spi-geni-qcom-Enable-SPI-GSI-mode-for-SA8255.patch \
    file://qup/0009-PENDING-i2c-qcom-geni-cleanup-in-probe-function.patch \
    file://qup/0010-PENDING-i2c-qcom-geni-Add-support-for-S2R-feature.patch \
    file://qup/0011-PENDING-serial-qcom-geni-Add-support-for-S2R-feature.patch \
    file://qup/0012-PENDING-spi-spi-geni-qcom-Add-support-for-S2R-featur.patch \
    file://qup/0013-PENDING-spi-spi-geni-qcom-set-lowest-OPP-during-susp.patch \
    file://qup/0014-PENDING-serial-qcom-geni-set-lowest-OPP-during-suspe.patch \
    file://qup/0015-PENDING-spi-qcom-geni-Allow-SPI-mode-reconfiguration.patch \
    file://0007-PENDING-scsi-ufs-qcom-Enable-sa8255p-platform.patch \
    file://usb/0001-PENDING-usb-dwc3-qcom-Ensure-VBUS_VALID-is-set-after.patch \
    file://usb/0002-PENDING-usb-dwc3-qcom-Ensure-PIPE_UTMI_CLK_SEL-is-pr.patch \
    file://usb/0003-PENDING-usb-dwc3-drd-expose-role-switch-control-to-u.patch \
    file://usb/0004-PENDING-usb-dwc3-qcom-Trivial-code-cleanup.patch \
    file://usb/0005-PENDING-usb-dwc3-Enable-role-switch-control-from-use.patch \
    file://usb/0006-PENDING-usb-host-xhci-plat-Trivial-code-cleanup.patch \
    file://usb/0007-PENDING-usb-host-xhci-plat-Trivial-code-cleanup.patch \
    file://usb/0008-PENDING-usb-host-xhci-plat-Add-support-for-XHCI_RESE.patch \
    file://usb/0009-PENDING-usb-dwc3-host-Set-XHCI_RESET_ON_RESUME-for-x.patch \
    file://usb/0010-PENDING-phy-qcom-qmp-usb-Call-qmp_usb_remove-during-.patch \
    file://usb/0011-PENDING-phy-qcom-qmp-usb-Add-support-for-SA8255P.patch \
    file://usb/0012-PENDING-usb-dwc3-qcom-Add-support-for-sa8255p-for-qc.patch \
    file://usb/0013-PENDING-phy-qcom-snps-femto-v2-Call-qcom_snps_hsphy_.patch \
    file://usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch \
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
    file://0003-scsi-ufs-Disable-auto-hibern8-feature.patch \
    file://usb/0016-usb-dwc3-qcom-Add-support-for-sa8775p-for-qcom-usb.patch \
    file://usb/0017-usb-phy-Add-snapshot-of-USB-PHY-EMU-driver.patch \
    file://0008-Window-Watchdog-support-for-Sa8797.patch \
    file://usb/0018-phy-qcom-phy-qcom-snps-eusb2-Add-support-for-SA8797P.patch \
    file://usb/0019-usb-phy-qmp-combo-Add-scmi-related-changes-for-SA879.patch \
    file://usb/0020-usb-phy-Disable-DP-hardcode-lane-B.patch \
    file://0012-PENDING-cpufreq-scmi-Skip-SCMI-devices-that-aren-t-u.patch \
    file://0014-mailbox-qcom-cpucp-restructure-the-cpucp-mailbox-dri.patch \
    file://0015-scmi-support-for-scmi-vendor-protocol-and-log-driver.patch \
    file://qup/0006-PENDING-soc-qcom-geni-se-Add-compatible-field-for-SA.patch \
    file://qup/0007-PENDING-i2c-i2c-qcom-geni-Add-compatible-field-for-S.patch \
    file://qup/0008-PENDING-spi-spi-geni-qcom-Add-compatible-field-for-S.patch \
    file://qup/0013-PENDING-dmaengine-gpi-Add-new-register-offset-to-sup.patch \
    file://qup/0014-PENDING-i2c-i2c-qcom-geni-Add-data-transfer-support-.patch \
    file://qup/0015-PENDING-dmaengine-gpi-Add-new-API-to-enhance-CCU-QUP.patch \
    file://qup/0016-PENDING-i2c-i2c-qcom-geni-Add-APIs-to-support-CCU-QU.patch \
    file://qup/0017-PENDING-soc-qcom-ccu-qup-Add-CCU-QUP-platform-driver.patch \
    file://qup/0018-PENDING-i2c-i2c-qcom-geni-Add-async-write-support.patch \
    file://qup/0019-PENDING-soc-qcom-ccu-qup-Add-read-and-poll-API-suppo.patch \
    file://qup/0020-PENDING-i2c-i2c-qcom-geni-Update-counter-setting-for.patch \
    file://qup/0021-meta-qti-auto-kernel-Fix-cyclic-depedancy-between-CC.patch \
    file://qup/0022-meta-qti-auto-kernel-Fix-double-unmap-issue-for-DMA-.patch \
    file://qup/0023-i2c-qcom-geni-Fix-I2C-multi-message-write-and-DMA-bu.patch \
    file://qup/0024-i2c-Enable-multi-random-write-feature.patch \
    file://qup/0025-i2c-i2c-qcom-geni-Fix-NULL-pointer-dereference-issue.patch \
    file://qup/0026-dmaengine-qcom-gpi-Add-I2C-bus-clear-and-bus-stop-su.patch \
    file://qup/0028-i2c-Add-support-for-NOP-Frame.patch \
"

SRC_URI:remove:sa8797 = " \
    file://earlyboot.cfg \
    file://0017-PCI-qcom-ep-Add-support-for-SCMI-based-PCIe-EP.patch \
    file://0019-net-phy-AQR-phy-10M-fix.patch \
    file://0019-PCI-Safety-Initial-Commit.patch \
"

SRC_URI:append:sa8775 = " \
    file://0001-mm-memblock-enable-memory-hotplug.patch \
    file://0001-PENDING-defer-no-map-memory-init-process.patch \
"

KERNEL_CONFIG_FRAGMENTS:append:sa8797 = " ${WORKDIR}/sa8797p-generic.cfg"
KERNEL_CONFIG_FRAGMENTS:append = " ${WORKDIR}/generic.cfg"
KERNEL_CONFIG_FRAGMENTS:append:sa8775 = " ${WORKDIR}/earlyboot.cfg"
KERNEL_CONFIG_FRAGMENTS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', '${WORKDIR}/selinux.cfg', '', d)}"
KERNEL_CONFIG_FRAGMENTS:append = " ${@bb.utils.contains_any('VARIANT', 'perf user', '', '${WORKDIR}/devmem.cfg', d)}"
