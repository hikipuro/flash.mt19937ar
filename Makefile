$?EXTRACFLAGS=
$?OPT_CFLAGS=-O4
$?BUILDDIR=build
$?SRCDIR=..
$?INCLUDE:=-I$(SRCDIR)/

mt19937ar: check
	@echo "-------- mt19937ar --------"
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR) && "$(FLASCC)/usr/bin/gcc" $(BASE_CFLAGS) $(EXTRACFLAGS) $(OPT_CFLAGS) $(INCLUDE) \
		$(SRCDIR)/mt19937ar.c \
		$(SRCDIR)/as3api.c \
		-emit-swc=mt19937ar \
		-o mt19937ar.swc

include Makefile.common

clean:
	rm -f -r build
