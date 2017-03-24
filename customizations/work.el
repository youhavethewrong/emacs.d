(defun prop-search (term)
  (interactive "sEnter value: ")
  (place-search term "~/sandbox/processor-properties/"))

(defun flow-search (term)
  (interactive "sEnter value: ")
  (place-search term "~/sandbox/serviceflow/src/main/resouces/serviceFlow.xml"))

(defun flow-browse ()
  (interactive)
  (find-file "~/sandbox/serviceflow/src/main/resources/serviceFlow.xml"))

(defun flow-search ()
  (interactive)
  (service-flow)
  (isearch-forward))

;; For Velocity templates
(require 'vtl)
(add-to-list 'auto-mode-alist '("\\.vm$" . turn-on-vtl-mode))
