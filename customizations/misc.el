(require 'mike)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Tell magit we know about the auto revert mode
(setq magit-last-seen-setup-instructions "1.4.0")

;; Default grep command
(setq grep-command "grep --color --exclude-dir=.git --exclude-dir=target -nriH -e ")

;; Miscellaneous functions
(defun place-search (term target)
  (grep (concat "grep --color -nriH -e " term " " target)))

(defun prop-search (term)
  (interactive "sEnter value: ")
  (place-search term "~/sandbox/processor-properties/"))

(defun tom-search (term)
  (interactive "sEnter value: ")
  (place-search term "~/sandbox/tomcatxmlconfig/"))

(defun flow-search (term)
  (interactive "sEnter value: ")
  (place-search term "~/sandbox/serviceflow/src/main/resouces/serviceFlow.xml"))

(defun dev-browse (k)
  (interactive
   (list (completing-read
          "Choose a destination: "
          '(("hudson" 1) ("builds" 2) ("mingle" 3) ("strategic" 4)
            ("tactical" 5) ("releases" 6) ("nexus" 7) ("red" 8) ("yellow" 9)
            ("white" 10)))))
  (browse-url
   (pcase k
     ("hudson" "http://psbuilds.qg.com")
     ("builds" "http://psbuilds.qg.com")
     ("mingle" "http://psprojects.qg.com")
     ("strategic" "https://psprojects.qg.com/projects/qds_development/cards/grid?aggregate_property[column]=nb+points&aggregate_property[row]=nb+points&aggregate_type[column]=sum&aggregate_type[row]=sum&color_by=story+type&filters[mql]=Type+%3D+Story+AND+%28+Milestone+IN+%28SELECT+number+WHERE+type+%3D+Milestone+AND+%27Milestone+Type%27+%3D+%27Strategic%27%29%29+AND+%28%28State+IN+%28%27Development+in+Progress%27%2C+%27Ready+for+Testing%27%2C+Testing%29+OR+State+%3D+Completed+AND+%27Iteration+Completed%27+%3D+%28Current+Iteration%29%29+OR+State+%3D+Scheduled+AND+%27Iteration+Scheduled%27+!%3D+%28Next+Iteration%29%29&group_by[lane]=state&group_by[row]=milestone&lanes=Scheduled%2CTesting%2CCompleted%2CReady+for+Testing%2CDevelopment+in+Progress&tab=Iteration+-+Strategic")
     ("tactical" "https://psprojects.qg.com/projects/qds_development/cards/grid?aggregate_property[column]=nb+points&aggregate_property[row]=nb+points&aggregate_type[column]=sum&aggregate_type[row]=sum&color_by=story+type&filters[mql]=Type+%3D+Story+AND+%28+Milestone+IN+%28SELECT+number+WHERE+type+%3D+Milestone+AND+%27Milestone+Type%27+%3D+%27Tactical%27%29+or+MILESTONE+is+NULL%29+AND+%28%28State+IN+%28%27Scheduled%27%2C+%27Development+in+progress%27%2C+%27Ready+for+testing%27%2C+Testing%29+OR+State+IN+%28Completed%29+AND+%27Iteration+Completed%27+%3D+%28Current+Iteration%29%29+AND+%27Iteration+Scheduled%27+!%3D+%28Next+Iteration%29+%29&group_by[lane]=state&group_by[row]=epic&lanes=Scheduled%2CTesting%2CCompleted%2CReady+for+Testing%2CDevelopment+in+Progress&tab=Iteration+-+Tactical")
     ("releases" "https://psprojects.qg.com/projects/qds_development/cards/tree?columns=Release+Date&expands=1494%2C12160&tab=Releases+-+Pending&tf_release[]=[Release+Date][is+greater+than][%28today%29]&tf_release[]=[Release+Date][is][%28today%29]&tf_release[]=[Release+Date][is][]&tree_name=Releases")
     ("nexus" "http://psartifacts.qg.com/nexus")
     ("red" "http://qdsred.qg.com")
     ("yellow" "http://qdsyellow.qg.com")
     ("white" "http://wwwqds.qg.com"))))

(defun flow-browse ()
  (interactive)
  (find-file "~/sandbox/serviceflow/src/main/resources/serviceFlow.xml"))

(defun flow-search ()
  (interactive)
  (service-flow)
  (isearch-forward))

(defun println-grep ()
  (interactive)
  (grep "grep -inr --color --exclude-dir=\"target\" --exclude-dir=\"node_modules\" --include=*.{clj,cljc,cljs,java,groovy} \"println\" ."))

(defun kill-repl-buffers ()
  (interactive)
  (kill-matching-buffers "cider")
  (kill-matching-buffers "nrepl"))
