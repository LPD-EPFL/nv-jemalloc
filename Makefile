# Clear out all vpaths, then set just one (default vpath) for the main build
# directory.
vpath
vpath % .

# Clear the default suffixes, so that built-in rules are not used.
.SUFFIXES :

SHELL := /bin/sh

CC := gcc

# Configuration parameters.
DESTDIR =
BINDIR := $(DESTDIR)/home/tadavid/local/bin
INCLUDEDIR := $(DESTDIR)/home/tadavid/local/include
LIBDIR := $(DESTDIR)/home/tadavid/local/lib
DATADIR := $(DESTDIR)/home/tadavid/local/share
MANDIR := $(DESTDIR)/home/tadavid/local/share/man
srcroot := 
objroot := 
abs_srcroot := /home/tadavid/code/jemalloc/
abs_objroot := /home/tadavid/code/jemalloc/

# Build parameters.
CPPFLAGS :=  -D_GNU_SOURCE -D_REENTRANT -I$(srcroot)include -I$(objroot)include
EXTRA_CFLAGS := 
CFLAGS := -std=gnu99 -Wall -Werror=declaration-after-statement -Wsign-compare -pipe -g3 -fvisibility=hidden -O3 -funroll-loops $(EXTRA_CFLAGS)
LDFLAGS := 
EXTRA_LDFLAGS := 
LIBS := -lm  -lpthread
RPATH_EXTRA := 
SO := so
IMPORTLIB := so
O := o
A := a
EXE := 
LIBPREFIX := lib
REV := 2
install_suffix := 
ABI := elf
XSLTPROC := false
AUTOCONF := false
_RPATH = -Wl,-rpath,$(1)
RPATH = $(if $(1),$(call _RPATH,$(1)))
cfghdrs_in := $(addprefix $(srcroot),include/jemalloc/jemalloc_defs.h.in include/jemalloc/internal/jemalloc_internal_defs.h.in include/jemalloc/internal/private_namespace.sh include/jemalloc/internal/private_unnamespace.sh include/jemalloc/internal/private_symbols.txt include/jemalloc/internal/public_namespace.sh include/jemalloc/internal/public_unnamespace.sh include/jemalloc/internal/size_classes.sh include/jemalloc/jemalloc_rename.sh include/jemalloc/jemalloc_mangle.sh include/jemalloc/jemalloc.sh test/include/test/jemalloc_test_defs.h.in)
cfghdrs_out := include/jemalloc/jemalloc_defs.h include/jemalloc/jemalloc.h include/jemalloc/internal/private_namespace.h include/jemalloc/internal/private_unnamespace.h include/jemalloc/internal/public_symbols.txt include/jemalloc/internal/public_namespace.h include/jemalloc/internal/public_unnamespace.h include/jemalloc/internal/size_classes.h include/jemalloc/jemalloc_protos_jet.h include/jemalloc/jemalloc_rename.h include/jemalloc/jemalloc_mangle.h include/jemalloc/jemalloc_mangle_jet.h include/jemalloc/internal/jemalloc_internal_defs.h test/include/test/jemalloc_test_defs.h
cfgoutputs_in := $(addprefix $(srcroot),Makefile.in jemalloc.pc.in doc/html.xsl.in doc/manpages.xsl.in doc/jemalloc.xml.in include/jemalloc/jemalloc_macros.h.in include/jemalloc/jemalloc_protos.h.in include/jemalloc/jemalloc_typedefs.h.in include/jemalloc/internal/jemalloc_internal.h.in test/test.sh.in test/include/test/jemalloc_test.h.in)
cfgoutputs_out := Makefile jemalloc.pc doc/html.xsl doc/manpages.xsl doc/jemalloc.xml include/jemalloc/jemalloc_macros.h include/jemalloc/jemalloc_protos.h include/jemalloc/jemalloc_typedefs.h include/jemalloc/internal/jemalloc_internal.h test/test.sh test/include/test/jemalloc_test.h
enable_autogen := 0
enable_code_coverage := 0
enable_prof := 0
enable_zone_allocator := 
MALLOC_CONF := NV_MALLOC_CONF
link_whole_archive := 0
DSO_LDFLAGS = -shared -Wl,-soname,$(@F)
SOREV = so.2
PIC_CFLAGS = -fPIC -DPIC
CTARGET = -o $@
LDTARGET = -o $@
TEST_LD_MODE = 
MKLIB = 
AR = ar
ARFLAGS = crus
CC_MM = 1
LM := -lm
INSTALL = /usr/bin/install -c

