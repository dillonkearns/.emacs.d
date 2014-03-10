(defun org-gtd/top-level-headings ()
  (let ((headings nil) (more-headings-to-traverse t))
    (save-excursion
      (goto-char (point-min))
      (org-forward-heading-same-level nil t)
      (while more-headings-to-traverse
        (let ((heading (substring-no-properties (org-get-heading))))
          (setq headings (append headings (list heading))))
        (setq more-headings-to-traverse (org-goto-sibling))))
    headings))

(defun org-gtd/paste-subtree-in-top-level-heading (destination-heading)
  (let ((more-headings-to-traverse t))
    (goto-char (point-min))
    (org-forward-heading-same-level nil t)
    (while more-headings-to-traverse
      (let ((heading (substring-no-properties (org-get-heading))))
        (if (string= heading destination-heading)
            (progn
              (end-of-line)
              (org-paste-subtree)
              (setq more-headings-to-traverse nil))))
      (setq more-headings-to-traverse (org-goto-sibling)))))


(defun org-gtd/organize-subtree ()
  (interactive)
  (save-excursion (let ((destination-heading (ido-completing-read "Move subtree to:" (org-gtd/top-level-headings))))
     (org-cut-subtree)
     (org-gtd/paste-subtree-in-top-level-heading destination-heading))))

(defun org-gtd/someday-refile ()
  (interactive)
  (let ((org-refile-targets '(
                              ("personal.org" :regexp . "Inbox")
                              ("work.org" :regexp . "Inbox")
                              ("leisure.org" :regexp . "Inbox")
                              ("personal-someday.org" :regexp . "Inbox")
                              ("work-someday.org" :regexp . "Inbox")
                              ("leisure-someday.org" :regexp . "Inbox")
                              ("productivity.org" :regexp . "Inbox")
                              )))
    (org-refile)
))

(provide 'org-gtd)
