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
