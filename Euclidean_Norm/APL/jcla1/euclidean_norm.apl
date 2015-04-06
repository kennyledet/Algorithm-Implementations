⍝ This version works by computing the sum of the squares in ⍵
⍝ and then finding the square root.
euclidean_norm ← {
  (+/⍵ × ⍵) * ÷ 2
}

⍝ As the name suggests, this version computes the dot product
⍝ of ⍵, then finds the square root.
euclidean_norm_dot_product ← {
  (⍵ +.× ⍵) * ÷ 2
}