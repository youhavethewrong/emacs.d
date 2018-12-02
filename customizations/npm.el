(require 'mike)

(defun npm-in-project (f)
  (let ((default-directory (find-containing-directory-upwards "package.json")))
    (if default-directory
      (funcall f default-directory)
      (error "Not inside an NPM project!"))))

(defvar npm-grep-history nil)
(defun npm-grep (term)
  (interactive
   (list
    (let* ((default-term (car npm-grep-history))
           (prompt (if (s-blank? default-term)
                     "Search for: "
                     (concat "Search string (default \"" default-term "\"): ")))
           (input (read-from-minibuffer prompt nil nil nil 'npm-grep-history)))
      (if (s-blank? input) default-term input))))
  (npm-in-project
   (lambda (d)
     (grep (concat "grep --color --exclude-dir=.git --exclude-dir=public --exclude-dir=build --exclude-dir=reference --exclude-dir=resources --exclude-dir=coverage --exclude-dir=node_modules -nriH -e \"" term "\" " d)))))
