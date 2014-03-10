(require 'god-mode)

(defun my-update-cursor ()
  (setq cursor-type
        (cond
         (god-local-mode 'box)
         (buffer-read-only 'bar)
         (t 'bar)
              )))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
(add-hook 'after-change-major-mode-hook 'my-update-cursor)
(god-mode)

(global-set-key (kbd "<escape>") (lambda () (interactive) (god-local-mode 1)))
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
(define-key god-local-mode-map (kbd "z") 'repeat)
(key-chord-mode -1)

(provide 'init-god-mode)
