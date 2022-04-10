;; loaded in init.el
;; better than ido, helm, ivy, etc.
(use-package selectrum
  :config
  (selectrum-mode +1))

;; line numbers are usually nice
(use-package linum-off
  :init
  (setq linum-disabled-modes-list '(eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode pdf-view-mode markdown-mode))
  :config
  (global-linum-mode))

;; TODO, add a toggle for tabs because I need them sometimes
;; Don't use literal tabs
(setq-default indent-tabs-mode nil)

;; put all backups in ~/.emacs.d/backups rather than scattered around
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
;; don't auto save
(setq auto-save-default nil)

;; split side-by-side almost always
(setq split-width-threshold 160)
(setq split-height-threshold 80)

;; nice keybindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-n") 'scroll-up-command)
(global-set-key (kbd "M-p") 'scroll-down-command)

(use-package saveplace
  :init
  (setq-default save-place-mode t)
  (setq save-place-file (concat user-emacs-directory "places")))

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Sometimes we have to preserve trailing whitespace
(defun toggle-delete-trailing-whitespace ()
  (interactive)
  (if (member 'delete-trailing-whitespace before-save-hook )
    (progn
      (remove-hook 'before-save-hook 'delete-trailing-whitespace)
      (message "Hook removed."))
    (progn
      (add-hook 'before-save-hook 'delete-trailing-whitespace)
      (message "Hook added."))))
