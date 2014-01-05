(load-file "~/Dropbox/opensource/prelude/personal/god-mode.elc")
(require 'god-mode)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
(god-mode)

(global-set-key (kbd "<escape>") (lambda () (interactive) (god-local-mode 1)))
(key-chord-mode -1)

(provide 'init-god-mode)
