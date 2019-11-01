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

;; Make the font size a bit smaller
(set-face-attribute 'default nil :height 85)
