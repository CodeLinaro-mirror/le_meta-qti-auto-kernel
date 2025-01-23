do_make_dtb[depends] += "${@bb.utils.contains_any('MACHINE', 'sa8797', 'kernel-basedevicetree:do_deploy', '', d)}"
