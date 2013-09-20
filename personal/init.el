(server-start)   ;; start a server so we only have to open emacs once at startup

(load-theme 'solarized-dark t)
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-show-active-ruby-in-modeline nil)

(require 'ruby-block)
(ruby-block-mode t)

(setq ruby-block-highlight-toggle 'overlay)
(setq ruby-block-highlight-toggle t)
(setq ruby-block-highlight-toggle 'minibuffer)

