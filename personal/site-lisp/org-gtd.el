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

(provide 'org-gtd)
