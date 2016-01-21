;; TODO: Remember last command!
(defun gosling (args)
  (interactive "sEnter args: ")
  (shell-command (concat "gosling " args)))

(defun gosling-region ()
  (interactive)
  (shell-command (concat "gosling " (buffer-substring (region-beginning) (region-end)))))
