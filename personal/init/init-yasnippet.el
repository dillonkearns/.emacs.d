(setq yas-snippet-dirs
      (list (expand-file-name "snippets" prelude-personal-dir))
)

(yas-global-mode)

(setq yas-prompt-functions '(yas/ido-prompt))

(provide 'init-yasnippet)
