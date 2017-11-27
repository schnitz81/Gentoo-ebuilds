# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 toolchain-funcs

DESCRIPTION="Scaleable multibeings simulator with individual AI."
HOMEPAGE="https://github.com/schnitz81/beings/"
EGIT_REPO_URI="https://github.com/schnitz81/beings.git"
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
	local x
	for x in main ai being event world 
	do
		$(tc-getCC) \
			${CPPFLAGS} ${CFLAGS} \
			-c -o ${x}.o ${x}.c || die "compile failed"

	done
	$(tc-getCC) \
        ${LDFLAGS} \
        -o beings \
		main.o ai.o being.o event.o world.o \
		-lcurses || die "link beings failed"
}


src_install() {
	dobin beings
	doman ${PN}.1
	dodoc README* LICENSE
}

