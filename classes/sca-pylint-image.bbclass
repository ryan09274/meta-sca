inherit sca-pylint-core
inherit sca-global

## Add ids to suppress on a recipe level
SCA_PYLINT_EXTRA_SUPPRESS ?= ""
## Add ids to lead to a fatal on a recipe level
SCA_PYLINT_EXTRA_FATAL ?= ""
## Folder to scan
SCA_PYLINT_ROOTPATH ?= "${IMAGE_ROOTFS}"
## PYTHONHOME-path to use
SCA_PYLINT_HOMEPATH ?= "${IMAGE_ROOTFS}/usr/lib/python.3.5"
## The Librarypath to use
SCA_PYLINT_LIBATH ?= "${IMAGE_ROOTFS}/usr/lib/python.3.5/:${IMAGE_ROOTFS}/usr/lib/python.3.5/site-packages/"
## Extra options to be passed to pylint
SCA_PYLINT_EXTRA ?= "--errors-only"

python do_sca_deploy_pylint_image() {
    import os
    import shutil
    os.makedirs(os.path.join(d.getVar("SCA_EXPORT_DIR"), "pylint", "raw"), exist_ok=True)
    os.makedirs(os.path.join(d.getVar("SCA_EXPORT_DIR"), "pylint", "checkstyle"), exist_ok=True)
    raw_target = os.path.join(d.getVar("SCA_EXPORT_DIR"), "pylint", "raw", "{}-{}.txt".format(d.getVar("PN"), d.getVar("PV")))
    cs_target = os.path.join(d.getVar("SCA_EXPORT_DIR"), "pylint", "checkstyle", "{}-{}.xml".format(d.getVar("PN"), d.getVar("PV")))
    shutil.copy(os.path.join(d.getVar("T"), "sca_raw_pylint.txt"), raw_target)
    shutil.copy(os.path.join(d.getVar("T"), "sca_checkstyle_pylint.xml"), cs_target)
    do_sca_export_sources(d, cs_target)
}

addtask do_sca_pylint_core before do_image_complete after do_image
addtask do_sca_deploy_pylint_image before do_image_complete after do_sca_pylint_core

DEPENDS += "sca-image-pylint-rules-native"