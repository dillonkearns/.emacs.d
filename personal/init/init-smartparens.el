(require 'smartparens)

(smartparens-global-strict-mode 1)
(show-smartparens-global-mode 1)

;; don't pair "'" if we're at the end of a word (like when typing an apostrophe)
(sp-pair "'" nil :unless '(sp-point-after-word-p))

;; disable '' pairing in minibuffer
(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

(sp-with-modes sp--lisp-modes
  ;; disable ', it's the quote character!
  (sp-local-pair "'" nil :actions nil)

  ;; only use the pseudo-quote inside strings where it serve as hyperlink.
  (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p)))

;; make entering triple-quotes less annoying in feature-mode
(add-to-list 'sp-autoescape-string-quote-if-empty 'feature-mode)

(provide 'init-smartparens)
