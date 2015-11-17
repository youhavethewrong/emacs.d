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
