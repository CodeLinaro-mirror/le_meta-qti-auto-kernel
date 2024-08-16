FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://sa8797p-generic.cfg \
    file://0001-pinctrl-qcom-add-the-tlmm-driver-sa8797p-platforms.patch \
"

do_patch:append() {
    patch -f -p1 < ${WORKDIR}/0001-pinctrl-qcom-add-the-tlmm-driver-sa8797p-platforms.patch
}
