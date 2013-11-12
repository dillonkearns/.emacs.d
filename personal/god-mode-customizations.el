;; (add-to-list 'god-exempt-major-modes 'dired-mode)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
(god-mode)
;; smartparens-mode currently conflicts with god-mode

(defun turn-off-smartparens ()
  (smartparens-global-mode -1))
(add-hook 'smartparens-enabled-hook 'turn-off-smartparens)

(global-set-key (kbd "<escape>") (lambda () (interactive) (god-local-mode 1)))
(key-chord-mode -1)
