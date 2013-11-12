(server-start)   ;; start a server so we only have to open emacs once at startup

(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-show-active-ruby-in-modeline nil)

(eval-after-load "ruby-test-mode" '(diminish 'ruby-test-mode))
(eval-after-load "yas/minor-mode" '(diminish 'yas/minor-mode))
(eval-after-load "Projectile" '(diminish 'projectile-mode))
(eval-after-load "ruby-block" '(diminish 'ruby-block-mode))


(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))

(push ".DS_Store" dired-omit-extensions)

(setq ag-highlight-search t)
(setq ag-reuse-buffers 't)



;; Reuse dired buffers
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (setq dired-omit-mode t)
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))     ; was dired-up-directory
            ))

(ido-vertical-mode 1)
(persp-mode 1)

(require 'visual-regexp-steroids)

;; emacs-lisp
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))