ifeq (macho, $(ABI))
TEST_LIBRARY_PATH := DYLD_FALLBACK_LIBRARY_PATH="$(objroot)lib"
else
ifeq (pecoff, $(ABI))
TEST_LIBRARY_PATH := PATH="$(PATH):$(objroot)lib"
else
TEST_LIBRARY_PATH :=
endif
endif

LIBJEMALLOC := $(LIBPREFIX)jemalloc$(install_suffix)

# Lists of files.
BINS := $(objroot)bin/jemalloc-config $(objroot)bin/jemalloc.sh $(objroot)bin/jeprof
C_HDRS := $(objroot)include/jemalloc/jemalloc$(install_suffix).h
C_SRCS := $(srcroot)src/jemalloc.c \
	$(srcroot)src/arena.c \
	$(srcroot)src/atomic.c \
	$(srcroot)src/base.c \
	$(srcroot)src/bitmap.c \
	$(srcroot)src/ckh.c \
	$(srcroot)src/ctl.c \
	$(srcroot)src/extent.c \
	$(srcroot)src/extent_dss.c \
	$(srcroot)src/extent_mmap.c \
	$(srcroot)src/hash.c \
	$(srcroot)src/large.c \
	$(srcroot)src/mb.c \
	$(srcroot)src/mutex.c \
	$(srcroot)src/nstime.c \
	$(srcroot)src/pages.c \
	$(srcroot)src/prng.c \
	$(srcroot)src/prof.c \
	$(srcroot)src/rtree.c \
	$(srcroot)src/stats.c \
	$(srcroot)src/spin.c \
	$(srcroot)src/tcache.c \
	$(srcroot)src/ticker.c \
	$(srcroot)src/tsd.c \
	$(srcroot)src/util.c \
	$(srcroot)src/witness.c
ifeq ($(enable_zone_allocator), 1)
C_SRCS += $(srcroot)src/zone.c
endif
ifeq ($(IMPORTLIB),$(SO))
STATIC_LIBS := $(objroot)lib/$(LIBJEMALLOC).$(A)
endif
ifdef PIC_CFLAGS
STATIC_LIBS += $(objroot)lib/$(LIBJEMALLOC)_pic.$(A)
else
STATIC_LIBS += $(objroot)lib/$(LIBJEMALLOC)_s.$(A)
endif
DSOS := $(objroot)lib/$(LIBJEMALLOC).$(SOREV)
ifneq ($(SOREV),$(SO))
DSOS += $(objroot)lib/$(LIBJEMALLOC).$(SO)
endif
ifeq (1, $(link_whole_archive))
LJEMALLOC := -Wl,--whole-archive -L$(objroot)lib -l$(LIBJEMALLOC) -Wl,--no-whole-archive
else
LJEMALLOC := $(objroot)lib/$(LIBJEMALLOC).$(IMPORTLIB)
endif
PC := $(objroot)jemalloc.pc
MAN3 := $(objroot)doc/jemalloc$(install_suffix).3
DOCS_XML := $(objroot)doc/jemalloc$(install_suffix).xml
DOCS_HTML := $(DOCS_XML:$(objroot)%.xml=$(objroot)%.html)
DOCS_MAN3 := $(DOCS_XML:$(objroot)%.xml=$(objroot)%.3)
DOCS := $(DOCS_HTML) $(DOCS_MAN3)
C_TESTLIB_SRCS := $(srcroot)test/src/btalloc.c $(srcroot)test/src/btalloc_0.c \
	$(srcroot)test/src/btalloc_1.c $(srcroot)test/src/math.c \
	$(srcroot)test/src/mtx.c $(srcroot)test/src/mq.c \
	$(srcroot)test/src/SFMT.c $(srcroot)test/src/test.c \
	$(srcroot)test/src/thd.c $(srcroot)test/src/timer.c
