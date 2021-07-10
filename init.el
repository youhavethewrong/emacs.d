;; log when we start
(defconst emacs-start-time (current-time))

;; set the garbage collection a bit higher
(setq gc-cons-threshold 20000000) ; ~20MB

;; still load from customizations
(add-to-list 'load-path "~/.emacs.d/customizations")

;; load package support and use-package
(load "up.el")

;; setup shell integration when necessary
(load "shell-integration.el")

;; changing how emacs looks across all modes
(load "ui.el")

;; change text editing behavior
(load "editing.el")

;; making navigating buffers and projects nice
(load "navigation.el")

;; working with lisps
(load "setup-lisp.el")

;; using org mode
(load "setup-org.el")

;; general programming
(load "programming.el")

;; searching and finding my way through code projects
(load "searching.el")

;; TODO
;; (load "mouse.el")

;; be able to restart emacs while its still running
(use-package restart-emacs
  :defer t)


;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(beacon-color "goldenrod")
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cljr-favor-prefix-notation nil)
 '(coffee-tab-width 2)
 '(confirm-kill-emacs 'y-or-n-p)
 '(custom-safe-themes
   '("a06658a45f043cd95549d6845454ad1c1d6e24a99271676ae56157619952394a" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "7f1263c969f04a8e58f9441f4ba4d7fb1302243355cb9faecb55aec878a06ee9" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "5acb6002127f5d212e2d31ba2ab5503df9cd1baa1200fbb5f57cc49f6da3056d" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" default))
 '(fci-rule-color "#383838")
 '(magit-git-executable "/usr/bin/git")
 '(org-adapt-indentation nil)
 '(package-selected-packages
   '(dash-functional js2-mode amx smex projectile magit lsp-ui lsp-mode gruvbox-theme atom-one-dark-theme dash buffer-mode uniquify rainbow-delimiters-mode save-place indium visible-mark terraform-mode toml-mode cargo phettier-js js2-refactor cider buffer-move column-marker tagedit markdown-mode linum-off ido-ubiquitous idle-highlight-mode haskell-mode groovy-mode fsharp-mode evil-numbers erlang elixir-mode clojure-mode-extra-font-locking clojure-cheatsheet clj-refactor beacon ac-cider))
 '(prettier-js-width-mode nil)
 '(rust-format-on-save t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(column-marker-3 ((t (:background "peach puff"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "hot pink"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "SpringGreen2"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "firebrick1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "DodgerBlue1")))))
