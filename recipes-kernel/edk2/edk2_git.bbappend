FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://0001-Do-Not-Merge-QcomModulePkg-Increase-MAX_GET_VAR_NAME.patch \
    file://0002-DO-NO-MERGE-edk2-Fix-the-multislot-boot-issue-on-Nor.patch \
    file://0003-DO-NO-MERGE-edk2-Adhoc-fix-for-Nord-RUMI.patch \
    file://0004-DO-NOT-MERGE-QcomModulePkg-Fix-partition-and-keymast.patch \
"
