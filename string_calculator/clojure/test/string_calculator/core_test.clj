(ns string-calculator.core-test
  (:require [clojure.test :refer :all]
            [string-calculator.core :as sc]))

(deftest string-calculator-test
  (testing "returns 0 on empty argurments"
    (is (= 0 (sc/string-add ""))))
  (testing "returns same number if just one argument given"
    (is (= 2 (sc/string-add "2")))
    (is (= 0 (sc/string-add "0")))
    (is (= 9999 (sc/string-add "9999"))))
  (testing "returns the sum of two arguments"
    (is (= 3 (sc/string-add "1,2"))))
  (testing "returns the sum of unknown amount of arguments"
    (is (= 15 (sc/string-add "1,2,3,4,5"))))
  (testing "separators can be newlines too"
    (is (= 15 (sc/string-add "1\n2,3\n4,5"))))
  (testing "separators can be specified in optional first line"
    (is (= 6 (sc/string-add "//:\n1:2:3"))))
  (testing "negatives should throw an exception"
    (is (thrown-with-msg? RuntimeException #"negatives not allowed" (sc/string-add "1,-2"))))
  (testing "negatives should be mentioned in exception"
    (is (thrown-with-msg? RuntimeException #"-2, -3" (sc/string-add "1,-2,-3")))))
