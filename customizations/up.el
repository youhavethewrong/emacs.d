;; loaded in init.el
;; install and use use-package

(require 'package)
(setq package-enable-at-startup nil)

;; configure package sources
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa"        . "https://melpa.org/packages/")))

;; set these packages to latest stable version
(setq package-pinned-packages
      '(
        (cider               . "melpa-stable")
        (clj-refactor        . "melpa-stable")
        (lsp-mode            . "melpa-stable")
        (lsp-ui              . "melpa-stable")
        (org-bullets         . "melpa-stable")
        (projectile          . "melpa-stable")
        (use-package         . "melpa-stable")
        ))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

;;; show package load time
(let ((elapsed (float-time (time-subtract (current-time)
                                          emacs-start-time))))
  (message "Loaded packages in %.3fs" elapsed))
