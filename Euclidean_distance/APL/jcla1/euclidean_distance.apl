⍝ Standard way to calculate the Euclidean distance
⍝ (As the sqrt of the sum of the square difference)
euclidean_distance ← {
   (+/(⍺ - ⍵) * 2) * ÷ 2
}

⍝ Using the Euclidean Norm to calculate the distance.
⍝ Since the distance between 2 Points is only the length of the difference.
euclidean_distance_via_norm ← {
   euclidean_norm ⍺ - ⍵
}

⍝ This function is only used in one calculation of the euclidean distance
⍝ You can find it here: https://github.com/kennyledet/Algorithm-Implementations/blob/master/Euclidean_Norm/APL/jcla1/euclidean_norm.apl
euclidean_norm ← {
  (+/⍵ × ⍵) * ÷ 2
}