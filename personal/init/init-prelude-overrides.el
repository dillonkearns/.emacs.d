;; remove annoying prelude defaults

(setq prelude-guru nil)

;; don't toggle between beginning of line and beginning of code with c-a
(global-set-key [remap move-beginning-of-line] 'move-beginning-of-line)

;; go to dired instead of find-file on projectile-switch-project
(setq projectile-switch-project-action 'projectile-dired)

;; extend whitespace highlight column so long lines are still readable
(setq whitespace-line-column 300)

(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(provide 'init-prelude-overrides)
