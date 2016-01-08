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

;; Maven commands
(defun mci ()
  (interactive)
  (compile "mvn clean install"))

(defun mvddu ()
  (interactive)
  (compile "mvn versions:display-dependency-updates"))
  
(defun mdt ()
  (interactive)
  (compile "mvn dependency:tree")) 
  
;; Browse commands
(defun mingle ()
  (interactive)
  (browse-url "https://psprojects.qg.com/projects/qds_development/cards/grid?aggregate_property[column]=nb+points&aggregate_property[row]=nb+points&aggregate_type[column]=sum&aggregate_type[row]=sum&color_by=story+type&filters[mql]=Type+%3D+Story+AND+%28+Milestone+IN+%28SELECT+number+WHERE+type+%3D+Milestone+AND+%27Milestone+Type%27+%3D+%27Strategic%27%29%29+AND+%28%28State+IN+%28%27Development+in+Progress%27%2C+%27Ready+for+Testing%27%2C+Testing%29+OR+State+%3D+Completed+AND+%27Iteration+Completed%27+%3D+%28Current+Iteration%29%29+OR+State+%3D+Scheduled+AND+%27Iteration+Scheduled%27+!%3D+%28Next+Iteration%29%29&group_by[lane]=state&group_by[row]=milestone&lanes=Scheduled%2CTesting%2CCompleted%2CReady+for+Testing%2CDevelopment+in+Progress&tab=Iteration+-+Strategic"))

(defun hudson ()
  (interactive)
  (browse-url "http://psbuilds.qg.com"))

(defun fitnesse ()
  (interactive)
  (browse-url "http://psacceptance.qg.com"))

