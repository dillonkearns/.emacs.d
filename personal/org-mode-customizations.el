(setq org-base-path "~/Dropbox/org")

(setq org-return-follows-link t)

(defun capture-work-note ()
  (interactive)
  (cd (format "%s/%s" org-base-path "work"))
  (call-interactively 'find-file)
)
