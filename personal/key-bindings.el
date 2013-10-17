;; super keys
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(global-set-key (kbd "s-w") 'er/expand-region)
(global-set-key (kbd "s-W") 'er/contract-region)
(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g") 'ag-project)
(global-set-key (kbd "s-G") 'ag-project-regexp)
(global-set-key (kbd "M-s-©") 'ag)
(global-set-key (kbd "s-S") 'dtk/open-root-in-source-tree)
(global-set-key (kbd "s-t") 'projectile-find-test-file)
(global-set-key (kbd "s-T") 'dtk-tdd-split)


(global-set-key (kbd "\C-cc") 'org-capture)
(global-set-key (kbd "M-p") 'diff-hl-previous-hunk)
(global-set-key (kbd "M-n") 'diff-hl-next-hunk)
(global-set-key (kbd "M-P") 'move-text-up)
(global-set-key (kbd "M-N") 'move-text-down)

;; key chords
(key-chord-define-global "jc" 'jump-to-corresponding)


;; removed prelude defaults
(global-unset-key [(control shift up)])
(global-unset-key [(control shift down)])
(global-unset-key [(meta shift up)])
(global-unset-key [(meta shift down)])

;; Use shell-like backspace C-h and C-M-h, rebind help to M-h
(define-key key-translation-map [?\C-h] [?\C-?])
(define-key key-translation-map [?\C-\M-h] [?\C-\M-?])
(global-set-key (kbd "M-h") 'help-command)

;; Emacs overrides
(global-set-key (kbd "C-o") 'other-window)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "C-o") 'other-window)))
(global-set-key (kbd "M-o") (lambda ()
                              (interactive)
                              (other-window -1)))
