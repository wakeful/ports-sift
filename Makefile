# Created by: Adrian Jaskuła <aj@laatu.uk>
# $FreeBSD$

PORTNAME=	sift
PORTVERSION=	20161225
CATEGORIES=	textproc

MAINTAINER=	aj@laatu.uk
COMMENT=	Sift grep on steroids - fast and powerful alternative to grep

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/bin/go:lang/go

USE_GITHUB=	yes
GH_ACCOUNT=	svent
GH_PROJECT=	sift
GH_TAGNAME=	v0.9.0
GH_SUBDIR=	src/github.com/${GH_ACCOUNT}/${GH_PROJECT}

STRIP=

PLIST_FILES=	bin/sift

post-extract:
	@${MKDIR} ${WRKSRC}/bin
	@cd ${WRKSRC}/src/github.com/${GH_ACCOUNT}/${GH_PROJECT}; ${SETENV} GOPATH=${WRKSRC} go get -d

do-build:
	@cd ${WRKSRC}/src/github.com/${GH_ACCOUNT}/${GH_PROJECT}; ${SETENV} GOPATH=${WRKSRC} go build -o bin/${PORTNAME}

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/sift ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
