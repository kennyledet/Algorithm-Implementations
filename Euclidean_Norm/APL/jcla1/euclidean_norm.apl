⍝ This version works by computing the sum of the squares in ⍵
⍝ and then finding the square root.
euclidean_norm ← {
  (+/⍵ × ⍵) * ÷ 2
}