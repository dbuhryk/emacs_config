(require 'smex)

;;(global-set-key [(meta x)] (lambda ()
;;                             (interactive)
;;                             (or (boundp 'smex-cache)
;;                                 (smex-initialize))
;;                             (global-set-key [(meta x)] 'smex)
;;                             (smex)))

;;(global-set-key [(shift meta x)] (lambda ()
;;                                   (interactive)
;;                                   (or (boundp 'smex-cache)
;;                                       (smex-initialize))
;;                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
;;                                   (smex-major-mode-commands)))

(global-set-key (kbd "M-x") `smex)
(global-set-key (kbd "M-X") `smex-major-mode-commands)

 (defun smex-update-after-load (unused)
      (when (boundp 'smex-cache)
        (smex-update)))
 
(add-hook 'after-load-functions 'smex-update-after-load)