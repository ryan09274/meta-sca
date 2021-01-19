SUMMARY = "RubyGem: google-apis-generator"
DESCRIPTION = "Code generator for legacy Google REST clients"
HOMEPAGE = "https://github.com/google/google-api-ruby-client"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7e6820981d59cdfac1e6538d3aacfd11"

DEPENDS += ""
RDEPENDS_${PN} += "ruby-activesupport \
                  ruby-gems \
                  ruby-google-apis-core \
                  ruby-google-apis-discovery-v1 \
                  ruby-thor"

SRC_URI[md5sum] = "030e8b55bc52f0d6ab95a8cc79326863"
SRC_URI[sha256sum] = "107a898a78fd0f56ee358d611b563143da02aca585d93b1bc2c0734ca89debc6"

GEM_NAME = "google-apis-generator"

inherit rubygems
