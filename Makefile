all: isqrt-gcc isqrt-clang isqrt-rs sse-isqrt fast-isqrt slow-isqrt

CFLAGS+=-mno-sse -mno-sse -mno-mmx -m32

isqrt-rs: isqrt.rs Makefile
	rustc $< -C opt-level=3 -o $@.asm --emit asm
	rustc $< -C opt-level=3 -o $@

isqrt-gcc: isqrt.c Makefile
	gcc $< -O3 -ffast-math -o $@.asm -S
	gcc $< -O3 -ffast-math -o $@ -lm 

isqrt-clang: isqrt.c Makefile
	clang $< -O3 -ffast-math -o $@.asm -S
	clang $< -O3 -ffast-math -o $@ -lm 

sse-isqrt: sse-isqrt.c Makefile
	gcc $< -O3 -ffast-math -o $@.asm -S
	gcc $< -O3 -ffast-math -o $@ -lm 

fast-isqrt: fast-isqrt.c Makefile
	gcc $< $(CFLAGS) -O3 -ffast-math -o $@.asm -S
	gcc $< $(CFLAGS) -O3 -ffast-math -o $@ -lm 

slow-isqrt: isqrt.c Makefile
	gcc $< $(CFLAGS) -O3 -ffast-math -o $@.asm -S
	gcc $< $(CFLAGS) -O3 -ffast-math -o $@ -lm 
