⍝ Standard way to calculate the Euclidean distance
⍝ (As the sqrt of the sum of the square difference)
euclidean_distance ← {
   (+/(⍺ - ⍵) * 2) * ÷ 2
}
