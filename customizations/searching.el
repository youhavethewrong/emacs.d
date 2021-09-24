;; Make the default grep command be recursive, case-insensitive, and
;; avoid annoying directories.
(defvar colorful-grep "grep --color --exclude-dir=.git --exclude-dir=target --exclude-dir=node_modules -nriH -e ")
(setq grep-command colorful-grep)

(defun place-search (term target)
  (grep (concat colorful-grep term " " target)))

(defun parent-directory (dir)
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))

(defun find-file-upwards (current-dir file-name)
  (let ((file (concat current-dir file-name))
        (parent-dir (parent-directory (expand-file-name current-dir))))
    (if (file-exists-p file)
        file
      (when parent-dir
        (find-file-upwards parent-dir file-name)))))

(defun find-containing-directory-upwards (file-name)
  (let ((file-path (find-file-upwards (buffer-file-name) file-name)))
    (when file-path
      (parent-directory file-path))))

;; Maven build tool
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

;; Leiningen build tool
(defun lein-in-project (f)
  (let ((default-directory (find-containing-directory-upwards "project.clj")))
    (if default-directory
      (funcall f default-directory)
      (error "Not inside a Leiningen project!"))))

(defun lein-build ()
  (interactive)
  (lein-in-project (lambda (d) (compile (concat "lein do clean, test, install")))))

(defun lein-tree ()
  (interactive)
  (lein-in-project (lambda (d) (compile (concat "lein do clean, pom; mvn -Dverbose=true dependency:tree")))))

(defun lein-updates ()
  (interactive)
  (lein-in-project (lambda (d) (compile (concat "lein ancient")))))

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

;; NPM build tool
(defun npm-in-project (f)
  (let ((default-directory (find-containing-directory-upwards "package.json")))
    (if default-directory
      (funcall f default-directory)
      (error "Not inside an NPM project!"))))

(defvar npm-grep-history nil)

(defvar search-tool
  (if (executable-find "rg")
      "rg -i -H --no-heading -g '!node_modules' -g !'*.json' -g !'*.css' -g !'*.scss' -e \""
    "grep --color --exclude-dir=.git --exclude-dir=public --exclude-dir=build --exclude-dir=reference --exclude-dir=resources --exclude-dir=coverage --exclude-dir=node_modules -nriH -e \""))

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
     (grep (concat search-tool term "\" " d)))))
