(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "s-w") 'er/expand-region)
(global-set-key (kbd "s-W") 'er/contract-region)
(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g") 'ag-project)
(global-set-key (kbd "s-G") 'ag-project-regexp)
(global-set-key (kbd "\C-cm") 'markdown-preview-file)
(global-set-key (kbd "s-t") 'dtk/open-root-in-source-tree)
(global-set-key (kbd "\C-cc") 'capture-work-note)
(global-set-key (kbd "\C-c[") 'diff-hl-previous-hunk)
(global-set-key (kbd "\C-c]") 'diff-hl-next-hunk)
