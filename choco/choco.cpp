#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <queue>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <algorithm>
using namespace std;

int gcd(int n,int m){
  if(n > m) swap(n,m);
  int tmp;  
  while(n != 0){
    tmp = n;
    n = m%n;
    m = tmp;
  }
  return m;
}

int factorize(int n){
  int d = 1;
  int x;
  int y = random()%n+1;
  while(d == 1){
    x = y;
    y = random()%n+1;
    d = gcd(abs(x-y),n);
    if(d == n) return 0;
  }
  return d;
}

int main(){
  srandom(0);
  //int n = 394587;
  int n = 280671392065546467397265294532969672241810318954163887187279320454220348884327;
  int f = factorize(n);
  cout << f << endl;
  cout << n/f << endl;
}
