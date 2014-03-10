(require 'org)

(setq org-capture-templates
      '(
        ("r" "Retro" entry (file+headline "~/Dropbox/org/gtd/retro.org" "Inbox") "* TODO %?\n")
        ("w" "Work" entry (file+headline "~/Dropbox/org/gtd/work.org" "Inbox") "* TODO %?\n")
        ("p" "Personal" entry (file+headline "~/Dropbox/org/gtd/personal.org" "Inbox") "* TODO %?\n")
        ))

(require 'leap)

(provide 'init-org-capture)
