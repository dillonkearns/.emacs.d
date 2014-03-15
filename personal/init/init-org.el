(require 'org)

(setq org-fast-tag-selection-single-key t)

(setq org-directory "~/Dropbox/org")
(org-agenda-files '("~/Dropbox/org/gtd/work.org" "~/Dropbox/org/gtd/personal.org"))


;; mailplane support
(defun mailplane-open (path)
  "Visit the manpage on PATH.
     PATH should be a topic that can be thrown at the man command."
  (message (format "open mailplane:%s"  path))
  (shell-command (format "open mailplane:%s"  path)))

(org-add-link-type "mailplane" 'mailplane-open)

;; TODO: Something like this would be nice but it currently messes up C-c C-w for refiling something
;; within the same file... would be nice to have the ability to do both types of refiling in different functions.
;; (setq org-refile-targets '(("work.org" :maxlevel . 2)
;;                            ("personal.org" :level . 1)))

(setq org-src-fontify-natively 't)
;; DTK: figure out what to set the background to
;; (set-face-attribute 'org-block-background nil :background "#f0f0e8")

(setq org-return-follows-link t)
(setq org-enforce-todo-dependencies t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "WF(w)" "|" "DONE(d)" "CANCELLED(l)")))

(setq org-stuck-projects
      ;; level 1 is reserved for Areas of Focus
      ;; If it's not a top-level heading, and it doesn't have any TODO keywords, then it's a project
      ;; If it's a project but it doesn't have any TODO or WF items, then it is a stuck project
      '("+LEVEL>1/-TODO-WF-DONE-CANCELLED" ("TODO" "WF")))


;; custom TODO faces for zenburn theme
(setq org-todo-keyword-faces
      '(
        ;; ("TEAM" :foreground "#4C7073" :weight bold)
        ("TODO" :foreground "#D35083" :weight bold)
        ("WF" :foreground "#CFCFCF" :weight bold)
        ("DONE" :foreground "#00A954" :weight bold)
        ("CANCELLED" :foreground "#00A954" :weight bold)
        ;; :background "#5F5F5F"
        ))


(add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))

(require 'init-org-capture)
(require 'init-org-custom-agenda)
(require 'init-org-defuns)
(require 'init-org-velocity)

(provide 'init-org)
