;; loaded in init.el
(require 'org)

(use-package org-bullets
  :defer t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'org-mode-hook visual-line-mode-hook)
  (add-to-list 'org-structure-template-alist '("r" . "src rust
"))
  (add-to-list 'org-structure-template-alist '("j" . "src json
")))
