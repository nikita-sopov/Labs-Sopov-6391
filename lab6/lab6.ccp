#include <iostream>
#include <cmath>   //для математических функций

using namespace std;

int main() {
    double a, b, c;
    double Xnach, Xkon, dX;
    cout << "Enter a, b, c: ";
    cin >> a >> b >> c;
    cout << "Enter Xnach, Xkon, dX: ";
    cin >> Xnach >> Xkon >> dX;
    
    if (dX == 0) {
        cout << "Error" << endl;//проверка на корректность шага
        return 1;
    }
    int Ac = (int)a;//избавление от дробей
    int Bc = (int)b;
    int Cc = (int)c;
    
    for (double x = Xnach; x <= Xkon + (dX / 2.0); x += dX) { //for для защиты от ошибок округления тк числа дробные
        double F;
        
        //первое усл
        if (x < 0 && b != 0) {
            F = a * x * x + b;
        }
        //второе усл
        else if (x > 0 && b == 0) {
            if (x - c != 0) { //проверка деления на ноль для (x - c)
                F = (x - a) / (x - c);
            } else {
                continue;
            }
        }
        //третье усл
        else { 
            if (c != 0) { //проверка деления на ноль для c
                F = x / c;
            } else {
                continue;
            }
        } 
        if (((Ac | Bc) & (Ac | Cc)) != 0) {
            cout << x << " " << F << endl;
        } else {
            int FF = (int)F;//избавляемся от дробей
            cout << x << " " << FF << endl;
        }
    }
    
    return 0;
}
