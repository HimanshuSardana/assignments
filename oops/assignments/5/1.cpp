#include <iostream>

using namespace std;

class Base {
public:
        int x;
        int y;
};

class Derived : public Base {
public:
        int z;
};

int main() {
        Base b;
        b.x = 10;
        b.y = 20;

        Derived d;
        d.x = 30;
        d.y = 40;
        d.z = 50;

        cout << "b.x = " << b.x << endl;
        cout << "b.y = " << b.y << endl << endl;

        cout << "d.x = " << d.x << endl;
        cout << "d.y = " << d.y << endl;
        cout << "d.z = " << d.z << endl;
}
