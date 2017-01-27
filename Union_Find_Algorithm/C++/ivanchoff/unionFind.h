using namespace std;

void initSet(int N, vector<int> &pset);
int findSet(int i, vector<int> &pset);
void unionSet(int i, int j, vector<int> &pset);
bool isSameSet(int i, int j, vector<int> &pset);
void printSet(vector<int> &pset);

//init set: each item initially has itself as the representative
void initSet(int N, vector<int> &pset) {
  pset.resize(N);
  for(int i = 0; i < N; ++i)
    pset[i] = i;
}

//select the representative for i
int findSet(int i, vector<int> &pset) {
  return (pset[i] == i)? i : (pset[i] = findSet(pset[i],pset));
}

//merge two sets
void unionSet(int i, int j, vector<int> &pset){
  pset[findSet(i,pset)] = findSet(j,pset);
}

//check if i and j are in same set
bool isSameSet(int i, int j, vector<int> &pset) {
  return findSet(i,pset) == findSet(j,pset);
}

void printSet(vector<int> &pset){
  for(int i=0; i<pset.size(); ++i)
    cout<<pset[i]<<" ";
  cout<<endl;
}
