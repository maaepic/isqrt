#include <immintrin.h>

inline
float fast_rsqrt(float x) {
	__m128 reg = _mm_set_ss(x);
	reg = _mm_rsqrt_ss(reg);
	return _mm_cvtss_f32(reg);
}

int main(int argc, char** argv)
{
	volatile float x = (float)argc;
	for (volatile int i = 0; i < 100000000; i++) {
		volatile register float y =
			fast_rsqrt(x);
	}

	return 0;
}