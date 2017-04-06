(require 'ghc)
;;(require 'ghc-imported-from)
(require 'ghci-completion)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))