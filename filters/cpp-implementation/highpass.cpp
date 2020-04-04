#include <math.h>

#define PI 3.14159
#define N 1000
#define fIN 3000.0
#define fSAMP 48000.0

// fc = 1 kHz
#define Y1 1.8125
#define Y2 -0.828125
#define X0 0.9140625
#define X1 -1.828125
#define X2 0.9140625


int main () {

    // create and fill input and output vectors
    float xn[N] = {0}, yn[N] = {0};
    for(int i = 0; i<N; i++) {
        yn[i] = sin(2.0*PI*fIN/fSAMP*(float)(i))
    }

    // difference equation variable
    float y1 = 0, y2 = 0, x0 = 0, x1 = 0, x2 = 0;

    for (int i = 0; i<N; i++) {
        // implement difference equation
        yn[i] = Y1*y1 + Y2*y2 + X0*xn + X1*x1 + X2*x2;

        // rotate buffer
        x2 = x1;
        x1 = xn;
        y2 = y1;
        y1 = yn;
    }

}