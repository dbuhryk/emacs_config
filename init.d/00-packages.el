; packages.el
; defvar is the correct way to declare global variables
; you might see setq as well, but setq is supposed to be use just to set variables,
; not create them.

(require 'cl)
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


(package-initialize)



(defvar required-packages
  '(
    ;sbt-mode
	;sublimity-mode
	elscreen
	switch-window
	sublime-themes
	magit
	recentf
	;scala-mode2
	;ensime
	;nyan-mode
	ess
	smex
	window-number
  ;window-numbering
	;multiple-cursors
  ) "a list of packages to ensure are installed at launch.")

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
