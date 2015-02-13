(require 'git-gutter)

;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

(define-prefix-command 'gg-prefix)
(global-set-key (kbd "C-x C-g") 'gg-prefix)

(global-set-key (kbd "C-x C-g t") 'git-gutter:toggle)
(global-set-key (kbd "C-x C-g =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x C-g s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x C-g r") 'git-gutter:revert-hunk)