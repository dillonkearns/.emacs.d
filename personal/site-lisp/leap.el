(require 'org)

(defvar leap-org-capture-templates
      '(
        ("p" "Personal" entry (file+headline "~/Dropbox/org/gtd/personal.org" "Inbox") "* TODO %?\n  %c\n")
        ("w" "Work" entry (file+headline "~/Dropbox/org/gtd/work.org" "Inbox") "* TODO %?\n  %c\n")
))

(defun leap ()
  (interactive)
  (let ((org-capture-templates leap-org-capture-templates))
    (org-capture)
    ))

(provide 'leap)
