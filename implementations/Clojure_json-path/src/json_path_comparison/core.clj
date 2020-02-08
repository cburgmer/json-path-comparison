(ns json-path-comparison.core
  (:require [cheshire.core :as j]
            json-path)
  (:gen-class))

(defn -main [& args]
  (let [path (first args)
        in (slurp *in*)
        json (j/parse-string in true)]
    (try
      (println (j/generate-string (json-path/at-path path json)))
      (catch Exception e
        (do (println (.getClass e) (.getMessage e))
            (System/exit 1))))))
