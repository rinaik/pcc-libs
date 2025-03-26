#	$Id$
#
# Makefile.in for pcc-libs/csu
#



prefix = /usr/local
exec_prefix = ${prefix}
libdir = ${exec_prefix}/lib
srcdir = .

TARGOS = linux
TARGMACH = amd64
TARGET = x86_64-unknown-linux-gnu
VERSION = 1.2.0.DEVEL
PCCLIBDIR = $(libdir)/pcc/$(TARGET)/$(VERSION)/lib

CC = pcc
CFLAGS = 

MFLAGS = CC="$(CC)" MACH="$(TARGMACH)" PCCLIBDIR="$(PCCLIBDIR)"

all clean install:
	if test -f $(srcdir)/$(TARGOS)/Makefile; then			\
		(cd $(srcdir)/$(TARGOS) && exec $(MAKE) $(MFLAGS) $@)	\
		    || exit $$?;					\
	fi

distclean: clean
	/bin/rm -f Makefile
