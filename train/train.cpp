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

int n = 12;

bool free(int i, vector<int> seats){
  if(i == 0 && seats[1] == 0 && seats[i] == 0) return true;
  else if(i == n-1 && seats[n-2] == 0 && seats[i] == 0) return true;
  else if(i == 5 && seats[4] == 0 && seats[i] == 0) return true;
  else if(i == 6 && seats[7] == 0 && seats[i] == 0) return true;
  else if(seats[i-1] == 0 && seats[i+1] == 0 && seats[i] == 0) return true;
  else return false;
}

void mprint(map< vector<int>, int> m){
  for(map< vector<int>, int>::iterator it = m.begin(); it != m.end(); it++){
    for(int i=0; i<n; i++) cout << it->first[i] << " ";
    cout << "     " << it->second << endl;
  }
}

int main(){
  vector<int> seats, seatsnew;
  seats.resize(n);
  for(int i=0; i<n; i++) seats[i] = 0;
  queue< vector<int> > q, qnew;
  q.push(seats);
  map< vector<int>, int> m;
  m.insert(map< vector<int>, int>::value_type(seats, 1));

  for(int i=0; i<n; i++){
    while(!qnew.empty()) qnew.pop();

    while(!q.empty()){
      seats = q.front();
      int nfree = 0;
      for(int j=0; j<n; j++){
	if(free(j, seats)){
	  seatsnew = seats;
	  seatsnew[j] = 1;
	  if(m.find(seatsnew) == m.end()){
	    m.insert(map< vector<int>, int>::value_type(seatsnew, m[seats]));
	    qnew.push(seatsnew);
	  }
	  else{
	    m[seatsnew] += m[seats];
	  }
	  nfree++;
	}
      }
      if(nfree == 0){
	for(int j=0; j<n; j++){
	  if(seats[j] == 0){
	    seatsnew = seats;
	    seatsnew[j] = 1;
	    if(m.find(seatsnew) == m.end()){
	      m.insert(map< vector<int>, int>::value_type(seatsnew, m[seats]));
	      qnew.push(seatsnew);
	    }
	    else{
	      m[seatsnew] += m[seats];
	    }
	  }
	}
      }
      q.pop();
    }
    q = qnew;
  }
  mprint(m);
}
