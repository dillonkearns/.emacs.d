;; start a server so we only have to open emacs once at startup
(server-start)

(add-to-list 'load-path (expand-file-name "site-lisp" prelude-personal-dir))
(add-to-list 'load-path (expand-file-name "init" prelude-personal-dir))
;; recursively load init
(require 'f)
;; (add-to-list 'load-path (f-directories (expand-file-name "init" prelude-personal-dir) nil t))

(require 'dash)
(-each (f-directories (expand-file-name "init" prelude-personal-dir)) (lambda (init-dir) (add-to-list 'load-path (expand-file-name init-dir))))

(add-to-list 'load-path (expand-file-name "functions" prelude-personal-dir))
(require 'init-packages)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-linum-mode t)           ;; show line numbers
(setq vc-follow-symlinks t)     ;; go to symlinked files without asking


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;
;; rbenv
;;;;;;;;;
(setq rbenv-executable "/usr/local/bin/rbenv")
(add-to-list 'load-path (expand-file-name "/usr/local/bin/rbenv"))
(require 'rbenv)
(setq rbenv-show-active-ruby-in-modeline nil)


(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(global-rbenv-mode)

;;;;;;;;;
;; dired
;;;;;;;;;
(require 'dired-x)
(push ".DS_Store" dired-omit-extensions)

;; hide file permissions, timestamps, etc. by default
(require 'dired-details+)

;; Reuse dired buffers
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-mode-hook
          (lambda ()
            (setq dired-omit-mode t)
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))     ; was dired-up-directory

;;;;;;;;;
;; ace-jump-mode
;;;;;;;;;
(require 'ace-jump-mode)
(setq ace-jump-mode-scope 'window)  ;; don't try to jump to other buffers

;;;;;;;;;
;; ag
;;;;;;;;;
(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-buffers 't)

;;;;;;;;;
;; ido
;;;;;;;;;
(ido-vertical-mode 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)
(require 'magit)
(setq magit-completing-read-function 'magit-ido-completing-read)
(require 'org)
(setq org-completion-use-ido t)

;; use flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq projectile-completion-system 'ido)


;; visual-regexp-steroids
(require 'visual-regexp-steroids)

;;;;;;;;;
;; multiple-cursors
;;;;;;;;;
(setq mc/list-file (expand-file-name prelude-personal-dir ".mc-lists.el"))

;;;;;;;;;
;; diff-hl
;;;;;;;;;
(add-hook 'scss-mode-hook (lambda () (diff-hl-mode 1)))
(add-hook 'scss-mode-hook (lambda () (whitespace-mode 1)))
(add-hook 'git-commit-commit-hook 'diff-hl-update)


;;;;;;;;;
;; color-theme
;;;;;;;;;


;; miscelaneous
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook (lambda ()
                                   (prelude-mode 1)

                             (god-local-mode 1)
                                   ))


;; use moe-dark color theme instead of zenburn
(disable-theme 'zenburn)
(require 'rubytapas-theme)
(load-theme 'rubytapas)
;; (load-theme 'zenburn t)
;; (load-theme 'moe-dark t)
;; (load-theme 'moe-light t)

;; personal/init files
(require 'init-diminish)
(require 'init-smartparens)
(require 'init-org)
;; (require 'init-overtone)
(require 'init-yasnippet)
(require 'init-kbds)
(require 'init-auto-modes)
(require 'init-prelude-overrides)
(require 'init-ruby-mode)
(require 'init-diff-hl-mode)
(require 'init-font-faces)
(require 'init-god-mode)

;; personal/site-lisp
(require 'invoca)
(require 'org-gtd)
(require 'rcodetools)

;; personal/functions
(require 'font-helpers)
(require 'jump-to-corresponding)
(require 'tdd-split)
(require 'open-in-source-tree)
(require 'window-helpers)
(require 'monkey-patches)

;; setup perspectives once initialization is complete
(require 'init-perspectives)
(require 'persp-projectile)

(set-default-font "Source Code Pro")

;; performance
(setq gc-cons-threshold 20000000)
