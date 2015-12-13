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
/*
int ans = 0;

void rec(char r, int v, int n, string route){
    if(r=='A'){
        route += 'A';
        cout << route << " " << n <<endl;
        ans += 1;
        if(n>1){
            rec('B', 1, n-1, route);
        }
    }
    if(r=='B'){
        route += 'B';
        if(v==1){
            if(n>0){
                rec('A', -1, n-1, route);
                rec('C', 1, n, route);
            }
        }
        if(v==-1){
            rec('A', -1, n, route);
            if(n>1) rec('C', 1, n-1, route);
        }
    }
    if(r=='C'){
        route += 'C';
        if(n>0) rec('B', -1, n-1, route);
    }
}
*/
double dp[100000];
double rec(int i){
    if(dp[i]>0) return dp[i];
    if(i==1) return dp[i]=2;
    if(i>1){
        for(int j=1; j<=i-1; j++){
            if(j==i-1) dp[i] += 2*rec(j);
            else dp[i] += rec(j);
        }
        dp[i] += 1;
    }
    return dp[i];
}

int main(){
    int n;
    cin >> n;
    /*
    rec('B', 1, n, "");
    cout << ans << endl;;
    */
    double ans = 0;
    for(int i=0; i<100000; i++) dp[i] = 0;
    for(int i=1; i<=(n+1)/2; i++){
        ans += rec(i);
    }
    cout << ans << endl;
}
