(ns fizzbuzz.core-test
  (:require [clojure.test :refer :all]
            [fizzbuzz.core :as fb]))

(deftest fizzbuzz-test
  (testing "it returns the number for normal numbers"
    (is (= 1 (fb/fizzbuzz 1)))
    (is (= 2 (fb/fizzbuzz 2)))
    (is (= 98 (fb/fizzbuzz 98))))
  (testing "it returns 'fizz' if the number is divisible by 3"
    (is (= "fizz" (fb/fizzbuzz 3)))
    (is (= "fizz" (fb/fizzbuzz 99))))
  (testing "it returns 'buzz' if the number is divisible by 5"
    (is (= "buzz" (fb/fizzbuzz 5)))
    (is (= "buzz" (fb/fizzbuzz 85))))
  (testing "it returns 'fizzbuzz' if the number is divisible by 3 and 5"
    (is (= "fizzbuzz" (fb/fizzbuzz 15)))
    (is (= "fizzbuzz" (fb/fizzbuzz 45)))))

(deftest fizzbuzz-seq-test
  (testing "it returns a list of fizzbuzzes upto the given number"
    (is (= [1 2 "fizz" 4 "buzz"]
           (fb/fizzbuzz-seq 6)))
    (is (= [1 2 "fizz" 4 "buzz" "fizz" 7 8 "fizz" "buzz"]
           (fb/fizzbuzz-seq 11)))
    (is (= ["buzz" 19 "fizz" 17 16 "fizzbuzz" 14 13 "fizz" 11]
           (take 10 (reverse (fb/fizzbuzz-seq 21)))))))
