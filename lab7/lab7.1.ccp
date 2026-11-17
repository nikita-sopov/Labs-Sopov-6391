#include <iostream>

using namespace std;

const int M = 2;
const int K = 3;
const int N = 2;

int main()
{
    double A[M][K];
    double B[K][N];
    double C[M][N] = { 0.0 };

    cout << "Enter matrix A (" << M << "x" << K << "):" << endl;
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < K; j++) {
            if (!(cin >> A[i][j])) {
                cerr << "Input error for A[" << i << "][" << j << "]" << endl;
                return 1;
            }
        }
    }

    cout << "Enter matrix B (" << K << "x" << N << "):" << endl;
    for (int i = 0; i < K; i++) {
        for (int j = 0; j < N; j++) {
            if (!(cin >> B[i][j])) {
                cerr << "Input error for B[" << i << "][" << j << "]" << endl;
                return 1;
            }
        }
    }

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            for (int k = 0; k < K; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }

    cout << "Matrix C = A * B (" << M << "x" << N << "):" << endl;
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            cout << C[i][j] << "\t";
        }
        cout << endl;
    }

    return 0;
}
