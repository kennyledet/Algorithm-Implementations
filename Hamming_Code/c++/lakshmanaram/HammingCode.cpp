#include<bits/stdc++.h>
using namespace std;
char XOR(char a,char b){
    return (char)((int)'0'+(((int)a-(int)'0')^((int)b-(int)'0')));
}
string ComputeHamming(string a){
    reverse(a.begin(),a.end());
    string ans = "";
    // ai represents the index of string, pow2 -> current power of 2
    for(int i=1, ai=0, pow2=1; ai<a.size(); i++){
        if(pow2 == i){
            pow2 *= 2;
            ans += "0";
        }else{
            ans += a[ai++];
            if(ans[i-1] == '0')
                continue;
            int temp_pow2 = 2;
            while(temp_pow2/2 <= i){
                if(i%temp_pow2 >= temp_pow2/2){
                    ans[(temp_pow2/2)-1] = XOR(ans[(temp_pow2/2)-1],ans[i-1]);
                }
                temp_pow2 *= 2;
            }
        }
    }
    reverse(ans.begin(),ans.end());
    return ans;
}
int main(){
    cout<<"The inputs are passed into the HammingCode() function as a string"<<endl;
    cout<<"\nSample runs - "<<endl;
    cout<<"\n\nINPUT : 1101"<<endl;
    cout<<"OUTPUT : "<<ComputeHamming("1101")<<endl;
    cout<<"\n\nINPUT : 11011101\n";
    cout<<"OUTPUT : "<<ComputeHamming("11011101")<<endl;
    cout<<"\n\nEnter the word to be encoded : ";
    string data;
    cin>>data;
    cout<<"\nThe Hamming encoded word for "<<data<<" is : "<<ComputeHamming(data);
}
