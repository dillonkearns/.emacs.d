;; start a server so we only have to open emacs once at startup
(server-start)

(add-to-list 'load-path (expand-file-name "site-lisp" prelude-personal-dir))
(add-to-list 'load-path (expand-file-name "init" prelude-personal-dir))
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
(require 'rbenv)
(setq rbenv-show-active-ruby-in-modeline nil)
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

;; visual-regexp-steroids
(require 'visual-regexp-steroids)

;;;;;;;;;
;; multiple-cursors
;;;;;;;;;
(setq mc/list-file (expand-file-name prelude-personal-dir ".mc-lists.el"))

;;;;;;;;;
;; smartparens
;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook (lambda () (smartparens-global-mode 1)))

;;;;;;;;;
;; color-theme
;;;;;;;;;

;; use moe-dark color theme instead of zenburn
(disable-theme 'zenburn)
(load-theme 'moe-dark t)

;; personal/init files
(require 'init-diminish)
(require 'init-org)
(require 'init-overtone)
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

;; personal/functions
(require 'font-helpers)
(require 'jump-to-corresponding)
(require 'tdd-split)
(require 'open-in-source-tree)
(require 'window-helpers)
(require 'monkey-patches)

;; setup perspectives once initialization is complete
(require 'init-perspectives)
