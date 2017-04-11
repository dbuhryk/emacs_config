;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; embedded in literate Org-mode files.

;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;; load up all literate org-mode files in this directory
(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))


(require 'org)
(require 'org-install)
(require 'ess-site)
(require 'ess-mode)

(cond ((eq system-type 'windows-nt)
		(progn 
			(setq org-babel-R-command "C:/Users/edzmbuh/Apps/R-3.1.2/bin/x64/R.exe --slave --no-save")
			;(setq org-babel-R-command "/cygdrive/c/Users/edzmbuh/Apps/R-3.1.2/bin/x64/R.exe --slave --no-save")
			(setq explicit-shell-file-name "sh.exe")
			(setq shell-file-name explicit-shell-file-name)
			))
	((eq system-type `cygwin)
		(progn 
			(setq org-babel-R-command "/cygdrive/c/Users/edzmbuh/Apps/R-3.1.2/bin/x64/R.exe --slave --no-save")
			))
	)

;(org-babel-do-load-languages
;	'org-babel-load-languages
;	'((R . t)
;		))
      ;'((emacs-lisp . nil)
      ;  (R . t)))
