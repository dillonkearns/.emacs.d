(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "s-w") 'er/expand-region)
(global-set-key (kbd "s-W") 'er/contract-region)
(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g") 'ag-project)
(global-set-key (kbd "s-G") 'ag-project-regexp)
(global-set-key (kbd "\C-cm") 'markdown-preview-file)
(global-set-key (kbd "s-t") 'dtk/open-root-in-source-tree)
(global-set-key (kbd "\C-cc") 'capture-work-note)
(global-set-key (kbd "M-p") 'diff-hl-previous-hunk)
(global-set-key (kbd "M-n") 'diff-hl-next-hunk)


;; key chords
;; (key-chord-define-global "jb" 'ruby-beginning-of-block)
;; (key-chord-define-global "je" 'ruby-end-of-block)
(key-chord-define-global "JO" (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one
(key-chord-define-global "jo" 'other-window)
(key-chord-define-global "jc" 'dispatch-goto-matching)
