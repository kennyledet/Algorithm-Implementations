/*
Simulation of Lamport's Logical Clock Syncronization
Sample Output Simulation : https://www.showterm.io/556636ec7caa4687680c0
References : Distributed systems: Principles and Paradigms, Andrew S. Tanenbaum

The program takes the following input :
	nProcesses : total no. of processes in the system
	nIterations : no. of counter/clock iterations for which the output is generated
	clockConstant : the constant rate by which counter/clock is incremented on each tick

Output :
The program randomly generates a message between any two distinct processes in the system on every 3rd iteration. The message is added to a message queue and read by the recipient on the next iteration. Based on the timestamp at which the message was sent and current time on the receiver, clock time of receiver is adjusted if timestamp of message is >= receiver time else left the same. >= because it will take a finite amount of time to send the message always.
*/

package main

import (
	"fmt"       //for println,scanf
	"math/rand" //for random number generator
	"time"      //for sleep
)

func main() {
	var nProcesses, nIterations int // Number of processes, Number of iterations
	fmt.Printf("Enter number of Processes and iterations you want to simulate : ")
	_, err := fmt.Scanf("%d %d", &nProcesses, &nIterations) // _ is blank identifier
	if err != nil {
		fmt.Println("Error : " + err.Error())
	}
	clockTable := [][]int{}  //table to store final counter/logical clock values
	var clockConstants []int //slice to store values by which clock are incremented on each iteration
	clockConstants = make([]int, nProcesses, nProcesses)

	fmt.Printf("Enter the clock constants for each process : ") //user input for clock constants
	for i := 0; i < nProcesses; i++ {
		_, err := fmt.Scanf("%d", &clockConstants[i])
		if err != nil {
			fmt.Println("Error : " + err.Error())
		}
	}

	var initClock []int
	initClock = make([]int, nProcesses, nProcesses)
	clockTable = append(clockTable, initClock)
	var msgQueue []int //used to queue messages between processes.

	//Print 1st iteration
	for i := 0; i < nProcesses; i++ {
		fmt.Printf("  P%d", i)
	}
	fmt.Println()
	for j := 1; j <= nProcesses; j++ {
		fmt.Printf("%4d", clockTable[0][j-1])
	}
	fmt.Println()

	//Print other iterations
	for i := 1; i < nIterations; i++ { //first iteration already passed so start from 2nd

		time.Sleep(2000 * time.Millisecond) //sleep to slow the program down

		var temp []int
		temp = make([]int, nProcesses, nProcesses)
		for j := 1; j <= nProcesses; j++ {
			temp[j-1] = clockTable[i-1][j-1] + clockConstants[j-1]
		}
		clockTable = append(clockTable, temp)
		/* generate messages to be sent in every 3rd iteration */
		if (i+1)%3 == 0 {
			var senderID, receiverID int
			r := rand.New(rand.NewSource(time.Now().UTC().UnixNano()))
			senderID = r.Intn(nProcesses)
			receiverID = r.Intn(nProcesses)
			/*if receiver turns out to be same as sender, find new receiver*/
			for receiverID == senderID {
				receiverID = r.Intn(nProcesses)
			}
			msgQueue = append(msgQueue, senderID, receiverID) // add message to queue
			fmt.Printf("Message sent by P%d to P%d at time t=%d at P1.\n", senderID, receiverID, clockTable[i-1][senderID])
		}
		for j := 0; j < nProcesses; j++ { //display clock values
			fmt.Printf("%4d", clockTable[i][j])
		}
		fmt.Println()

		for len(msgQueue) >= 2 {
			var senderID, receiverID int = msgQueue[0], msgQueue[1]
			var sendTime, recTime int = clockTable[i-1][senderID], clockTable[i][receiverID]
			if clockTable[i-1][senderID] >= clockTable[i][receiverID] {
				fmt.Printf("Message received by P%d at time=%d. Since  %d <= %d , we adjust time from %d to %d.\n", receiverID, recTime, recTime, sendTime, recTime, (sendTime + 1))
				for j := 0; j < nProcesses; j++ {
					fmt.Printf("%4d", clockTable[i][j])
				}
				fmt.Printf("  -->") //display changed clock values
				clockTable[i][receiverID] = clockTable[i-1][senderID] + 1
				for j := 0; j < nProcesses; j++ {
					fmt.Printf("%4d", clockTable[i][j])
				}
				fmt.Printf("\n")

			} else {
				fmt.Printf("Message received by P%d at time=%d. Since  %d >= %d , no time adjustment needed.\n", receiverID, recTime, recTime, sendTime)
				for j := 0; j < nProcesses; j++ {
					fmt.Printf("%4d", clockTable[i][j])
				}
				fmt.Printf("  =") //display clock values without change
				for j := 0; j < nProcesses; j++ {
					fmt.Printf("%4d", clockTable[i][j])
				}
				fmt.Printf("\n")
			}
			msgQueue = append(msgQueue[:0], msgQueue[2:]...) //remove sender and receiver from msg queue
			time.Sleep(2000 * time.Millisecond)
		}
	}
}
