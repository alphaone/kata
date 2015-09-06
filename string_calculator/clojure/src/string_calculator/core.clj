(ns string-calculator.core)

(defn determine-delimiter [s]
  (if (.startsWith s "//")
    (re-pattern (second (re-find #"//(.*)\n" s)))
    #",|\n"))

(defn skip-delimiter-definition [s]
  (if (.startsWith s "//")
    (second (clojure.string/split s #"\n" 2))
    s))

(defn check-for-negatives [arguments]
  (let [negatives (filter (fn [x] (.startsWith x "-")) arguments)]
    (if-not (empty? negatives)
      (throw (RuntimeException.
               (str "negatives not allowed: "
                    (clojure.string/join ", " negatives)))))))

(defn sum-up-arguments [arguments]
  (check-for-negatives arguments)
  (->> arguments
       (map read-string)
       (apply +)))

(defn string-add-with-delimiter [d s]
  (if (empty? s)
    0
    (sum-up-arguments (clojure.string/split s d))))

(defn string-add [s]
  (string-add-with-delimiter
    (determine-delimiter s)
    (skip-delimiter-definition s)))
