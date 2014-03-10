(require 'org)

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

(provide 'init-org-custom-agenda)
