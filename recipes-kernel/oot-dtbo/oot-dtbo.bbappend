do_make_dtb[depends] += "${@bb.utils.contains_any('SOC_FAMILY', 'sa8797', 'kernel-basedevicetree:do_deploy', '', d)}"
