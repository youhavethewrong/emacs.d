(use-package org
  :init
  (setq org-adapt-indentation nil)
  :config
  (add-to-list 'org-structure-template-alist '("r" . "src rust
"))
  (add-to-list 'org-structure-template-alist '("j" . "src json
")))

(use-package org-bullets
  :defer t
  :hook (org-mode . org-bullets-mode))
