SUMMARY = "go.mod: modernc.org/httpfs"
HOMEPAGE = "https://pkg.go.dev/modernc.org/httpfs"
DEFAULT_PREFERENCE = "${SCA_DEFAULT_PREFERENCE}"
# License is determined by the modules included and will be therefore computed
LICENSE = "${@' & '.join(sorted(set(x for x in (d.getVar('GOSRC_LICENSE') or '').split(' ') if x)))}"

# inject the needed sources
require modernc.org-httpfs-sources.inc

GO_IMPORT = "modernc.org/httpfs"

inherit gosrc
inherit native
