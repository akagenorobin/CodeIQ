#include<cmath>
#include<cstdlib>
#include<string>
#include<sstream>
#include<vector>
#include<iostream>
#include<queue>
#include<deque>
#include<map>
#include<set>
#include<stack>
#include<list>
#include<algorithm>
using namespace std;

int n = 11;
int ans = 0;

void rec(int i, vector<int> cards){
  /*
  for(int j=0; j<2*n; j++){
    cout << cards[j] << " ";
  }
  cout << endl;
  */
  if(i == n+1){
    for(int j=0; j<2*n; j++){
      cout << cards[j] << " ";
    }
    cout << endl;
    ans++;
  }
  else{
    for(int j=0; j<2*n; j++){
      if(j+i+1 <= 2*n-1){
	if(cards[j] == 0 && cards[j+i+1] == 0){
	  cards[j] = i;
	  cards[j+i+1] = i;
	}
	else continue;
      }
      else break;
      rec(i+1, cards);
      cards[j] = 0;
      cards[j+i+1] = 0;
    }
  }
}

int main(){
  vector<int> cards;
  cards.resize(2*n);
  for(int i=0; i<2*n; i++) cards[i] = 0;
  rec(1, cards);
  cout << ans << endl;
}
