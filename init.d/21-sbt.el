
(require 'sbt-mode)

(cond ((eq system-type 'windows-nt)
       (progn
	 (setenv "SBT_HOME" "C:\\Users\\edzmbuh\\Apps\\sbt-0.13.7\\bin")
	 (setenv "PATH" (concat (getenv "PATH") ";" (getenv "SBT_HOME") ))
	 ))
      ((eq system-type `cygwin)
       (progn
     (setenv "SBT_HOME" "/cygdrive/c/Users/edzmbuh/Apps/sbt-0.13.7/bin")
	 (setenv "PATH" (concat (getenv "PATH") ":" (getenv "SBT_HOME") ))
	 ))
      )


(setq sbt:program-name (concat (getenv "SBT_PATH") "/sbt"))


(defun sbt-align-dependenciess (begin end)
  "align library imports in the form: org.example %% 1.2.3 % 0.3.6"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)[=%]%?" nil nil t))

(add-hook 'scala-mode-hook (lambda () (local-set-key (kbd "C-x |") `sbt-align-dependenciess)))