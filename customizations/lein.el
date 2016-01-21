(require 'mike)

;; TODO: Make it work
(defun lein-build ()
  (interactive)
  (let ((default-directory (find-containing-directory-upwards "project.clj")))
    (compile (concat "lein clean install"))))
