(setq org-base-path "~/Dropbox/org")

(setq org-return-follows-link t)

(defun capture-work-note ()
  (interactive)
  (cd (format "%s/%s" org-base-path "work"))
  (call-interactively 'find-file)
)

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
(defun dtk/toggle-flag ()
  (interactive)
  (let (
        (flagged (org-entry-get nil "FLAGGED")))
    (if flagged
        (org-delete-property "FLAGGED" "PROPERTIES")
      (org-entry-put nil "FLAGGED" "t"))))

