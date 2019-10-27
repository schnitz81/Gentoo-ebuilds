# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 toolchain-funcs

DESCRIPTION="Turn-based battle against the AI."
HOMEPAGE="https://github.com/schnitz81/ttybattle/"
EGIT_REPO_URI="https://github.com/schnitz81/ttybattle.git"
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
	for x in main actions cpu gameengine menus 
	do
		$(tc-getCC) \
			${CPPFLAGS} ${CFLAGS} \
			-c -o ${x}.o ${x}.c || die "compile failed"

	done
	$(tc-getCC) \
        ${LDFLAGS} \
        -o ttybattle \
		main.o actions.o cpu.o gameengine.o menus.o \
		-lcurses -lmenu -ltinfo || die "link ttybattle failed"
}


src_install() {
	dobin ttybattle
	doman ${PN}.1
	dodoc README* LICENSE
}

