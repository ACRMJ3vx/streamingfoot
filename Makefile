SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .tar

CP = /bin/cp
GIT = /usr/bin/git
GZIP = /bin/gzip
MKDIR = /bin/mkdir
RM = /bin/rm
TAR = /bin/tar

VERSION = 0

all :

clean :
	${RM} --recursive --force build sources

sources : build/streamingfoot-${VERSION}.tar.gz
	${CP} $< $@

build/%.tar.gz : build/%.tar
	${MKDIR} --parents ${@D}
	${GZIP} -9 --to-stdout $< > $@

build/%.tar : build/%
	${MKDIR} --parents ${@D}
	${TAR} --create --file $@ --directory ${@D} ${<F}

build/streamingfoot-${VERSION} :
	${MKDIR} --parents ${@D}
	${GIT} clone git://github.com/ACRMJ3vx/streamingfoot.git $@