
;;(setq default-directory (concat (getenv "HOME") "/Workspaces/emacs24"))

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq inhibit-splash-screen t)

;;****************************************************************
(display-time-mode 1)
;;****************************************************************
;; modeline
(setq column-number-mode t)
; (global-linum-mode 1)

;;****************************************************************
;; zoom
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


;;****************************************************************
;; smooth scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;;****************************************************************
;; misc
(show-paren-mode 1)

;; when I create a third column, make them all 1/3 size
(defadvice split-window-right (after rebalance-windows activate)
  (balance-windows))
(ad-activate 'split-window-right)

(setq visible-bell t)
(if (not (null window-system))
    (progn
      (tool-bar-mode -1)))

;;****************************************************************
;; ORG mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;****************************************************************
;; windmove
(global-set-key [M-right] `windmove-right)
(global-set-key [M-left] `windmove-left)
(global-set-key [M-up] `windmove-up)
(global-set-key [M-down] `windmove-down)

(global-set-key [s-right] `windmove-right)
(global-set-key [s-left] `windmove-left)
(global-set-key [s-up] `windmove-up)
(global-set-key [s-down] `windmove-down)

;;****************************************************************
;; code folding
(define-prefix-command 'my-hs-prefix)
(global-set-key (kbd "C-c C-h") 'my-hs-prefix)
(global-set-key (kbd "C-c C-h SPC") 'hs-toggle-hiding)
(global-set-key (kbd "C-c C-h C-h") 'hs-hide-block)
(global-set-key (kbd "C-c C-h C-s") 'hs-show-block)
(global-set-key (kbd "C-c C-h C-l") 'hs-hide-level)
(global-set-key (kbd "C-c C-h C-S-h") 'hs-hide-all)
(global-set-key (kbd "C-c C-h C-S-s") 'hs-show-all)
(global-set-key (kbd "C-c C-h C-a") 'hs-show-all)
(global-set-key (kbd "C-c C-h C-c") '(lambda () (interactive) (hs-hide-level 2)))

;;****************************************************************
;; key bindings
(global-set-key (kbd "M-SPC") 'cycle-spacing)
(global-set-key [delete] 'yow)
(global-set-key "\M-,"    'beginning-of-buffer)
(global-set-key "\M-."    'end-of-buffer)
(global-set-key "\M-g"    'goto-line)
(global-set-key "\C-xra"  'append-to-register)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-o"      'open-line-and-indent)
(global-set-key "\M-N" 'next-stews-counter)
(global-set-key "\M-M" 'reset-stews-counter)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\M-$" 'replace-regexp)
(global-set-key "\M-^" 'query-replace-regexp)
(global-set-key "\M-#" 'replace-string)
(global-set-key "\C-x," 'paren-match)
(global-set-key (kbd "s-r") 'replace-regexp)
(global-set-key (kbd "s-R") 'replace-string)
(global-set-key (kbd "M-s-r") 'query-replace-regexp)
(global-set-key (kbd "M-s-R") 'query-replace)
(global-set-key (kbd "s-g") 'rgrep)
(global-set-key (kbd "C-x g") 'rgrep)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x B") 'bury-buffer)
(global-set-key (kbd "C-c RET") 'find-todo-org-file)
(define-key 'iso-transl-ctl-x-8-map "l" [?λ])
(define-key 'iso-transl-ctl-x-8-map "a" [?α])
(define-key 'iso-transl-ctl-x-8-map "b" [?β])
(define-key 'iso-transl-ctl-x-8-map "," [?←])
(define-key 'iso-transl-ctl-x-8-map "t" [?⊤])
(define-key 'iso-transl-ctl-x-8-map "f" [?⊥])


;;****************************************************************
;;Prevent Emacs from asking “modified buffers exist; exit anyway?”

(defun my-save-buffers-kill-emacs (&optional arg)
  "Offer to save each buffer(once only), then kill this Emacs process.
With prefix ARG, silently save all file-visiting buffers, then kill."
  (interactive "P")
  (save-some-buffers arg t)
  (and (or (not (fboundp 'process-list))
       ;; process-list is not defined on MSDOS.
       (let ((processes (process-list))
         active)
         (while processes
           (and (memq (process-status (car processes)) '(run stop open listen))
            (process-query-on-exit-flag (car processes))
            (setq active t))
           (setq processes (cdr processes)))
         (or (not active)
         (progn (list-processes t)
            (yes-or-no-p "Active processes exist; kill them and exit anyway? ")))))
       ;; Query the user for other things, perhaps.
       (run-hook-with-args-until-failure 'kill-emacs-query-functions)
       (or (null confirm-kill-emacs)
       (funcall confirm-kill-emacs "Really exit Emacs? "))
       (kill-emacs)))

(fset 'save-buffers-kill-emacs 'my-save-buffers-kill-emacs)

;;****************************************************************
;;Make Emacs stop asking “Active processes exist; kill them and exit anyway”
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
<<<<<<< 94ed9c4ffbba17720fcb3607ee38263e28049915
  (flet ((process-list ())) ad-do-it))
=======
  (cl-flet ((process-list ())) ad-do-it))
>>>>>>> More packages
