SUMMARY = "go.mod: github.com/codegangsta/inject"
HOMEPAGE = "https://pkg.go.dev/github.com/codegangsta/inject"

# License is determined by the modules included and will be therefore computed
DEFAULT_PREFERENCE = "-1"
LICENSE = "${@' & '.join(sorted(set(x for x in (d.getVar('GOSRC_LICENSE') or '').split(' ') if x)))}"

# inject the needed sources
require github.com-codegangsta-inject-sources.inc

GO_IMPORT = "github.com/codegangsta/inject"

inherit gosrc
inherit native
