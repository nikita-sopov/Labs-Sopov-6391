#include <iostream>
#include <iomanip>

using namespace std;

//функция перемножения двух матриц размера M x M
//C = A * B
void multiplyMatrices(double** A, double** B, double** C, int M)
    {
        //обнуление результата
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < M; j++) {
                C[i][j] = 0.0;
            }
        }

        //перемножение
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < M; j++) {
                for (int k = 0; k < M; k++) {
                    C[i][j] += A[i][k] * B[k][j];
                }
            }
        }
    }

int main(){
    int M, N;

    cout << "Enter the number of rows (M) and columns (N) separated by a space: ";
    cin >> M >> N;

    if (M <= 0 || N <= 0) {
        cout << "Error: matrix dimensions must be positive numbers." << endl;
        return 1;
    }

    if (M != N) {
        cout << "Error: the matrix is not square (" << M << "x" << N << ")." << endl;
        return 1;
    }

    // оздаем матрицу A, заполненную нулями
    double** A = new double*[M];
    for (int i = 0; i < M; i++) {
        A[i] = new double[M]();
    }

    //ввод матрицы построчно
    cout << "Enter the matrix " << M << "x" << N << ":" << endl;
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < M; j++) {
            cin >> A[i][j];
        }
    }

    int n;
    cout << "Enter a positive integer power n: ";
    cin >> n;

    if (n < 1) {
        cout << "The power must be a positive integer" << endl;

        for (int i = 0; i < M; i++) {
            delete[] A[i];
        }
        delete[] A;

        return 1;
    }

    //создаем result—копию A (это A^1)
    double** result = new double*[M];
    for (int i = 0; i < M; i++) {
        result[i] = new double[M];
        for (int j = 0; j < M; j++) {
            result[i][j] = A[i][j];
        }
    }

    //возведение в степень:result=A^n
    for (int p = 2; p <= n; p++) {
        double** temp = new double*[M];  //создаем временную матрицу temp=result*A
        for (int i = 0; i < M; i++) {
            temp[i] = new double[M]();
        }
    multiplyMatrices(result, A, temp, M);//умножение матриц через функцию: temp=result*A
        //освобождаем старый result
        for (int i = 0; i < M; i++) {
            delete[] result[i];
        }
        delete[] result;
        result = temp;
    }

    //вывод результата в виде таблицы
    cout << "Resulting matrix A^" << n << ":" << endl;
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < M; j++) {
            cout << setw(10) << fixed << setprecision(2) << result[i][j];
        }
        cout << endl;
    }

    //освобождаем память
    for (int i = 0; i < M; i++) {
        delete[] A[i];
        delete[] result[i];
    }
    delete[] A;
    delete[] result;

    return 0;
}
