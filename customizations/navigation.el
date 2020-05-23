;; loaded in init.el

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(use-package recentf
  :config
  (setq recentf-save-file (concat user-emacs-directory ".recentf"))
  (setq recentf-max-menu-items 40))

;; ido-mode allows you to more easily navigate choices. For example,
;; when you want to switch buffers, ido presents you with a list
;; of buffers in the the mini-buffer. As you start to type a buffer's
;; name, ido will narrow down the list of buffers to match the text
;; you've typed in
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(use-package ido
  :init
  (ido-mode t)
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  (setq ido-auto-merge-work-directories-length -1)
  (setq ido-use-virtual-buffers t)
  (ido-everywhere)
  (global-set-key (kbd "C-x C-b") 'ibuffer))

(use-package ido-completing-read+
  :init
  (ido-ubiquitous-mode t))

;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
(use-package smex
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (global-set-key (kbd "M-x") 'smex))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package beacon
  :config
  (beacon-mode 1))

(use-package buffer-move
  :config
  (global-set-key (kbd "<C-S-up>")     'buf-move-up)
  (global-set-key (kbd "<C-S-down>")   'buf-move-down)
  (global-set-key (kbd "<C-S-left>")   'buf-move-left)
  (global-set-key (kbd "<C-S-right>")  'buf-move-right))

;; thanks Reddit user shackra!
(use-package ace-window
    :bind ("M-o" . ace-window)
    :init
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    :config
    (setf aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(defun kill-other-buffers ()
    "Kill all other buffers."
      (interactive)
        (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
