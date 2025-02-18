DEPENDS += "${@bb.utils.contains('MACHINE', 'sa8797', 'kernel-basedevicetree', '', d)} "
do_make_dtb[depends] += "${@bb.utils.contains_any('MACHINE', 'sa8797', 'kernel-basedevicetree:do_deploy', '', d)}"
