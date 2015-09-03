(ns fizzbuzz.core)

(defn divisible? [number m]
  (zero? (mod number m)))

(defn may-say [word number m]
  (when (divisible? number m) word))

(defn fizzbuzz [number]
  (let [word (str (may-say "fizz" number 3) (may-say "buzz" number 5))]
    (if (empty? word) number word)))

(defn fizzbuzz-seq [upto]
  (map fizzbuzz (range 1 upto)))
