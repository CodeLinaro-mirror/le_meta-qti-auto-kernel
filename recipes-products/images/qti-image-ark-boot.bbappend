DEPENDS += "kernel-basedevicetree"
do_make_dtb[depends] += "kernel-basedevicetree:do_deploy"