ifeq (1, $(link_whole_archive))
C_UTIL_INTEGRATION_SRCS :=
else
C_UTIL_INTEGRATION_SRCS := $(srcroot)src/nstime.c $(srcroot)src/util.c
endif
TESTS_UNIT := \
	$(srcroot)test/unit/a0.c \
	$(srcroot)test/unit/arena_reset.c \
	$(srcroot)test/unit/atomic.c \
	$(srcroot)test/unit/bitmap.c \
	$(srcroot)test/unit/ckh.c \
	$(srcroot)test/unit/decay.c \
	$(srcroot)test/unit/extent_quantize.c \
	$(srcroot)test/unit/fork.c \
	$(srcroot)test/unit/hash.c \
	$(srcroot)test/unit/junk.c \
	$(srcroot)test/unit/junk_alloc.c \
	$(srcroot)test/unit/junk_free.c \
	$(srcroot)test/unit/mallctl.c \
	$(srcroot)test/unit/math.c \
	$(srcroot)test/unit/mq.c \
	$(srcroot)test/unit/mtx.c \
	$(srcroot)test/unit/ph.c \
	$(srcroot)test/unit/prng.c \
	$(srcroot)test/unit/prof_accum.c \
	$(srcroot)test/unit/prof_active.c \
	$(srcroot)test/unit/prof_gdump.c \
	$(srcroot)test/unit/prof_idump.c \
	$(srcroot)test/unit/prof_reset.c \
	$(srcroot)test/unit/prof_thread_name.c \
	$(srcroot)test/unit/ql.c \
	$(srcroot)test/unit/qr.c \
	$(srcroot)test/unit/rb.c \
	$(srcroot)test/unit/rtree.c \
	$(srcroot)test/unit/SFMT.c \
	$(srcroot)test/unit/size_classes.c \
	$(srcroot)test/unit/smoothstep.c \
	$(srcroot)test/unit/stats.c \
	$(srcroot)test/unit/ticker.c \
	$(srcroot)test/unit/nstime.c \
	$(srcroot)test/unit/tsd.c \
	$(srcroot)test/unit/util.c \
	$(srcroot)test/unit/witness.c \
	$(srcroot)test/unit/zero.c
TESTS_INTEGRATION := $(srcroot)test/integration/aligned_alloc.c \
	$(srcroot)test/integration/allocated.c \
	$(srcroot)test/integration/extent.c \
	$(srcroot)test/integration/mallocx.c \
	$(srcroot)test/integration/MALLOCX_ARENA.c \
	$(srcroot)test/integration/overflow.c \
	$(srcroot)test/integration/posix_memalign.c \
	$(srcroot)test/integration/rallocx.c \
	$(srcroot)test/integration/sdallocx.c \
	$(srcroot)test/integration/thread_arena.c \
	$(srcroot)test/integration/thread_tcache_enabled.c \
	$(srcroot)test/integration/xallocx.c
TESTS_STRESS := $(srcroot)test/stress/microbench.c
TESTS := $(TESTS_UNIT) $(TESTS_INTEGRATION) $(TESTS_STRESS)

C_OBJS := $(C_SRCS:$(srcroot)%.c=$(objroot)%.$(O))
C_PIC_OBJS := $(C_SRCS:$(srcroot)%.c=$(objroot)%.pic.$(O))
C_JET_OBJS := $(C_SRCS:$(srcroot)%.c=$(objroot)%.jet.$(O))
C_TESTLIB_UNIT_OBJS := $(C_TESTLIB_SRCS:$(srcroot)%.c=$(objroot)%.unit.$(O))
C_TESTLIB_INTEGRATION_OBJS := $(C_TESTLIB_SRCS:$(srcroot)%.c=$(objroot)%.integration.$(O))
C_UTIL_INTEGRATION_OBJS := $(C_UTIL_INTEGRATION_SRCS:$(srcroot)%.c=$(objroot)%.integration.$(O))
C_TESTLIB_STRESS_OBJS := $(C_TESTLIB_SRCS:$(srcroot)%.c=$(objroot)%.stress.$(O))
C_TESTLIB_OBJS := $(C_TESTLIB_UNIT_OBJS) $(C_TESTLIB_INTEGRATION_OBJS) $(C_UTIL_INTEGRATION_OBJS) $(C_TESTLIB_STRESS_OBJS)

