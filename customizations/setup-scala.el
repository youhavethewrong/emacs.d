(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(setq inferior-fsharp-program "/usr/bin/fsharpi --readline-")
(setq fsharp-compiler "/usr/bin/fsharpc")
