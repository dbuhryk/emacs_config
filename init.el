;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(mapc 'load (file-expand-wildcards "~/.emacs.d/init.d/*.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" default)))
 '(package-selected-packages
   (quote
    (sphinx-mode projectile pkg-info window-number tabbar-ruler tab-group switch-window sublime-themes sml-mode smex org-projectile org-plus-contrib org multiple-cursors minimap magit latex-preview-pane key-chord helm-R git-gutter ghci-completion ghc flycheck ensime elscreen dirtree cygwin-mount csv-nav csv-mode column-marker color-theme-zenburn color-theme-eclipse color-theme-approximate col-highlight chess auctex ace-jump-mode)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
