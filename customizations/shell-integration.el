;; Use shell PATH if running in a GUI frame on OSX or Linux
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :init
  (exec-path-from-shell-initialize))
