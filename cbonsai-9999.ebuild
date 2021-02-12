EAPI=5

inherit git-r3 toolchain-funcs

DESCRIPTION="Scaleable multibeings simulator with individual AI."
HOMEPAGE="https://gitlab.com/jallbrit/cbonsai"
EGIT_REPO_URI="https://gitlab.com/jallbrit/cbonsai.git"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

RDEPEND="
	sys-libs/ncurses
"

DEPEND="${RDEPEND}"


src_compile() {
	make 
}


src_install() {
	dobin cbonsai
}


