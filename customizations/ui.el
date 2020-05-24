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
;; (-filter (lambda (font) (string-suffix-p "Mono" font)) (font-family-list))
(if (memq window-system '(mac ns))
    (set-face-attribute 'default nil :family "FuraCode Nerd Font Mono" :height 120 :weight 'regular :width 'regular)
  (set-face-attribute 'default nil :family "Fira Mono" :height 85 :weight 'regular :width 'regular))

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Use powerline
(use-package powerline
  :conditional (display-graphic-p)
  :config
  (powerline-default-theme))

;; Use themes
(use-package atom-one-dark-theme)

(use-package leuven-theme
  :after atom-one-dark-theme
  :config
  (if (display-graphic-p)
      (load-theme 'leuven t)
    (load-theme 'atom-one-dark t)))

(defun disable-all-themes ()
  (mapcar
   (lambda (theme) (funcall 'disable-theme theme))
   (custom-available-themes)))

;; make it easy to switch back and forth depending on light conditions
(defun bright-theme ()
  (interactive)
  (progn
    (disable-all-themes)
    (load-theme 'leuven t)))

(defun dark-theme-alt ()
  (interactive)
  (progn
    (disable-all-themes)
    (load-theme 'atom-one-dark t)))

(defun dark-theme ()
  (interactive)
  (progn
    (disable-all-themes)
    (load-theme 'cyberpunk t)))

;; open everything with firefox
(setq browse-url-generic-program "firefox")
