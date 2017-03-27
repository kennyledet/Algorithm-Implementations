/*

This is an implementation of the playfair cipher for encryption and decryption. 

Input : 
key : which is a lowercase string
msg : the message to be encrypted which is again a lower case string

Output :
Encrypted Message
Decryption of the encrypted message using the cipher

References : https://en.wikipedia.org/wiki/Playfair_cipher

Sample Output : 
go run playfair.go 

Enter the key with no spaces : mykey
Enter the message to be encrypted with no spaces : thisismymessage
Input : thisismymessage
Encrypted Msg : ponqnqykyaxetefa
Decrypted Msg : thisismymesxsage
*/

package main

import "fmt"
import "strings"
//import "math"

func main() {
	var key = ""
	fmt.Printf("Enter the key with no spaces : ")
	_, err := fmt.Scanf("%s", &key) // _ is blank identifier
	if err != nil {
			fmt.Println("Error : " + err.Error())
	}

	var inputMsg = ""
	fmt.Printf("Enter the message to be encrypted with no spaces : ")
	_, err = fmt.Scanf("%s", &inputMsg) // _ is blank identifier
	if err != nil {
			fmt.Println("Error : " + err.Error())
	}

	var mat = ""
	for i:=0 ; i<=25;i++ {
		key = key + string(97+i)
	}
	for i := 0; i < len(key); i++ {
		//fmt.Println(string(key[i])=="a")
		var tmp = string(key[i])
		if(tmp=="j") {
			tmp="i"
		}
		if(!strings.Contains(mat,tmp)) {
			mat = mat + tmp 
		}
	}
	//fmt.Println(mat)
	playFairMatrix := [5][5]string{}
	var count = 0
	for i:=0 ; i<5;i++ {
		for j:=0 ; j<5 ; j++ {
			playFairMatrix[i][j]=string(mat[count])
			count++
		}
	}
//	fmt.Println(playFairMatrix)
	var encrypted = encryptMsg(playFairMatrix,inputMsg)
	var decrypted = decryptMsg(playFairMatrix,encrypted)
	fmt.Printf("Input : %s\n",inputMsg)
	fmt.Printf("Encrypted Msg : %s\n",encrypted)
	fmt.Printf("Decrypted Msg : %s\n",decrypted)
}	

func encryptMsg(playFairMatrix [5][5]string,input string) string {
	var x= ""
	for i:=0 ; i<len(input);i++ {
		var ch1=string(input[i])
		var ch2=string("z")
		if(i+1!=len(input)) {
			if(input[i+1]==input[i]) {
				ch2=string("x")
			} else {
				ch2=string(input[i+1])
				i++
			}
		}
		//fmt.Print(ch1)
		//fmt.Println(ch2)
		var r1,r2,c1,c2 int
		for i:=0 ; i<5;i++ {
			for j:=0;j<5;j++ {
				if(playFairMatrix[i][j]==ch1) {
					r1=i
					c1=j
				}
			}
		}

		for i:=0 ; i<5;i++ {
			for j:=0;j<5;j++ {
				if(playFairMatrix[i][j]==ch2) {
					r2=i
					c2=j
				}
			}
		}
		//case 1 : same row
		if(r1==r2) {
			x = x + string(playFairMatrix[r1][(c1+1)%5])
			x = x + string(playFairMatrix[r1][(c2+1)%5])
		} else if (c1==c2) { //case 2 : same column
			x = x + string(playFairMatrix[(r1+1)%5][c1])
			x = x + string(playFairMatrix[(r2+1)%5][c1])
		} else { //case 3 : 
			x = x + string(playFairMatrix[r1][c2])
			x = x + string(playFairMatrix[r2][c1])
		}
	}
	//fmt.Println(x)
	return x
}

func decryptMsg(playFairMatrix [5][5]string,input string) string {
	var x= ""
	for i:=0 ; i<len(input);i=i+2 {
		var ch1=string(input[i])
		var ch2=string(input[i+1])
		//fmt.Print(ch1)
		//fmt.Println(ch2)
		var r1,r2,c1,c2 int
		for i:=0 ; i<5;i++ {
			for j:=0;j<5;j++ {
				if(playFairMatrix[i][j]==ch1) {
					r1=i
					c1=j
				}
			}
		}

		for i:=0 ; i<5;i++ {
			for j:=0;j<5;j++ {
				if(playFairMatrix[i][j]==ch2) {
					r2=i
					c2=j
				}
			}
		}

		//case 1 : same row
		if(r1==r2) {
			var tmp = (c1-1)%5
			if(tmp<0) {
				tmp=4
			}
			x = x + string(playFairMatrix[r1][tmp])
			tmp = (c2-1)%5
			if(tmp<0) {
				tmp=4
			}
			x = x + string(playFairMatrix[r1][tmp])
		} else if (c1==c2) { //case 2 : same column
			var tmp = (r1-1)%5
			if(tmp<0) {
				tmp=4
			}
			x = x + string(playFairMatrix[tmp][c1])
			tmp = (r2-1)%5
			if(tmp<0) {
				tmp=4
			}
			x = x + string(playFairMatrix[tmp][c1])
		} else { //case 3 : 
			x = x + string(playFairMatrix[r1][c2])
			x = x + string(playFairMatrix[r2][c1])
		}
	}
	//fmt.Println(x)
	return x
}
