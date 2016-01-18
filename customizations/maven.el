(defun empty-buffer (buffer-name)
  (if (get-buffer buffer-name)
      (get-buffer buffer-name)
    (generate-new-buffer buffer-name)))

(defun populate-buffer (buffer content)
  (set-buffer buffer)
  (erase-buffer)
  (insert content)
  (display-buffer buffer))

(defun shell-command-to-buffer (command buffer-name)
  (let ((buffer (empty-buffer buffer-name)))
    (populate-buffer (shell-command-to-string command))))

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

(defun mvn-build ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "pom.xml")))
    (compile (concat "mvn clean install"))))

(defun mvn-tree ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "pom.xml")))
    (compile (concat "mvn dependency:tree")))) 

(defun mvn-updates ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "pom.xml")))
    (compile (concat "mvn versions:display-dependency-updates"))))

(defun mvn-suite ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "pom.xml"))
        (test-name (file-name-base (buffer-file-name))))
    (compile (concat "mvn -Dtest=" test-name " test"))))

(defun mvn-test ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "pom.xml"))
        (test-name (file-name-base (buffer-file-name))))
    (compile (concat "mvn -Dtest=" test-name "#" (thing-at-point 'word) " test"))))

(defun mvn-grep (term)
  (interactive "sEnter value: ")
  (let ((default-directory (find-containing-directory-upwards "pom.xml")))
    (grep (concat "grep --color --exclude-dir=.git --exclude-dir=target -nriH -e " term " " default-directory))))
