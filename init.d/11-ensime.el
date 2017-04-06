(require 'ensime)

;(setq ensime-default-server-cmd "bin/server")
;(setq ensime-default-server-cmd "bin/server")
;(setq ensime-default-server-host "localhost")
;(setq ensime-graphical-tooltips nil)
;(setq ensime-tooltip-type-hints t)

;(setq exec-path (append exec-path (getenv "SBT_HOME")))
;;(setenv "PATH" (concat (getenv "PATH") ":" (getenv "SBT_HOME") ))
(defun killall-java ()
  (interactive)
  (shell-command "killall java"))

(global-set-key (kbd "C-c C-v K") 'killall-java)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun run-ensime-generate (sbt-path)
  (switch-to-buffer "*ensime-generate*")
  (cd sbt-path)
  (start-process "ensime-generate" "*ensime-generate*" "sbt" "ensime generate"))

(defun run-genCtags (sbt-path)
  (switch-to-buffer "*genCtags*")
  (cd sbt-path)
  (start-process "genCtags" "*genCTags*" "sbt" "genCtags"))

(defun ensime-generate ()
  (interactive)
  (let ((my-sbt-file (find-containing-dir-upwards "build.sbt")))
    (when my-sbt-file
      (message "generate ensimme configuration for project: %s" my-sbt-file)
      (run-ensime-generate my-sbt-file))))

(defun genCtags ()
  (interactive)
  (let ((my-sbt-file (find-containing-dir-upwards "build.sbt")))
    (when my-sbt-file
      (message "generate ctags for project: %s" my-sbt-file)
      (run-genCtags my-sbt-file))))