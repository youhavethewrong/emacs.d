(require 'fsharp-mode)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
(setq inferior-fsharp-program "/usr/bin/fsharpi --readline-")
(setq fsharp-compiler "/usr/bin/fsharpc")
