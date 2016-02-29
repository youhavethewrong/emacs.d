(require 'mike)

(defun lein-build ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "project.clj")))
    (compile (concat "lein do clean, test, install"))))

(defvar lein-grep-history nil)
(defun lein-grep (term)
  (interactive
   (list
    (let* ((default-term (car lein-grep-history))
           (prompt (if (s-blank? default-term)
                     "Search for: "
                     (concat "Search string (default \"" default-term "\"): ")))
           (input (read-from-minibuffer prompt nil nil nil 'lein-grep-history)))
      (if (s-blank? input) default-term input))))
  (in-project
   (lambda (d)
     (grep (concat "grep --color --exclude-dir=.git --exclude-dir=target -nriH -e \"" term "\" " d)))))
