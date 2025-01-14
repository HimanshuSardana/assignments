/*Write a program to determine the most frequent element in an array. If there are*/
/*multiple elements that are appearing the maximum number of times, then print any one*/
/*of them.*/
#include <bits/stdc++.h>

using namespace std;

int main()
{
        vector<int> n = {1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        map<int, int> m;

        for (int i = 0; i < n.size(); i++)
        {
                m[n[i]]++;
        }

        int max = 0;
        int maxElement = 0;

        for (auto i : m)
        {
                if (i.second > max)
                {
                        max = i.second;
                        maxElement = i.first;
                }
        }

        cout << "Most frequent element is: " << maxElement << endl;
}
