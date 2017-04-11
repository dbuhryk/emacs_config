(require 'ess)

(cond ((eq system-type 'windows-nt)
		(progn 
			(setq inferior-R-program-name "C:\\Users\\edzmbuh\\Apps\\R-3.1.2\\bin\\x64\\Rterm.exe")
			))
	((eq system-type `cygwin)
		(progn 
			(setq inferior-R-program-name "/cygdrive/c/Users/edzmbuh/Apps/R-3.1.2/bin/x64/Rterm.exe")
			))
	)

(autoload 'R-mode "ess-site.el" "" t)
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))

;(load "ess-site.el")