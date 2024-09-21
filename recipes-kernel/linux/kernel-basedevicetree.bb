DESCRIPTION = "Build kernel base-devicetree"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/${LICENSE};md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "${PATH_TO_REPO}/vendor/qcom/opensource/base-devicetree/.git;protocol=${PROTO};usehead=1"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/vendor/qcom/opensource/base-devicetree"

inherit deploy kernel-arch module-base

# lock to avoid parallel compiling with techpack
do_compile[lockfiles] += "${TMPDIR}/qti-techpack.lock"

do_deploy() {
    if [ -n "${KERNEL_MACHINE_DTB}" ]; then
        install -d ${DEPLOYDIR}/build-artifacts/dtb

        for dtb in ${KERNEL_MACHINE_DTB}; do
            if [ -f ${B}/$dtb ]; then
                install -m 0644 ${B}/$dtb ${DEPLOYDIR}/build-artifacts/dtb
            fi
        done
    fi

    if [ -n "${KERNEL_BASE_DTB}" ]; then
        install -d ${DEPLOYDIR}/build-artifacts/kernel-dtb

        for dtb in ${KERNEL_BASE_DTB}; do
            if [ -f ${B}/$dtb ]; then
                install -m 0644 ${B}/$dtb ${DEPLOYDIR}/build-artifacts/kernel-dtb
            fi
        done
    fi

    if [ -n "${OOT_DTBS}" ]; then
        install -d ${DEPLOYDIR}/build-artifacts/techpack-dtbs

        for dtb in ${OOT_DTBS}; do
            if [ -f ${B}/$dtb ]; then
                install -m 0644 ${B}/$dtb ${DEPLOYDIR}/build-artifacts/techpack-dtbs
            fi
        done
    fi
}

addtask do_deploy after do_compile before do_packagedata
