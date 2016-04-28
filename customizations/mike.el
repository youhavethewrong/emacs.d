(provide 'mike)

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
