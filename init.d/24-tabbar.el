;;****************************************************************
;; This are setting for nice tabbar items
;; to have an idea of what it looks like http://imgur.com/b0SNN
;; inspired by Amit Patel screenshot http://www.emacswiki.org/pics/static/NyanModeWithCustomBackground.png
 
;; Tabbar
(require 'tabbar)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)
 
;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))
 

;;****************************************************************
(tabbar-mode 1)

(setq tabbar-cycle-scope 'tabs)
(setq tabbar-buffer-groups-function
      (lambda ()
          (let ((dir (expand-file-name default-directory)))
        (cond ((member (buffer-name) '("*Completions*"
                       "*scratch*"
                       "*Messages*"
                       "*Ediff Registry*"))
           (list "#misc"))
          ((string-match-p "/.emacs.d/" dir)
           (list ".emacs.d"))
          (t (list dir))))))

(defun autohide-tabbar ()
 "Make tabbar briefly show itself while you are switching
buffers with shortcuts.  Tested with GNU Emacs 23."
 (defvar *tabbar-autohide-delay* 3)

(interactive)
(tabbar-mode nil)
(defvar *tabbar-autohide-timer* nil)
(defun renew-tabbar-autohide-timer ()
 (if (timerp *tabbar-autohide-timer*)
     (cancel-timer *tabbar-autohide-timer*))
 (setf *tabbar-autohide-timer*
       (run-with-timer
        3 nil (lambda ()
                (tabbar-mode nil)
                (setf *tabbar-autohide-timer*
                      nil)))))

(global-set-key
    [C-next]
    (lambda ()
      (interactive)
      (if tabbar-mode
          (tabbar-forward)
        (tabbar-mode t))
      (renew-tabbar-autohide-timer)))

(global-set-key
[C-prior]
(lambda ()
  (interactive)
  (if tabbar-mode
      (tabbar-backward)
    (tabbar-mode t))
  (renew-tabbar-autohide-timer))))

;;****************************************************************
(autohide-tabbar)
;(setq tabbar-use-images nil)

;;****************************************************************
;; maybe you will find this usefull
;; it moves the current tab left/right rearranging the
;; tabs (as in konsole for example)
;; beware, this is my first elisp(lisp) hack
;; it probably looks terrible

(defun tabbar-move-tab (&optional right)
"Move current tab to the left or to the right
if RIGHT is set."
(let* ((ctabset nil)
(ctabs nil)
(ctab nil)
(hd nil)
(tl nil))
(and 
(setq ctabset (tabbar-current-tabset 't))
(setq ctabs (tabbar-tabs ctabset))
(setq ctab (tabbar-selected-tab ctabset))
(setq tl ctabs)
(setq hd '())) ;; nil
(while (and (cdr tl) (not (eq ctab (car tl))) (not (eq ctab (cadr tl))))
(setq hd (append hd (list (car tl)))
tl (cdr tl)))
(set ctabset
(cond 
((and (not right) (null hd) (eq ctab (car tl)))
(append (cdr tl) (list (car tl))))
((not right)
(append hd (list (cadr tl)) (list (car tl)) (cddr tl)))
((and right (not (cddr tl)))
(append (list (cadr tl)) hd (list (car tl))))
((and right (eq ctab (car tl)))
(append hd (list (cadr tl)) (list (car tl)) (cddr tl)))
(right
(append hd (list (car tl)) (list (caddr tl)) (list (cadr tl)) (cdddr tl)))
))
(put ctabset 'template nil)
(tabbar-display-update)))

(defun tabbar-move-tab-left ()
"Move tab left."
(interactive)
(tabbar-move-tab t))

(defun tabbar-move-tab-right ()
"Move tab right."
(interactive)
(tabbar-move-tab t))
