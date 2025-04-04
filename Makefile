#	$Id$
#
# top-level Makefile
#



ALL_SUBDIRS=	libsoftfloat libpcc csu
DIST_SUBDIRS=	$(ALL_SUBDIRS) libF77 libI77

all install clean:
	@for subdir in $(ALL_SUBDIRS); do \
		_nextdir_=$${_thisdir_+$$_thisdir_/}$$subdir; \
		echo "===> $$_nextdir_"; \
		(_thisdir_=$$_nextdir_; export _thisdir_; cd $$subdir && \
		    exec $(MAKE) $(MFLAGS) $@) || exit $$?; \
		echo "<=== $$_nextdir_"; \
	done

distclean: clean
	@for subdir in $(DIST_SUBDIRS); do \
		_nextdir_=$${_thisdir_+$$_thisdir_/}$$subdir; \
		echo "===> $$_nextdir_"; \
		(_thisdir_=$$_nextdir_; export _thisdir_; cd $$subdir && \
		    exec $(MAKE) $(MFLAGS) $@) || exit $$?; \
		echo "<=== $$_nextdir_"; \
	done
	/bin/rm -rf Makefile config.log config.status \
		configure.lineno config.h autom4te.cache
