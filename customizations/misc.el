;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Default grep command
(setq grep-command "grep --color --exclude-dir=.git --exclude-dir=target -nriH -e ")

;; Miscellaneous functions
(defun place-search (term target)
  (grep (concat "grep --color -nriH -e " term " " target)))
