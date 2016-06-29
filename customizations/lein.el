(require 'mike)

(defun lein-in-project (f)
  (let ((default-directory (find-containing-directory-upwards "project.clj")))
    (if default-directory
      (funcall f default-directory)
      (error "Not inside a Leiningen project!"))))

(defun lein-build ()
  (interactive)
  (lein-in-project (lambda (d) (compile (concat "lein do clean, test, install")))))

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
  (lein-in-project
   (lambda (d)
     (grep (concat "grep --color --exclude-dir=.git --exclude-dir=target -nriH -e \"" term "\" " d)))))
