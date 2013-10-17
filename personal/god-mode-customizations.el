;; (add-to-list 'god-exempt-major-modes 'dired-mode)

(global-set-key (kbd "<escape>") 'god-local-mode)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
