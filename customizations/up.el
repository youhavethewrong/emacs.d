;; loaded in init.el
;; install and use use-package

(require 'package)
(setq package-enable-at-startup nil)

;; configure package sources
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; set these packages to latest stable version
(setq package-pinned-packages
      '(
        (cider               . "melpa-stable")
        (clj-refactor        . "melpa-stable")
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
