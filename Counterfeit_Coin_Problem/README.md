The Counterfeit Coin Problem:
------------------------------

There is a pile of twelve coins, all of equal size. Eleven are of equal weight. One is of a different weight. In three weighings find the unequal coin and determine if it is heavier or lighter.




Written Solution (By Nico Hinderling):
--------------------------------------
For the first weigh, it’s tempting to think you’d do the first 6 vs the last 6, yet the best way to approach it is to do [1, 2, 3, 4] vs [5, 6, 7, 8].

WEIGH #1: [1, 2, 3, 4] vs [5, 6, 7, 8]


1.) If they balance out, we know that the counterfeit coin must be one of the coins in [9, 10, 11, 12]! This is the easier case as now we can weigh [1, 2, 3] vs [9, 10, 11].

CASE 1 WEIGH #2: [1, 2, 3] vs [9, 10, 11]

1.1.) If these two balance out, we know that coin 12 must be the counterfeit one. We can now do our final weigh to see whether it’s heavier or lighter!

CASE 1.1 WEIGH #3: [1] vs [12]

1.1.1.) If 12 is heavier, 12 is the heavy counterfeit!
1.1.2.) If 12 is lighter, than 12 is the light counterfeit!


1.2.) If [9, 10, 11] is heavier than [1, 2, 3], then we know the coin is definitely within [9, 10, 11]! We can now weigh 9 and 10.

CASE 1.2 WEIGH #3: [9] vs [10]

1.2.1.) If they balance out, then we know that 11 is the heavy counterfeit!
1.2.2.) If 9 is heavier, then we know that 9 is the heavy counterfeit!
1.2.3.) If 10 is heavier, then we know that 10 is the heavy counterfeit!


1.3.) If [9, 10, 11] is lighter than [1, 2, 3], then we know the coin is definitely within [9, 10, 11]! We can now weigh 9 and 10.

CASE 1.3 WEIGH #3: [9] vs [10]

1.3.1.) If they balance out, then we know that 11 is the light counterfeit!
1.3.2.) If 9 is lighter, then we know that 9 is the light counterfeit!
1.3.3.) If 10 is lighter, then we know that 10 is the light counterfeit!


2.) If they are unequal, we know that the counterfeit coin must be one of the coins in [1, 2, 3, 4, 5, 6, 7, 8]! Now if [1, 2, 3, 4] was the heavier side, we can proceed by doing the following next weigh:

CASE 2 WEIGH #2: [5, 1, 2] vs [6, 3, 4]

2.1.) If they are equal, then we know the coin has to be either 7 or 8. We can then provide with this:

CASE 2.1 WEIGH #3: [9] vs [7]

2.1.1.) If they balance out, we know that 8 is the light counterfeit!
2.1.2.) If 9 is heavier, we know that 7 is the light counterfeit!


2.2.) If [6, 3, 4] is heavier, then we can simply weigh [3] vs [4]:

CASE 3.2 WEIGH #3: [3] vs [4]

2.2.1.) If they balance out, we know that 5 is the light counterfeit!
2.2.2.) If 3 is heavier, then we know that 3 is the heavy counterfeit!
2.2.3.) If 4 is heavier, then we know that 4 is the heavy counterfeit!


2.3.) If [5, 1, 2] is heavier, then we can simply weigh [1] vs [2]:

CASE 2.2 WEIGH #3: [1] vs [2]

2.3.1.) If they balance out, we know that 6 is the light counterfeit!
2.3.2.) If 1 is heavier, then we know that 1 is the heavy counterfeit!
2.3.3.) If 2 is heavier, then we know that 2 is the heavy counterfeit!


3.) If they are unequal, we know that the counterfeit coin must be one of the coins in [1, 2, 3, 4, 5, 6, 7, 8]! Now if [5, 6, 7, 8] was the heavier side, we can proceed by doing the following next weigh:

CASE 3 WEIGH #2: [1, 5, 6] vs [2, 7, 8]

3.1.) If they are equal, then we know the coin has to be either 3 or 4. We can then provide with this:

CASE 3.1 WEIGH #3: [9] vs [3]

3.1.1.) If they balance out, we know that 4 is the light counterfeit!
3.1.2.) If 9 is heavier, we know that 3 is the light counterfeit!


3.2.) If [2, 7, 8] is heavier, then we can simply weigh [7] vs [8]:

CASE 3.2 WEIGH #3: [7] vs [8]

3.2.1.) If they balance out, we know that 1 is the light counterfeit!
3.2.2.) If 7 is heavier, then we know that 7 is the heavy counterfeit!
3.2.3.) If 8 is heavier, then we know that 8 is the heavy counterfeit!


3.3.) If [1, 5, 6] is heavier, then we can simply weigh [5] vs [6]:

CASE 3.3 WEIGH #3: [5] vs [6]

3.3.1.) If they balance out, we know that 2 is the light counterfeit!
3.3.2.) If 5 is heavier, then we know that 5 is the heavy counterfeit!
3.3.3.) If 6 is heavier, then we know that 6 is the heavy counterfeit!



Possible Case Mappings for Each Coin:
-------------------------------------
Coin 1: Heavy = 2.3.2 || Light = 3.2.1

Coin 2: Heavy = 2.3.3 || Light = 3.3.1

Coin 3: Heavy = 2.2.2 || Light = 3.1.2

Coin 4: Heavy = 2.2.3 || Light = 3.1.1

Coin 5: Heavy = 3.3.2 || Light = 2.2.1

Coin 6: Heavy = 3.3.3 || Light = 2.3.1

Coin 7: Heavy = 3.2.2 || Light = 2.1.2

Coin 8: Heavy = 3.2.3 || Light = 2.1.1

Coin 9: Heavy =  1.2.2|| Light = 1.3.2

Coin 10: Heavy = 1.2.3 || Light = 1.3.3

Coin 11: Heavy = 1.2.1 || Light = 1.3.1

Coin 12: Heavy = 1.1.1 || Light = 1.1.2







There you have it! I hope this was helpful! Feel free to check out my Java and Python implementations for this problem or to contact me: nhinderl@bu.edu
