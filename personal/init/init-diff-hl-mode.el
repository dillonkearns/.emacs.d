;; (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
;; (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
;; (add-hook 'markdown-mode-hook 'turn-on-diff-hl-mode)

(require 'diff-hl)
(global-diff-hl-mode)
(add-hook 'after-save-hook 'diff-hl-update nil t)


(provide 'init-diff-hl-mode)
