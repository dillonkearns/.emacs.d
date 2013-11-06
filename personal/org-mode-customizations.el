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
