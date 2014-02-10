⍝ This function takes a vector of "0" and "1" (without quotes) as a right formal parameter
⍝ and the maximum fibonacci value to go up to as the left formal parameter.
⍝ It return a vector of fibonacci terms less than the left formal parameter.
fib ← {
   ¯1↑⍵<⍺:⍺ fib (⍵,+/¯2↑⍵)
   ¯1↓⍵
}