TESTS_UNIT_OBJS := $(TESTS_UNIT:$(srcroot)%.c=$(objroot)%.$(O))
TESTS_INTEGRATION_OBJS := $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%.$(O))
TESTS_STRESS_OBJS := $(TESTS_STRESS:$(srcroot)%.c=$(objroot)%.$(O))
TESTS_OBJS := $(TESTS_UNIT_OBJS) $(TESTS_INTEGRATION_OBJS) $(TESTS_STRESS_OBJS)

.PHONY: all dist build_doc_html build_doc_man build_doc
.PHONY: install_bin install_include install_lib
.PHONY: install_doc_html install_doc_man install_doc install
.PHONY: tests check clean distclean relclean

.SECONDARY : $(TESTS_OBJS)

# Default target.
all: build_lib

dist: build_doc

$(objroot)doc/%.html : $(objroot)doc/%.xml $(srcroot)doc/stylesheet.xsl $(objroot)doc/html.xsl
	$(XSLTPROC) -o $@ $(objroot)doc/html.xsl $<

$(objroot)doc/%.3 : $(objroot)doc/%.xml $(srcroot)doc/stylesheet.xsl $(objroot)doc/manpages.xsl
	$(XSLTPROC) -o $@ $(objroot)doc/manpages.xsl $<

build_doc_html: $(DOCS_HTML)
build_doc_man: $(DOCS_MAN3)
build_doc: $(DOCS)

#
# Include generated dependency files.
#
ifdef CC_MM
-include $(C_OBJS:%.$(O)=%.d)
-include $(C_PIC_OBJS:%.$(O)=%.d)
-include $(C_JET_OBJS:%.$(O)=%.d)
-include $(C_TESTLIB_OBJS:%.$(O)=%.d)
-include $(TESTS_OBJS:%.$(O)=%.d)
endif

$(C_OBJS): $(objroot)src/%.$(O): $(srcroot)src/%.c
$(C_PIC_OBJS): $(objroot)src/%.pic.$(O): $(srcroot)src/%.c
$(C_PIC_OBJS): CFLAGS += $(PIC_CFLAGS)
$(C_JET_OBJS): $(objroot)src/%.jet.$(O): $(srcroot)src/%.c
$(C_JET_OBJS): CFLAGS += -DJEMALLOC_JET
$(C_TESTLIB_UNIT_OBJS): $(objroot)test/src/%.unit.$(O): $(srcroot)test/src/%.c
$(C_TESTLIB_UNIT_OBJS): CPPFLAGS += -DJEMALLOC_UNIT_TEST
$(C_TESTLIB_INTEGRATION_OBJS): $(objroot)test/src/%.integration.$(O): $(srcroot)test/src/%.c
$(C_TESTLIB_INTEGRATION_OBJS): CPPFLAGS += -DJEMALLOC_INTEGRATION_TEST
$(C_UTIL_INTEGRATION_OBJS): $(objroot)src/%.integration.$(O): $(srcroot)src/%.c
$(C_TESTLIB_STRESS_OBJS): $(objroot)test/src/%.stress.$(O): $(srcroot)test/src/%.c
$(C_TESTLIB_STRESS_OBJS): CPPFLAGS += -DJEMALLOC_STRESS_TEST -DJEMALLOC_STRESS_TESTLIB
$(C_TESTLIB_OBJS): CPPFLAGS += -I$(srcroot)test/include -I$(objroot)test/include
$(TESTS_UNIT_OBJS): CPPFLAGS += -DJEMALLOC_UNIT_TEST
$(TESTS_INTEGRATION_OBJS): CPPFLAGS += -DJEMALLOC_INTEGRATION_TEST
$(TESTS_STRESS_OBJS): CPPFLAGS += -DJEMALLOC_STRESS_TEST
$(TESTS_OBJS): $(objroot)test/%.$(O): $(srcroot)test/%.c
$(TESTS_OBJS): CPPFLAGS += -I$(srcroot)test/include -I$(objroot)test/include
ifneq ($(IMPORTLIB),$(SO))
$(C_OBJS) $(C_JET_OBJS): CPPFLAGS += -DDLLEXPORT
endif

