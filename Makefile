CLANG = clang

CCINCLUDE += -I./tools/testing/selftests/bpf
LOADINCLUDE += -I./samples/bpf
LOADINCLUDE += -I./tools/lib
LOADINCLUDE += -I./tools/perf
LOADINCLUDE += -I./tools/include

%: %.c load_%.c 
	$(CLANG) -O2 -target bpf -c $< $(CCINCLUDE) -o $(patsubst %.c,%.o,$<)
	$(CLANG) -o $@ -lelf $(LOADINCLUDE) -lbpf ./samples/bpf/bpf_load.c $(filter load_%,$^)
	