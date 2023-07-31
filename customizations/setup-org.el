(use-package org
  :init
  (setq org-adapt-indentation nil)
  (setq org-edit-src-content-indentation 0)
  :config
  (add-to-list 'org-structure-template-alist '("r" . "src rust
"))
  (add-to-list 'org-structure-template-alist '("j" . "src json
")))

(use-package org-bullets
  :defer t
  :hook (org-mode . org-bullets-mode))

;; Read this in from a file eventually - use blank for 'other'
(defvar maintenance-completions '("" "1989 Ranch House" "2022 Aprilia Tuono 660 Factory" "2017 Subaru Outback"))

(defun esc/choose-maint-item ()
  "Read in a durable good from the user."
  (interactive)
  (let ((choice (completing-read "Choose: " maintenance-completions nil t)))
    choice))

(defun esc/dated-template (choice-fn-string)
  (concat (format "\n* %s \n** "
                  (format-time-string "%B %e, %Y"))
          " "
          choice-fn-string
          "%?"))

(setq org-capture-templates
      '(
        ("m" "Maintenance" entry (file "~/lab-journal/maintenance.org")
         (function (lambda () (esc/dated-template "%(esc/choose-maint-item)")))
         )
        ("f" "Fitness" entry (file "~/lab-journal/fitness.org")
         (function (lambda () (esc/dated-template "")))
         )
        ))
