;; loaded in init.el

;; Turn off the menu bar at the top of each frame
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Remove the toolbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; Make the font size a bit smaller on Linux, bigger on Mac
;;(-filter (lambda (font) (string-suffix-p "Nerd Font" font)) (font-family-list))
(if (memq window-system '(mac ns))
    (set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 110 :weight 'regular :width 'regular)
  (set-face-attribute 'default nil :family "Fira Mono" :height 100 :weight 'regular :width 'regular))

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Use Leuven by default
(load-theme 'leuven t)

;; Use powerline
(use-package powerline
  :if (display-graphic-p)
  :config
  (powerline-default-theme))

(use-package gruvbox-theme)
(use-package atom-one-dark-theme)

(defun disable-all-themes ()
  (mapcar
   (lambda (theme) (funcall 'disable-theme theme))
   (custom-available-themes)))

;; make it easy to switch back and forth depending on light conditions
(defun light-mode ()
  (interactive)
  (progn
    (disable-all-themes)
    (load-theme 'leuven t)))

(defun dark-mode ()
  (interactive)
  (progn
    (disable-all-themes)
    (load-theme 'atom-one-dark t)))

;; open everything with firefox on linux, open on mac
(if (memq window-system '(mac ns))
    (setq browse-url-generic-program "open")
    (setq browse-url-generic-program "firefox"))

(if (display-graphic-p)
    (set-frame-width (selected-frame) 132)
    (set-frame-height (selected-frame) 80))
