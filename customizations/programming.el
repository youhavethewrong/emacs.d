(use-package idle-highlight-mode
  :defer t
  :init
  (add-hook 'prog-mode-hook 'idle-highlight-mode))

(use-package rainbow-delimiters
  :defer t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package column-marker
  :defer t
  :config
  (add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-3 100))))

(use-package magit
  :defer t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"))

(use-package string-inflection
  :config
  (global-set-key (kbd "C-c C-u") 'string-inflection-all-cycle))

(use-package lsp-mode
  :hook
  (rust-mode . lsp)
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package company-lsp :commands company-lsp)

;; .m is for octave, not ObjC
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; make java indentation friendly
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4)))

;; subword hopping is nice
(add-hook 'java-mode-hook 'subword-mode)
