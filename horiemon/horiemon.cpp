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

int L;
int N;
vector<int> v;
int ans = 0;

bool bisearch(int i, int j, int target){
    int low = v[i];
    int high = v[j];
    if(low==target || high==target) return true;
    else{
        int k = (i+j)/2;
        if(k==i) return false;
        else{
            int mid = v[k];
            if(target<=mid) return bisearch(i, k, target);
            else return bisearch(k, j, target);
        }
    }
}

void rec(int i, int sum){
    if(sum==0){
        for(int j=0; j<N-2; j++){
            if(v[j] < L){
                if(L-v[j] < 2*v[N-1]){
                    rec(j, sum+v[j]);
                }
            }
            else break;
        }
    }
    else{
        for(int j=i+1; j<N-1; j++){
            int target = L-v[i]-v[j];
            if(target > v[j]){
                if(bisearch(j, N-1, target)) ans++;
                //cout << "first : " << v[j] << ", second : " << v[i] << ", third : " << target << endl;
            }
            else break;
        }
    }
}

int main(){
    cin >> L;
    cin >> N;
    for(int i=0; i<N; i++){
        int n;
        cin >> n;
        v.push_back(n);
    }
    sort(v.begin(), v.end());
    //cout << "L = " << L << endl;
    //for(int i=0; i<N; i++) cout << v[i] << endl;
    rec(0,0);
    cout << ans << endl;
}