ifndef CC_MM
# Dependencies.
HEADER_DIRS = $(srcroot)include/jemalloc/internal \
	$(objroot)include/jemalloc $(objroot)include/jemalloc/internal
HEADERS = $(wildcard $(foreach dir,$(HEADER_DIRS),$(dir)/*.h))
$(C_OBJS) $(C_PIC_OBJS) $(C_JET_OBJS) $(C_TESTLIB_OBJS) $(TESTS_OBJS): $(HEADERS)
$(TESTS_OBJS): $(objroot)test/include/test/jemalloc_test.h
endif

$(C_OBJS) $(C_PIC_OBJS) $(C_JET_OBJS) $(C_TESTLIB_OBJS) $(TESTS_OBJS): %.$(O):
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $(CPPFLAGS) $(CTARGET) $<
ifdef CC_MM
	@$(CC) -MM $(CPPFLAGS) -MT $@ -o $(@:%.$(O)=%.d) $<
endif

ifneq ($(SOREV),$(SO))
%.$(SO) : %.$(SOREV)
	@mkdir -p $(@D)
	ln -sf $(<F) $@
endif

$(objroot)lib/$(LIBJEMALLOC).$(SOREV) : $(if $(PIC_CFLAGS),$(C_PIC_OBJS),$(C_OBJS))
	@mkdir -p $(@D)
	$(CC) $(DSO_LDFLAGS) $(call RPATH,$(RPATH_EXTRA)) $(LDTARGET) $+ $(LDFLAGS) $(LIBS) $(EXTRA_LDFLAGS)

$(objroot)lib/$(LIBJEMALLOC)_pic.$(A) : $(C_PIC_OBJS)
$(objroot)lib/$(LIBJEMALLOC).$(A) : $(C_OBJS)
$(objroot)lib/$(LIBJEMALLOC)_s.$(A) : $(C_OBJS)

$(STATIC_LIBS):
	@mkdir -p $(@D)
	$(AR) $(ARFLAGS) $@ $+

$(objroot)test/unit/%$(EXE): $(objroot)test/unit/%.$(O) $(TESTS_UNIT_LINK_OBJS) $(C_JET_OBJS) $(C_TESTLIB_UNIT_OBJS)
	@mkdir -p $(@D)
	$(CC) $(LDTARGET) $(filter %.$(O),$^) $(call RPATH,$(objroot)lib) $(LDFLAGS) $(filter-out -lm,$(LIBS)) $(LM) $(EXTRA_LDFLAGS)

$(objroot)test/integration/%$(EXE): $(objroot)test/integration/%.$(O) $(C_TESTLIB_INTEGRATION_OBJS) $(C_UTIL_INTEGRATION_OBJS) $(objroot)lib/$(LIBJEMALLOC).$(IMPORTLIB)
	@mkdir -p $(@D)
	$(CC) $(TEST_LD_MODE) $(LDTARGET) $(filter %.$(O),$^) $(call RPATH,$(objroot)lib) $(LJEMALLOC) $(LDFLAGS) $(filter-out -lm,$(filter -lrt -lpthread,$(LIBS))) $(LM) $(EXTRA_LDFLAGS)

$(objroot)test/stress/%$(EXE): $(objroot)test/stress/%.$(O) $(C_JET_OBJS) $(C_TESTLIB_STRESS_OBJS) $(objroot)lib/$(LIBJEMALLOC).$(IMPORTLIB)
	@mkdir -p $(@D)
	$(CC) $(TEST_LD_MODE) $(LDTARGET) $(filter %.$(O),$^) $(call RPATH,$(objroot)lib) $(objroot)lib/$(LIBJEMALLOC).$(IMPORTLIB) $(LDFLAGS) $(filter-out -lm,$(LIBS)) $(LM) $(EXTRA_LDFLAGS)

build_lib_shared: $(DSOS)
build_lib_static: $(STATIC_LIBS)
build_lib: build_lib_shared build_lib_static

install_bin:
	$(INSTALL) -d $(BINDIR)
	@for b in $(BINS); do \
	echo "$(INSTALL) -m 755 $$b $(BINDIR)"; \
	$(INSTALL) -m 755 $$b $(BINDIR); \
done

install_include:
	$(INSTALL) -d $(INCLUDEDIR)/jemalloc
	@for h in $(C_HDRS); do \
	echo "$(INSTALL) -m 644 $$h $(INCLUDEDIR)/jemalloc"; \
	$(INSTALL) -m 644 $$h $(INCLUDEDIR)/jemalloc; \
done

install_lib_shared: $(DSOS)
	$(INSTALL) -d $(LIBDIR)
	$(INSTALL) -m 755 $(objroot)lib/$(LIBJEMALLOC).$(SOREV) $(LIBDIR)
ifneq ($(SOREV),$(SO))
	ln -sf $(LIBJEMALLOC).$(SOREV) $(LIBDIR)/$(LIBJEMALLOC).$(SO)
endif

install_lib_static: $(STATIC_LIBS)
	$(INSTALL) -d $(LIBDIR)
	@for l in $(STATIC_LIBS); do \
	echo "$(INSTALL) -m 755 $$l $(LIBDIR)"; \
	$(INSTALL) -m 755 $$l $(LIBDIR); \
done

install_lib_pc: $(PC)
	$(INSTALL) -d $(LIBDIR)/pkgconfig
	@for l in $(PC); do \
	echo "$(INSTALL) -m 644 $$l $(LIBDIR)/pkgconfig"; \
	$(INSTALL) -m 644 $$l $(LIBDIR)/pkgconfig; \
done

install_lib: install_lib_shared install_lib_static install_lib_pc

install_doc_html:
	$(INSTALL) -d $(DATADIR)/doc/jemalloc$(install_suffix)
	@for d in $(DOCS_HTML); do \
	echo "$(INSTALL) -m 644 $$d $(DATADIR)/doc/jemalloc$(install_suffix)"; \
	$(INSTALL) -m 644 $$d $(DATADIR)/doc/jemalloc$(install_suffix); \
done

install_doc_man:
	$(INSTALL) -d $(MANDIR)/man3
	@for d in $(DOCS_MAN3); do \
	echo "$(INSTALL) -m 644 $$d $(MANDIR)/man3"; \
	$(INSTALL) -m 644 $$d $(MANDIR)/man3; \
done

install_doc: install_doc_html install_doc_man

install: install_bin install_include install_lib install_doc

tests_unit: $(TESTS_UNIT:$(srcroot)%.c=$(objroot)%$(EXE))
tests_integration: $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%$(EXE))
tests_stress: $(TESTS_STRESS:$(srcroot)%.c=$(objroot)%$(EXE))
tests: tests_unit tests_integration tests_stress

check_unit_dir:
	@mkdir -p $(objroot)test/unit
check_integration_dir:
	@mkdir -p $(objroot)test/integration
stress_dir:
	@mkdir -p $(objroot)test/stress
check_dir: check_unit_dir check_integration_dir

check_unit: tests_unit check_unit_dir
	$(SHELL) $(objroot)test/test.sh $(TESTS_UNIT:$(srcroot)%.c=$(objroot)%)
check_integration_prof: tests_integration check_integration_dir
ifeq ($(enable_prof), 1)
	$(MALLOC_CONF)="prof:true" $(SHELL) $(objroot)test/test.sh $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%)
	$(MALLOC_CONF)="prof:true,prof_active:false" $(SHELL) $(objroot)test/test.sh $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%)
endif
check_integration_decay: tests_integration check_integration_dir
	$(MALLOC_CONF)="decay_time:-1" $(SHELL) $(objroot)test/test.sh $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%)
	$(MALLOC_CONF)="decay_time:0" $(SHELL) $(objroot)test/test.sh $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%)
check_integration: tests_integration check_integration_dir
	$(SHELL) $(objroot)test/test.sh $(TESTS_INTEGRATION:$(srcroot)%.c=$(objroot)%)
stress: tests_stress stress_dir
	$(SHELL) $(objroot)test/test.sh $(TESTS_STRESS:$(srcroot)%.c=$(objroot)%)
check: check_unit check_integration check_integration_decay check_integration_prof

ifeq ($(enable_code_coverage), 1)
coverage_unit: check_unit
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src jet $(C_JET_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/src unit $(C_TESTLIB_UNIT_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/unit unit $(TESTS_UNIT_OBJS)

coverage_integration: check_integration
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src pic $(C_PIC_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src integration $(C_UTIL_INTEGRATION_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/src integration $(C_TESTLIB_INTEGRATION_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/integration integration $(TESTS_INTEGRATION_OBJS)

coverage_stress: stress
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src pic $(C_PIC_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src jet $(C_JET_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/src stress $(C_TESTLIB_STRESS_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/stress stress $(TESTS_STRESS_OBJS)

coverage: check
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src pic $(C_PIC_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src jet $(C_JET_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)src integration $(C_UTIL_INTEGRATION_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/src unit $(C_TESTLIB_UNIT_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/src integration $(C_TESTLIB_INTEGRATION_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/src stress $(C_TESTLIB_STRESS_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/unit unit $(TESTS_UNIT_OBJS) $(TESTS_UNIT_AUX_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/integration integration $(TESTS_INTEGRATION_OBJS)
	$(SHELL) $(srcroot)coverage.sh $(srcroot)test/stress integration $(TESTS_STRESS_OBJS)
endif

clean:
	rm -f $(C_OBJS)
	rm -f $(C_PIC_OBJS)
	rm -f $(C_JET_OBJS)
	rm -f $(C_TESTLIB_OBJS)
	rm -f $(C_OBJS:%.$(O)=%.d)
	rm -f $(C_OBJS:%.$(O)=%.gcda)
	rm -f $(C_OBJS:%.$(O)=%.gcno)
	rm -f $(C_PIC_OBJS:%.$(O)=%.d)
	rm -f $(C_PIC_OBJS:%.$(O)=%.gcda)
	rm -f $(C_PIC_OBJS:%.$(O)=%.gcno)
	rm -f $(C_JET_OBJS:%.$(O)=%.d)
	rm -f $(C_JET_OBJS:%.$(O)=%.gcda)
	rm -f $(C_JET_OBJS:%.$(O)=%.gcno)
	rm -f $(C_TESTLIB_OBJS:%.$(O)=%.d)
	rm -f $(C_TESTLIB_OBJS:%.$(O)=%.gcda)
	rm -f $(C_TESTLIB_OBJS:%.$(O)=%.gcno)
	rm -f $(TESTS_OBJS:%.$(O)=%$(EXE))
	rm -f $(TESTS_OBJS)
	rm -f $(TESTS_OBJS:%.$(O)=%.d)
	rm -f $(TESTS_OBJS:%.$(O)=%.gcda)
	rm -f $(TESTS_OBJS:%.$(O)=%.gcno)
	rm -f $(TESTS_OBJS:%.$(O)=%.out)
	rm -f $(DSOS) $(STATIC_LIBS)
	rm -f $(objroot)*.gcov.*

distclean: clean
	rm -f $(objroot)bin/jemalloc-config
	rm -f $(objroot)bin/jemalloc.sh
	rm -f $(objroot)bin/jeprof
	rm -f $(objroot)config.log
	rm -f $(objroot)config.status
	rm -f $(objroot)config.stamp
	rm -f $(cfghdrs_out)
	rm -f $(cfgoutputs_out)

relclean: distclean
	rm -f $(objroot)configure
	rm -f $(objroot)VERSION
	rm -f $(DOCS_HTML)
	rm -f $(DOCS_MAN3)

#===============================================================================
# Re-configuration rules.

ifeq ($(enable_autogen), 1)
$(srcroot)configure : $(srcroot)configure.ac
	cd ./$(srcroot) && $(AUTOCONF)

$(objroot)config.status : $(srcroot)configure
	./$(objroot)config.status --recheck

$(srcroot)config.stamp.in : $(srcroot)configure.ac
	echo stamp > $(srcroot)config.stamp.in

$(objroot)config.stamp : $(cfgoutputs_in) $(cfghdrs_in) $(srcroot)configure
	./$(objroot)config.status
	@touch $@

# There must be some action in order for make to re-read Makefile when it is
# out of date.
$(cfgoutputs_out) $(cfghdrs_out) : $(objroot)config.stamp
	@true
endif
