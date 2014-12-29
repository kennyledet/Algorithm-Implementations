__author__ = "Nico Hinderling"
__email__ = "nhinderl@bu.edu"
__site__ = "nicohinderling.me"

'''
I wrote out an explanation in the README, yet just in case:
Another useful resource to understand the logic:
    http://mathforum.org/library/drmath/view/55618.html

I hope this helps!
'''

import random
#============Set up============#
counterfeit = random.randint(0,11)
counterValue = random.randint(0,1)
coins = [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
coins[counterfeit] = 2 + 2*(counterValue)
coinLocation = 0
weight = "?"

#============Case Explanation============#
#Uncomment to check with original values
'''
if(counterValue == 0):
    print("The counterfeit value is " + str(counterfeit) + " and Lighter \n")
else:
    print("The counterfeit value is " + str(counterfeit) + " and Heavier \n")
print(str(coins) +  "\n")
'''

#============Solution============#
#First Weighing Groups
w1groupA = coins[0] + coins[1] + coins[2] + coins[3]
w1groupB = coins[4] + coins[5] + coins[6] + coins[7]
#Second Weighing Groups
w2groupA = coins[0] + coins[1] + coins[2]
w2groupB = coins[8] + coins[9] + coins[10]
w2groupC = coins[0] + coins[4] + coins[5]
w2groupD = coins[1] + coins[6] + coins[7]
w2groupE = coins[4] + coins[0] + coins[1]
w2groupF = coins[5] + coins[2] + coins[3]

#====Logic====#
if(w1groupA == w1groupB):               #Weigh One
    if(w2groupA == w2groupB):               #Weigh Two
        if(coins[11] > coins[0]):               #Weigh Three
            coinLocation = 11
            weight = "Heavier"
        else:                                   #Weigh Three
            coinLocation = 11
            weight = "Lighter"
    elif(w2groupA < w2groupB):              #Weigh Two
        if(coins[8] == coins[9]):               #Weigh Three
            coinLocation = 10
            weight = "Heavier"
        elif(coins[8] > coins[9]):              #Weigh Three
            coinLocation = 8
            weight = "Heavier"
        else:                                   #Weigh Three
            coinLocation = 9
            weight = "Heavier"
    else:                                   #Weigh Two
        if(coins[8] == coins[9]):               #Weigh Three
            coinLocation = 10
            weight = "Lighter"

        elif(coins[8] < coins[9]):              #Weigh Three
            coinLocation = 8
            weight = "Lighter"
        else:                                   #Weigh Three
            coinLocation = 9
            weight = "Lighter"

elif(w1groupA < w1groupB):              #Weigh One
    if(w2groupC == w2groupD):               #Weigh Two
        if(coins[8] == coins[2]):               #Weigh Three
            coinLocation = 3
            weight = "Lighter"
        else:                                   #Weigh Three
            coinLocation = 2
            weight = "Lighter"
    elif(w2groupC < w2groupD):              #Weigh Two
        if(coins[6] == coins[7]):               #Weigh Three
            coinLocation = 0
            weight = "Lighter"
        elif(coins[6] > coins[7]):              #Weigh Three
            coinLocation = 6
            weight = "Heavier"
        else:                                   #Weigh Three
            coinLocation = 7
            weight = "Heavier"
    else:                                   #Weigh Two
        if(coins[4] == coins[5]):               #Weigh Three
            coinLocation = 1
            weight = "Lighter"
        elif(coins[4] > coins[5]):              #Weigh Three
            coinLocation = 4
            weight = "Heavier"
        else:                                   #Weigh Three
            coinLocation = 5
            weight = "Heavier"
else:                                   #Weigh One
    if(w2groupE == w2groupF):               #Weigh Two
        if(coins[8] == coins[6]):               #Weigh Three
            coinLocation = 7
            weight = "Lighter"
        else:                                   #Weigh Three
            coinLocation = 6
            weight = "Lighter"
    elif(w2groupE < w2groupF):              #Weigh Two
        if(coins[2] == coins[3]):               #Weigh Three
            coinLocation = 4
            weight = "Lighter"
        elif(coins[2] > coins[3]):              #Weigh Three
            coinLocation = 2
            weight = "Heavier"
        else:                                   #Weigh Three
            coinLocation = 3
            weight = "Heavier"
    else:                                   #Weigh Two
        if(coins[0] == coins[1]):               #Weigh Three
            coinLocation = 5
            weight = "Lighter"
        elif(coins[0] > coins[1]):              #Weigh Three
            coinLocation = 0
            weight = "Heavier"
        else:                                   #Weigh Three
            coinLocation = 1
            weight = "Heavier"

#============Test============#

if(counterValue == 0 and weight == "Lighter" and counterfeit == coinLocation):
    print("Correct! The Counterfeit Coin is Coin " + str(coinLocation) + " and is " + str(weight))
elif(counterValue == 1 and weight == "Heavier" and counterfeit == coinLocation):
    print("Correct! The Counterfeit Coin is Coin " + str(coinLocation) + " and is " + str(weight))
else:
    print("Index is " + str(coinLocation))
    print("Weight is " + str(weight))
    print("Case " + str(case))