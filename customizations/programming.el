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
  :config
  (setq lsp-prefer-flymake nil)
  :hook
  (rust-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :requires lsp-mode flycheck
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode 1)
  (global-set-key (kbd "C-<tab>") 'company-complete))

(use-package company-lsp
  :requires company
  :config
  (push 'company-lsp company-backends)

   ;; Disable client-side cache because the LSP server does a better job.
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

;; .m is for octave, not ObjC
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

;; make java indentation friendly
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4)))

;; subword hopping is nice
(add-hook 'java-mode-hook 'subword-mode)
