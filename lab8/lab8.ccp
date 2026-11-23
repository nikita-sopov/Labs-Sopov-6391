#include <iostream>
#include <iomanip>

using namespace std;

// Пересчёт двумерных индексов в линейный
// idx вычисляет номер элемента в одномерном массиве
// Обратный пересчёт-cols число столбцов/rows число строк
inline int idx(int i, int j, int cols) { //inline-вставь код этой функции прямо в код в main
    return i * cols + j; 
}
void multiplyMatrices(const double* A, const double* B, double* C, int rows) {
    //обнуление результата
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < rows; j++)
            C[idx(i, j, rows)] = 0.0;
    //перемножение
    for (int i = 0; i < rows; i++)
        for (int j = 0; j < rows; j++)
            for (int k = 0; k < rows; k++)
                C[idx(i, j, rows)] += A[idx(i, k, rows)] * B[idx(k, j, rows)];
}

int main() {
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

    // Размерности введены с клавиатуры -> выделяем память под одномерный массив M*M
    int size = M * M;                     // всего элементов
    double* A = new double[size]();       // () — зануление

    // ввод матрицы построчно (i — строка, j — столбец)
    cout << "Enter the matrix " << M << "x" << N << ":" << endl;
    for (int i = 0; i < M; i++)
        for (int j = 0; j < M; j++)
            cin >> A[idx(i, j, M)];

    int n;
    cout << "Enter a positive integer power n: ";
    cin >> n;

    if (n < 1) {
        cout << "The power must be a positive integer" << endl;
        delete[] A;
        return 52;
    }

    //result — копия A (это A^1)
    double* result = new double[size];
    for (int p = 0; p < size; p++)
        result[p] = A[p];

    // возведение в степень
    for (int power = 2; power <= n; power++) {
        double* temp = new double[size]();       //temp = result * A
        multiplyMatrices(result, A, temp, M);

        delete[] result;                         //освобождаем старый result
        result = temp;
    }

    //вывод результата в виде таблицы
    cout << "Resulting matrix A^" << n << ":" << endl;
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < M; j++) {
            cout << setw(10) << fixed << setprecision(2) << result[idx(i, j, M)];
        }
        cout << endl;
    }

    delete[] A; 
    delete[] result; //освобождение матриц

    return 0;
}
