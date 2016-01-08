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

(defun tape-single (artifact)
  (interactive "sEnter an artifact: ")
  (let ((buffer (empty-buffer "*TAPE*"))
        (command (concat  "tape-single " artifact)))
    (populate-buffer buffer
     (concat artifact "\n" (shell-command-to-string command)))))
