(ns bowling.core-test
  (:require [clojure.test :refer :all]
            [bowling.core :as b]))

(deftest ^:unit scoring-test
  (testing "it returns 0 for a gutter game"
    (is (= 0
           (b/score (repeat 20 0)))))
  (testing "it returns 20 for a series of 2 pin frames"
    (is (= 20
           (b/score (repeat 20 1)))))
  (testing "it adds the next roll as a bonus after a spare"
    (is (= 20
           (b/score (concat '(5 5) '(3 4) (repeat 16 0))))))
  (testing "it adds the next two rolls as a bonus after a strike"
    (is (= 24
           (b/score (concat '(10) '(3 4) (repeat 16 0))))))
  (testing "the perfect game"
    (is (= 300
           (b/score (repeat 12 10))))))

(deftest ^:unit spare-test
  (testing "it knows what a spare is"
    (is (= true
           (b/spare? '(5 5))
           (b/spare? '(5 5 1))))
    (is (= false
           (b/spare? '(5 4))
           (b/spare? '(5 4 1))))))

(deftest ^:unit strike-test
  (testing "it knows what a spare is"
    (is (= true
           (b/strike? '(10))
           (b/strike? '(10 1))))
    (is (= false
           (b/strike? '(9 1))
           (b/strike? '(9 1 1))
           (b/strike? '(8 1 1))))))