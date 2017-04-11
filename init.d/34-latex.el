(require 'latex-preview-pane)
(cond ((eq system-type 'windows-nt)
       (progn
	 (setenv "ISPELL_PATH" "C:\\Users\\edzmbuh\\Apps\\Aspell\\bin\\")
	 (setenv "GS_PATH" "C:\\Users\\edzmbuh\\Apps\\gs\\gs9.15\\bin")
	 (setenv "ISPELL_APP" "aspell.exe")
	 (setenv "LATEX_PATH" "C:\\Users\\edzmbuh\\Apps\\miktex-2.9.5105\\miktex\\bin")
	 (setq pdf-latex-command "C:\\Users\\edzmbuh\\Apps\\miktex-2.9.5105\\miktex\\bin\\pdflatex.exe")
	 (setq ispell-program-name (concat (getenv "ISPELL_PATH") (getenv "ISPELL_APP") ) )
	 (setenv "PATH" (concat (getenv "PATH") ";" (getenv "LATEX_PATH") ";" (getenv "GS_PATH") ))
	 ;;(setq doc-view-ghostscript-program )
	 ))
      ((eq system-type `cygwin)
       (progn
	 ;;(setenv "ISPELL_PATH" "/cygdrive/c/Users/edzmbuh/Apps/Aspell/bin/")
	 ;;(setenv "ISPELL_APP" "aspell.exe")
	 ))
      )



;;(setenv "PATH" (concat (getenv "PATH") ";" (getenv "ISPELL_PATH")))

(setq ispell-list-command "list")
(setq ispell-extra-args '("--dont-tex-check-comments"))

(latex-preview-pane-enable)
