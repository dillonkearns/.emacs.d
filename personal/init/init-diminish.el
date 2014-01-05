(require 'diminish)
(eval-after-load "ruby-test-mode" '(diminish 'ruby-test-mode))
(eval-after-load "yas/minor-mode" '(diminish 'yas/minor-mode))
(eval-after-load "Projectile" '(diminish 'projectile-mode))
(eval-after-load "ruby-block" '(diminish 'ruby-block-mode))
(eval-after-load "god-mode" '(diminish 'god-local-mode))
(eval-after-load "prelude-mode" '(diminish 'prelude-mode))

(provide 'init-diminish)
