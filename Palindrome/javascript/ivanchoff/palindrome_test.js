const isPalindrome = require('./palindrome');

let tests = ["hello", "world", "anna", "alula"];

tests.forEach((word) => {
  let ans = (isPalindrome(word))? 'Yes':'No';
  console.log(`The Word '${word}' is Palindrome? - ${ans}`);
});
