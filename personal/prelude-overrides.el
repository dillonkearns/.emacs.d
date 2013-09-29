(setq prelude-guru nil)

(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))
(setq projectile-switch-project-action 'projectile-dired)
