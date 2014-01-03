(require 'org)
(setq org-directory "~/Dropbox/org")

(setq org-return-follows-link t)
(org-agenda-files '("~/Dropbox/org/gtd/work.org" "~/Dropbox/org/gtd/personal.org" "~/Dropbox/org/gtd/inbox.org"))

(setq org-capture-templates
      '(("s"
         "standup"
         entry
         (file (standup-file-name))
         "* TODO %?"))
)

(setq org-src-fontify-natively 't)

;; mailplane support
(org-add-link-type "mailplane" 'mailplane-open)

(defun mailplane-open (path)
  "Visit the manpage on PATH.
     PATH should be a topic that can be thrown at the man command."
  (message (format "open mailplane:%s"  path))
  (shell-command (format "open mailplane:%s"  path)))

(setq org-agenda-custom-commands
      '(("w" . "Work")
        ("wi" "Individual flagged"
         ((agenda "FLAGGED/!TODO")
          (tags-todo "FLAGGED/!TODO"))
         ((org-agenda-files (list "~/Dropbox/org/gtd/work.org")))
         )
        ("wI" "Individual all"
         ((agenda "/!TODO")
          (tags-todo "/!TODO"))
         ((org-agenda-files (list "~/Dropbox/org/gtd/work.org")))
         )
        ("wt" "Team flagged"
         ((agenda "FLAGGED/!TEAM")
          (tags-todo "FLAGGED/!TEAM"))
         ((org-agenda-files (list "~/Dropbox/org/gtd/work.org"))))

        ("wT" "Team all"
         ((agenda "/!TEAM")
          (tags-todo "/!TEAM"))
         ((org-agenda-files (list "~/Dropbox/org/gtd/work.org"))))
))
(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-enforce-todo-dependencies t)
(setq org-capture-templates
      '(
        ("w" "Work" entry (file+headline "~/Dropbox/org/gtd/work.org" "Inbox") "* TODO %?\n")
        ("p" "Personal" entry (file+headline "~/Dropbox/org/gtd/personal.org" "Inbox") "* TODO %?\n")
        ))

(setq org-todo-keywords
      '((sequence "TODO" "PROJECT" "SOMEDAY" "WF" "|" "DONE" "CANCELLED")))

;; old zenburn custom faces
;; (setq org-todo-keyword-faces
;;       '(
;;         ("TODO" :foreground "#5F7F5F" :weight bold)
;;         ("TEAM" :foreground "#4C7073" :weight bold)
;;         ("PROJECT" :foreground "#DC8CC3" :weight bold)
;;         ("WF" :foreground "#8C5353" :weight bold)
;;         ))

;; ("SOMEDAY" :foreground "#7F7F7F" :weight bold)


;; org-velocity
(require 'org-velocity)
(setq org-velocity-bucket (expand-file-name "velocity.org" org-directory))
(setq org-velocity-always-use-bucket t)
(setq org-velocity-force-new t)
(eval-after-load 'org-mode
  '(progn (whitespace-mode -1)
     ))

(defun dtk/toggle-flag ()
  (interactive)
  (let (
        (flagged (org-entry-get nil "FLAGGED")))
    (if flagged
        (org-delete-property "FLAGGED" "PROPERTIES")
      (org-entry-put nil "FLAGGED" "t"))))

