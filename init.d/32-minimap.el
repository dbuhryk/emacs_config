 (require 'minimap)

(setq minimap-window-location 'right)

(defun minimap-toggle ()
  "Toggle minimap"
  (interactive)
  (if (null minimap-bufname)
      (minimap-create)
    (minimap-kill)))