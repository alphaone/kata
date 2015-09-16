(ns bowling.core)

(defn spare? [rolls]
  (= 10 (reduce + (take 2 rolls))))

(defn strike? [rolls]
  (= 10 (first rolls)))

(defn take-as-many-rolls-as-needed-for-scoring [rolls]
  (let [n (if (or (strike? rolls) (spare? rolls)) 3 2)]
    (take n rolls)))

(defn drop-as-many-rolls-as-needed [rolls]
  (let [n (if (strike? rolls) 1 2)]
    (drop n rolls)))

(defn make-frames [rolls]
  (lazy-seq (cons (take-as-many-rolls-as-needed-for-scoring rolls)
                  (make-frames (drop-as-many-rolls-as-needed rolls)))))

(defn make-game [rolls]
  (take 10 (make-frames rolls)))

(defn calculate-frame-score [frame_rolls]
  (reduce + frame_rolls))

(defn calculate-game-score [frame_scores]
  (reduce + frame_scores))

(defn score [rolls]
  (calculate-game-score (map calculate-frame-score (make-game rolls))))
