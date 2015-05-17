#include <iostream>
#include <sstream>
#include <string>
#include <queue>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <algorithm>
using namespace std;

void splitstring(pair<string, string> &p, string &s, string separator){
  int i = 0;
  int j = s.find_first_of(separator);
  p.first = s.substr(i, j - i);
  p.second = s.substr(j+1, -1);
}

class City{
public:
  string name;
  vector< pair<int, int> > days;

  City(){
    days.resize(2);
  }

  bool input(){
    string days_str;
    pair<string, string> days_all, day_first, day_last;
    if(cin >> name >> days_str){
      splitstring(days_all, days_str, "-");
      splitstring(day_first, days_all.first, "/");
      splitstring(day_last, days_all.second, "/");

      stringstream ss;
      ss << day_first.first;
      ss >> days[0].first;
      ss.clear();
      ss << day_first.second;
      ss >> days[0].second;
      ss.clear();
      ss << day_last.first;
      ss >> days[1].first;
      ss.clear();
      ss << day_last.second;
      ss >> days[1].second;
      return true;
    }
    else return false;
  }

  void print(){
    cout << name << " " << days[0].first << "/" << days[0].second << "-" << days[1].first << "/" << days[1].second << endl;
  }
};

bool early(const City& left, const City& right){
  return left.days[1] < right.days[1];
}

bool abc(const City& left, const City& right){
  return left.name < right.name;
}

int main(){
  vector<City> cities;
  City city;
  while(city.input()){
    cities.push_back(city);
  }
  /*
  sort(cities.begin(), cities.end(), early);

  for(vector<City>::iterator it = cities.begin(); it != cities.end(); it++){
    it->print();
  }
  */
  vector<City> bestway;

  while(true){
    if(cities.empty()) break;

    sort(cities.begin(), cities.end(), early);
    City city = cities[0];
    bestway.push_back(city);
    //    city.print();

    vector<City>::iterator it = cities.begin();
    it = cities.erase(it);

    for(vector<City>::iterator it = cities.begin(); it != cities.end();){
        if (it->days[0] <= city.days[1]){
	  //it->print();
	  it = cities.erase(it);
        }
        else{
	  it++;
        }
    }
    //cout << endl;
  }

  sort(bestway.begin(), bestway.end(), abc);
  cout << bestway.size() << " ";
  for(vector<City>::iterator it = bestway.begin(); it != bestway.end(); it++){
    //it->print();
    cout << it->name << " ";
  }
  cout << endl;

}
