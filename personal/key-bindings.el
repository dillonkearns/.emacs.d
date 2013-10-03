;; super keys
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "s-w") 'er/expand-region)
(global-set-key (kbd "s-W") 'er/contract-region)
(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g") 'ag-project)
(global-set-key (kbd "s-G") 'ag-project-regexp)
(global-set-key (kbd "s-S") 'dtk/open-root-in-source-tree)
(global-set-key (kbd "s-t") 'projectile-find-test-file)
(global-set-key (kbd "s-T") 'dtk-tdd-split)


(global-set-key (kbd "\C-cc") 'capture-work-note)
(global-set-key (kbd "M-p") 'diff-hl-previous-hunk)
(global-set-key (kbd "M-n") 'diff-hl-next-hunk)
(global-set-key (kbd "M-P") 'move-text-up)
(global-set-key (kbd "M-N") 'move-text-down)

;; key chords
(key-chord-define-global "jc" 'jump-to-corresponding)
