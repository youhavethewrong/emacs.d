;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t )
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; autocomplete assistance from CIDER
    ac-cider

    ;; clojure cheatsheet for handy referencing
    clojure-cheatsheet

    ;; groovy
    groovy-mode

    ;; rust language
    rust-mode

    ;; cargo package manager for rust
    cargo

    ;; toml is the markup that cargo manifests are written in
    toml-mode

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; finish your thoughts
    auto-complete

    ;; highlight matching words while idle
    idle-highlight-mode

    ;; handle YAML
    yaml-mode

    ;; handle Markdown
    markdown-mode

    ;; increment and decrement number easily
    evil-numbers

    ;; clojure refactoring
    clj-refactor

    ;; make the mode line look neat
    powerline

    ;; turn off line numbering sometimes
    linum-off

    ;; nicer than M-x shell
    better-shell

    ;; better shell on mac and win
    exec-path-from-shell

    ;; haskell
    haskell-mode

    ;; erlang
    erlang

    ;; elixir
    elixir-mode

    ;; fsharp
    fsharp-mode

    ;; scala
    scala-mode
    ensime

    ;; notice the cursor when jumping around
    beacon

    ;; mark 80 columns
    column-marker

    ;; JSX support
    rjsx-mode

    ;; Make JS and JSX pretty
    js-auto-beautify

    ;; Another wayt o make some stuff pretty
    prettier-js

    ;; indium is another javascript IDE
    indium

    ;; Nice theme when using terminals
    espresso-theme

    ;; Nice theme when using high-color terminals
    cyberpunk-theme
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;;
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Load up everything in the vendor directory
(dolist (project (directory-files "~/.emacs.d/vendor" t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'auto-complete-config)
(ac-config-default)

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")
(load "log.el")

;; Build tools
(load "maven.el")
(load "lein.el")
(load "npm.el")

;; Work-specific functions
(load "work.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; Make mouse behavior more predictable.
(load "mouse.el")

;; For editing lisps
(load "elisp-editing.el")

;; Language-specific
(load "setup-clojure.el")
(load "setup-groovy.el")
(load "setup-js.el")
(load "setup-misc-programming.el")

;; IRC
(load "irc.el")

;; Cool webkit browser inside emacs
(load "webkit.el")

;; I like doing dangerous things
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(beacon-color "goldenrod")
 '(browse-url-browser-function (quote browse-url-firefox))
 '(browse-url-firefox-program "~/bin/ff")
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cljr-favor-prefix-notation nil)
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("5acb6002127f5d212e2d31ba2ab5503df9cd1baa1200fbb5f57cc49f6da3056d" "cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" default)))
 '(fci-rule-color "#383838")
 '(magit-git-executable "/usr/bin/git")
 '(package-selected-packages
   (quote
    (toml-mode cargo prettier-js js2-refactor cider buffer-move column-marker yaml-mode tagedit smex projectile powerline markdown-mode magit linum-off ido-ubiquitous idle-highlight-mode haskell-mode groovy-mode fsharp-mode evil-numbers erlang elixir-mode clojure-mode-extra-font-locking clojure-cheatsheet clj-refactor beacon ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(column-marker-3 ((t (:background "peach puff")))))
