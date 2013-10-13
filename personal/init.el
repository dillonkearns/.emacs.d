(server-start)   ;; start a server so we only have to open emacs once at startup

(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-show-active-ruby-in-modeline nil)

(eval-after-load "ruby-test-mode" '(diminish 'ruby-test-mode))
(eval-after-load "yas/minor-mode" '(diminish 'yas/minor-mode))
(eval-after-load "Projectile" '(diminish 'projectile-mode))
(eval-after-load "ruby-block" '(diminish 'ruby-block-mode))
