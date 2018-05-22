; Tests for rot13.lua
(table.insert (or package.searchers package.loaders) (. (require :fennel) :searcher))
(local rot13 (require :rot13))

(var (total pass) (values 0 0))

(local dec (fn [str len]
  (local strlen (# str))
  (if (< strlen len)
    (.. str (: '.' :rep (- len strlen)))
    (: str :sub 1 len))))

(local run (fn [msg f]
  (set total (+ 1 total))
  (local (ok err) (pcall f))
  (when ok (set pass (+ 1 pass)))
  (local status (if ok "PASSED" "FAILED"))
  (print (: "%02d. %68s: %s" :format total (dec msg 68) status))))

(run "Ciphering test" (fn []
  (assert (= (rot13.cipher "abcd") "nopq"))
  (assert (= (rot13.cipher "WXYZ") "JKLM"))
  (assert (= (rot13.cipher "abcdefghijklmnopqrstuvwxyz") "nopqrstuvwxyzabcdefghijklm"))
  (assert (= (rot13.cipher "ABCDEFGHIJKLMNOPQRSTUVWXYZ") "NOPQRSTUVWXYZABCDEFGHIJKLM"))))

(run "Deciphering test" (fn []
  (assert (= (rot13.decipher "nopq") "abcd"))
  (assert (= (rot13.cipher "WXYZ") "JKLM"))
  (assert (= (rot13.cipher "nopqrstuvwxyzabcdefghijklm") "abcdefghijklmnopqrstuvwxyz"))
  (assert (= (rot13.cipher "NOPQRSTUVWXYZABCDEFGHIJKLM") "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))))

(print (: "-" :rep 80))
(print (: "Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%" :format
  total pass (- total pass) (/ (* pass 100) total)))
