(require 'org)

(setq org-fast-tag-selection-single-key t)

(setq org-directory "~/Dropbox/org")

(setq org-return-follows-link t)
(org-agenda-files '("~/Dropbox/org/gtd/work.org" "~/Dropbox/org/gtd/personal.org"))

(setq org-src-fontify-natively 't)

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

;; DTK: figure out what to set the background to
;; (set-face-attribute 'org-block-background nil :background "#f0f0e8")

(setq org-use-property-inheritance t)

;; Got "SCHEDULED=\"\"|SCHEDULED<=\"<now>\"" tip from Carstien's comment at http://comments.gmane.org/gmane.emacs.orgmode/47863
(defvar dtk/org-filter-flagged-todo "SCHEDULED=\"\"&DEADLINE=\"\"&FLAGGED=\"t\"|SCHEDULED<=\"<now>\"&DEADLINE=\"\"&FLAGGED=\"t\"/TODO")
(defvar dtk/org-filter-unflagged-todo "SCHEDULED=\"\"&DEADLINE=\"\"&FLAGGED=\"\"|SCHEDULED<=\"<now>\"&DEADLINE=\"\"&FLAGGED=\"\"/TODO")
(defvar dtk/org-filter-wf "SCHEDULED=\"\"|SCHEDULED<=\"<now>\"/WF")
(setq org-agenda-custom-commands
      '(
        ("w" "Work"
         (
          (agenda "" ((org-agenda-time-grid nil)
                      (org-agenda-ndays 1)
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-deadline-warning-days 30)
                      (org-agenda-entry-types '(:deadline))))
          (tags-todo "DEADLINE<=\"<+1w>\""
                     ((org-agenda-overriding-header "\nDue this week\n------------------\n")
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-deadline-warning-days 30)
                      (org-agenda-entry-types '(:deadline))
                      ))
          (tags-todo dtk/org-filter-flagged-todo
                     ((org-agenda-overriding-header "\Flagged TODO\n------------------\n")))
          (tags-todo dtk/org-filter-unflagged-todo
                     ((org-agenda-overriding-header "\TODO\n------------------\n")))
          (tags-todo dtk/org-filter-wf
                     ((org-agenda-overriding-header "\WF\n------------------\n")))
          )
         ((org-enforce-todo-dependencies t)
          (org-agenda-dim-blocked-tasks 'invisible)
          (org-show-hierarchy-above t)
          (org-show-following-heading t)
          (org-agenda-prefix-format "")
          (org-agenda-files (list "~/Dropbox/org/gtd/work.org"))
          ))
        ("p" "Personal"
         (
          (agenda "" ((org-agenda-time-grid nil)
                      (org-agenda-ndays 1)
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-deadline-warning-days 30)
                      (org-agenda-entry-types '(:deadline))))
          (tags-todo "DEADLINE<=\"<+1w>\""
                     ((org-agenda-overriding-header "\nDue this week\n------------------\n")
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-deadline-warning-days 30)
                      (org-agenda-entry-types '(:deadline))
                      ))
          (tags-todo dtk/org-filter-flagged-todo
                     ((org-agenda-overriding-header "\nTODO\n------------------\n")))
          (tags-todo dtk/org-filter-unflagged-todo
                     ((org-agenda-overriding-header "\nTODO\n------------------\n")))
          (tags-todo (concat dtk/org-filter-wf)
                     ((org-agenda-overriding-header "\nWF\n------------------\n")))
          )
         ((org-enforce-todo-dependencies t)
          (org-agenda-dim-blocked-tasks 'invisible)
          (org-agenda-files (list "~/Dropbox/org/gtd/personal.org"))
          ))

))


(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-enforce-todo-dependencies t)



;; (setq org-agenda-todo-ignore-scheduled 'future)
(setq org-enforce-todo-dependencies t)


(setq org-capture-templates
      '(
        ("r" "Retro" entry (file+headline "~/Dropbox/org/gtd/retro.org" "Inbox") "* TODO %?\n")
        ("w" "Work" entry (file+headline "~/Dropbox/org/gtd/work.org" "Inbox") "* TODO %?\n")
        ("p" "Personal" entry (file+headline "~/Dropbox/org/gtd/personal.org" "Inbox") "* TODO %?\n")
        ))

(setq org-todo-keywords
      '((sequence "TODO(t)" "WF(w)" "|" "DONE(d)" "CANCELLED(l)")))

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

;; org-velocity
(require 'org-velocity)
(setq org-velocity-bucket (expand-file-name "velocity.org" org-directory))
(setq org-velocity-always-use-bucket t)
(setq org-velocity-force-new t)

;; TODO: figure out how to force file to use
;; (org-velocity-read)

(require 'leap)

(add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))

;;;;; custom functions
(defun org-gtd/schedule-for-tomorrow-agenda ()
  (interactive)
  (org-agenda-schedule nil "+"))

(defun org-gtd/schedule-for-tomorrow ()
  (interactive)
  (org-schedule nil "+"))

(defun dtk/toggle-flag ()
  (interactive)
  ;; org-agenda-mode
  (if (eq major-mode 'org-agenda-mode)
      (progn
       (org-agenda-goto)
       (dtk/toggle-flag-helper)
       (other-window -1)
       (org-agenda-redo))
    (dtk/toggle-flag-helper)
    ))

(defun dtk/toggle-flag-helper ()
  (let ((flagged (org-entry-get nil "FLAGGED")))
    (if flagged
        (org-delete-property "FLAGGED" "PROPERTIES")
      (org-entry-put nil "FLAGGED" "t"))))




;; source: http://dl.dropboxusercontent.com/u/3968124/sacha-emacs.html#sec-1-5-10-5
;; (defun my/org-agenda-mark-done-and-add-followup ()
;;   "Mark the current TODO as done and add another task after it.
;; Creates it at the same level as the previous task, so it's better to use
;; this with to-do items than with projects or headings."
;;   (interactive)
;;   (org-agenda-todo "DONE")
;;   (org-agenda-switch-to)
;;   (org-capture 0 "t"))
;; ;; Override the key definition
;; (define-key org-agenda-mode-map "X" 'my/org-agenda-mark-done-and-add-followup)



(provide 'init-org)
