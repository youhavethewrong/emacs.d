(require 'mike)

(defun mvn-in-project (f)
  (let ((default-directory (find-containing-directory-upwards "pom.xml")))
    (if default-directory
      (funcall f default-directory)
      (error "Not inside a Maven project!"))))

(defun mvn-build ()
  (interactive)
  (mvn-in-project (lambda (d) (compile "mvn -B clean install"))))

(defun mvn-updates ()
  (interactive)
  (mvn-in-project (lambda (d) (compile "mvn -B versions:display-dependency-updates"))))

(defun mvn-tree ()
  (interactive)
  (mvn-in-project (lambda (d) (compile "mvn -B dependency:tree"))))

(defun mvn-tree-verbose ()
  (interactive)
  (mvn-in-project (lambda (d) (compile "mvn -B dependency:tree -Dverbose=true"))))

(defun mvn-all-tests ()
  (interactive)
  (mvn-in-project
   (lambda (d) (compile "mvn -B test"))))

(defun mvn-suite ()
  (interactive)
  (mvn-in-project
   (lambda (d)
     (let ((test-name (file-name-base (buffer-file-name))))
       (compile (concat "mvn -B -Dtest=" test-name " test"))))))

(defun mvn-clojure-test ()
  (interactive)
  (mvn-in-project
   (lambda (d)
     (compile "mvn -B compile && mvn clojure:test"))))

(defun mvn-compile ()
  (interactive)
  (mvn-in-project
   (lambda (d)
     (compile (concat "mvn -B compile")))))

(defvar mvn-test-history nil)
(defun mvn-test (test)
  (interactive
   (list
    (let* ((default-term (thing-at-point 'symbol))
           (prompt (if (s-blank? default-term)
                     "Run test: "
                     (concat "Run test (default \"" default-term "\"): ")))
           (input (read-from-minibuffer prompt nil nil nil 'mvn-test-history)))
      (if (s-blank? input) default-term input))))
  (mvn-in-project
   (lambda (d)
     (let ((test-name (file-name-base (buffer-file-name))))
       (compile (concat "mvn -B -Dtest=" test-name "#" test " test"))))))

(defvar mvn-grep-history nil)
(defun mvn-grep (term)
  (interactive
   (list
    (let* ((default-term (car mvn-grep-history))
           (prompt (if (s-blank? default-term)
                     "Search for: "
                     (concat "Search string (default \"" default-term "\"): ")))
           (input (read-from-minibuffer prompt nil nil nil 'mvn-grep-history)))
      (if (s-blank? input) default-term input))))
  (mvn-in-project
   (lambda (d)
     (grep (concat "grep --color --exclude-dir=.git --exclude-dir=target --exclude-dir=node_modules -nriH -e \"" term "\" " d)))))
