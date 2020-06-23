{:user {:plugins [[cider/cider-nrepl "0.25.0"]
                  [jonase/eastwood "0.3.5" :exclusions [org.clojure/clojure]]
                  [lein-kibit "0.1.6" :exclusions [org.clojure/clojure]]
                  [lein-cljfmt "0.6.1"]
                  [venantius/ultra "0.6.0"]
                  [lein-eftest "0.5.7"]
                  [lein-create-template "0.2.0"]]
        :middleware [whidbey.plugin/repl-pprint
                     ultra.plugin/middleware
                     cider-nrepl.plugin/middleware]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :dependencies [[jonase/eastwood "0.3.5" :exclusions [org.clojure/clojure]]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [compliment "0.3.8"]
                       [lein-cljfmt "0.6.1"]
                       [lein-kibit "0.1.6" :exclusions [org.clojure/clojure]]
                       [org.clojure/tools.namespace "0.2.11"]
                       [pjstadig/humane-test-output "0.8.3"] ]}}
