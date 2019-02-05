## This file contains the converter from raw
## cppcheck-format to checkstyle

inherit sca-conv-checkstyle-helper

def do_sca_conv_shellcheck(d):
    import os
    from xml.etree.ElementTree import Element, SubElement, Comment, tostring
    from xml.etree import ElementTree
    from xml.dom import minidom

    package_name = d.getVar("PN", True)
    buildpath = d.getVar("SCA_SOURCES_DIR", True)

    data = ElementTree.ElementTree(ElementTree.parse(d.getVar("SCA_RAW_RESULT"))).getroot()
    items = []

    for f in data.findall(".//file"):
        if ElementTree.tostring(f) in items:
            for h in f:
                f.remove(h)
            continue
        items.append(ElementTree.tostring(f))
    data = data.getroot()
    try:
        return checkstyle_prettify(d, data).decode("utf-8")
    except:
        return checkstyle_prettify(d, data)