;; ROT13 ciphering algorithm implementation
;; Based on ../../Lua/Yonaba/rot13.lua
;; See: http://en.wikipedia.org/wiki/ROT13

;; Returns the ASCII bytecode of either 'a' or 'A'
(local a_byte (string.byte :a))
(local A_byte (string.byte :A))
(local ascii_base (fn [ch]
  (if (= (string.lower ch) ch) a_byte A_byte)))

(local caesar_cipher_ch (fn [key] (fn [ch]
  (let [base (ascii_base ch)
        offset (% (+ (- (string.byte ch) base) key) 26)]
    (string.char (+ offset base))))))

;; ROT13 is based on Caesar ciphering algorithm, using 13 as a key
(local caesar_cipher (fn [key str]
  (string.gsub str "%a" (caesar_cipher_ch key))))

{
  :cipher (partial caesar_cipher 13)

  :decipher (partial caesar_cipher -13)
}
