#	$Id$
#
# Makefile.in for libpccsoftfloat.a
#


srcdir = .
top_srcdir = ..
top_builddir = ..
prefix = /usr/local
exec_prefix = ${prefix}
libdir = ${exec_prefix}/lib

CC = pcc
TARGET = x86_64-unknown-linux-gnu
TARGMACH = amd64
VERSION = 1.2.0.DEVEL
PCCLIBDIR = $(libdir)/pcc/$(TARGET)/$(VERSION)/lib

CPPFLAGS =  -DSOFTFLOAT_FOR_GCC -I$(srcdir) \
	-I$(srcdir)/arch/$(TARGMACH) \
	-isystem $(top_srcdir)/libpcc/include

LIBS = 
AR = ar
RANLIB = ranlib
INSTALL = /usr/bin/install -c

OBJS =		softfloat.o \
		fpgetround.o fpsetround.o fpgetmask.o fpsetmask.o \
		fpgetsticky.o fpsetsticky.o \
		eqsf2.o nesf2.o gtsf2.o gesf2.o ltsf2.o lesf2.o negsf2.o \
		eqdf2.o nedf2.o gtdf2.o gedf2.o ltdf2.o ledf2.o negdf2.o \
		nexf2.o gtxf2.o gexf2.o negxf2.o unordsf2.o unorddf2.o

DEST = libpccsoftfloat.a

all: $(DEST)

$(DEST): $(OBJS)
	$(AR) r $@ $?
	$(RANLIB) $@

softfloat.o : bits64/softfloat.c
	$(CC) -O $(CPPFLAGS) $(CFLAGS) -c $<

.c.o :
	$(CC) -O $(CPPFLAGS) $(CFLAGS) -c $<

install:
	test -z "${DESTDIR}$(PCCLIBDIR)" || mkdir -p "${DESTDIR}$(PCCLIBDIR)"
	$(INSTALL) -m 644 $(DEST) ${DESTDIR}$(PCCLIBDIR)

clean:
	/bin/rm -f $(OBJS) $(DEST)

distclean:
	/bin/rm -f Makefile
