long i;
float y;

inline
float Q_rsqrt(float number) {
	register float x2;
	const float threehalfs = 1.5F;

	x2 = number * 0.5F;
	y  = number;
	i  = * ( long * ) &y;
	i  = 0x5f3759df - ( i >> 1 );
	y  = * ( float * ) &i;
	y  = y * ( threehalfs - ( x2 * y * y ) );

	return y;
}

int main(int argc, char** argv)
{
	volatile float x = (float)argc;
	for (volatile int i = 0; i < 100000000; i++) {
		volatile register float y =
			Q_rsqrt(x);
	}

	return 0;
}