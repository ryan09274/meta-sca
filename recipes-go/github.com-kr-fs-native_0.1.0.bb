SUMMARY = "go.mod: github.com/kr/fs"
HOMEPAGE = "https://pkg.go.dev/github.com/kr/fs"

# License is determined by the modules included and will be therefore computed
DEFAULT_PREFERENCE = "-1"
LICENSE = "${@' & '.join(sorted(set(x for x in (d.getVar('GOSRC_LICENSE') or '').split(' ') if x)))}"

# inject the needed sources
require github.com-kr-fs-sources.inc

GO_IMPORT = "github.com/kr/fs"

inherit gosrc
inherit native
