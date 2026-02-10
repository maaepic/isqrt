#include <math.h>

int main(int argc, char** argv)
{
	volatile float x = (float)argc;
	for (volatile int i = 0; i < 100000000; i++) {
		volatile register float y =
			1.0f / sqrtf(x);
	}

	return 0;
}