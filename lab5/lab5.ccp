#include <iostream>
#include <clocale>

using namespace std;
int main() {
  int a[5] = {0};
  int b[5] = {0};

cout << "Massive a:" << endl;
  for (int i = 0; i < 5; i++) {
      cin >> a[i];
   }
cout << "Massive b:" << endl;
  for (int i = 0; i < 5; i++) {
        cin >> b[i];
    }
//Рассполагаем положительные числа в массиве a и отрицательные в b
    for (int i = 0; i < 5; i++) {
     if (a[i] <= 0) {
      for (int j = 0; j < 5; j++) {
        if (b[j] > 0) {
          swap(a[i], b[j]);
            break;
                  }
              }
         }
    }
//cобираем положительные числа в массиве a
  int j = 0;
   for (int i = 0; i < 5; i++) {
    if (a[i] > 0) {
     a[j] = a[i];
      j++;
          }
     }
  for (int i = j; i < 5; i++) {
        a[i] = 0;
    }

//cобираем отрицательные в массиве b
  int g = 0;
   for (int i = 0; i < 5; i++) {
     if (b[i] < 0) {
       b[g] = b[i];
         g++;
        }
    }
  for (int i = g; i < 5; i++) {
        b[i] = 0;
    }

 //Вывод....................................
    cout << "New a:" << endl;//выводим новый массивы
    for (int i = 0; i < 5; i++) {
        cout << a[i] << " ";
    }

    cout << "\nNew b:" << endl;
    for (int j = 0; j < 5; j++) {
        cout << b[j] << " ";
    }
}
