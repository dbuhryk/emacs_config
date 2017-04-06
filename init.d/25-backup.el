;;****************************************************************
;; make backup to a designated dir, mirroring the full path

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* (
        (backupRootDir "~/.emacs.d/emacs-backup/")
        (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path, “C:”
        (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
        )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
  )
)

;(setq make-backup-file-name-function 'my-backup-file-name)

;;****************************************************************
;; If you want all backup to be flat in a dir
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))


;;****************************************************************
;; make emacs stop creating those “backup~” files or those “#autosave#” files
;(setq make-backup-files nil) ; stop creating backup~ files
;(setq auto-save-default nil) ; stop creating #autosave# files
