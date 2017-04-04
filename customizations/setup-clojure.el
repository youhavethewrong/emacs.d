;;;;
;; Clojure
;;;;

;; Enable paredit for Clojure
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; This is useful for working with camel-case tokens, like names of
;; Java classes (e.g. JavaClassName)
(add-hook 'clojure-mode-hook 'subword-mode)

;; A little more syntax highlighting
(require 'clojure-mode-extra-font-locking)

;; Clojure refactoring
(require 'clj-refactor)

(defun enable-cljr ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  (cljr-add-keybindings-with-prefix "C-c C-r"))

(add-hook 'clojure-mode-hook 'enable-cljr)

;;;;
;; CIDER
;;;;

;; Provides minibuffer documentation for the code you're typing into the RPL
(add-hook 'cider-mode-hook 'eldoc-mode)


;; Go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; Where to store history
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history
(setq cider-repl-wrap-history t)

;; When evaluating a buffer, just save without prompting
(setq cider-prompt-save-file-on-load 'always-save)

;; Enable paredit in the REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljc$" . clojurec-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))

;; Wrap cider-refresh with system lifecycle functions from user namespace.
(setq cider-refresh-before-fn "user/stop"
      cider-refresh-after-fn "user/go")

;; Switch to user namespace
(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

;; Custom shortcuts
(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)
     ;; don't want complete-symbol to override our paredit bindings
     (define-key cider-mode-map (kbd "C-M-i") 'paredit-backward-barf-sexp)))

;; Autocomplete
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

;; Custom indentation for functions
(put-clojure-indent 'match 1)   ;; clojure.core.match
(put-clojure-indent 'fdef 1)    ;; clojure.spec
(put-clojure-indent 'for-all 1) ;; clojure.test.check

;; ClojureScript REPL
(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")

;; When there's an error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Toggles cider-error buffer pop-up on exceptions
(defun cider-toggle-auto-select-error-buffer ()
  (interactive)
  (if cider-auto-select-error-buffer
      (progn
        (setq cider-auto-select-error-buffer nil)
        (message "Disabled."))
      (progn
        (setq cider-auto-select-error-buffer t)
        (message "Enabled."))))
