(require 'org)

(setq org-fast-tag-selection-single-key t)

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
(defun mailplane-open (path)
  "Visit the manpage on PATH.
     PATH should be a topic that can be thrown at the man command."
  (message (format "open mailplane:%s"  path))
  (shell-command (format "open mailplane:%s"  path)))

(org-add-link-type "mailplane" 'mailplane-open)


;; DTK: figure out what to set the background to
;; (set-face-attribute 'org-block-background nil :background "#f0f0e8")

(setq org-use-property-inheritance t)

;; Got tip from Carstien's comment at http://comments.gmane.org/gmane.emacs.orgmode/47863
(defvar dtk/org-scheduled-filter-string "SCHEDULED=\"\"|SCHEDULED<=\"<now>\"")
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
          (tags-todo (concat "FLAGGED=\"t\"&" dtk/org-scheduled-filter-string "&FLAGGED=\"t\"/!TODO")
                     ((org-agenda-overriding-header "\nFlagged TODO\n------------------\n")))
          (tags-todo (concat "FLAGGED=\"t\"+" dtk/org-scheduled-filter-string "&FLAGGED=\"t\"/!WF")
                     ((org-agenda-overriding-header "\nFlagged WF\n------------------\n")))
          )
         ((org-enforce-todo-dependencies t)
          (org-agenda-dim-blocked-tasks 'invisible)
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
          (tags-todo (concat "FLAGGED=\"t\"&" dtk/org-scheduled-filter-string "&FLAGGED=\"t\"/!TODO")
                     ((org-agenda-overriding-header "\nFlagged TODO\n------------------\n")))
          (tags-todo (concat "FLAGGED=\"t\"+" dtk/org-scheduled-filter-string "&FLAGGED=\"t\"/!WF")
                     ((org-agenda-overriding-header "\nFlagged WF\n------------------\n")))
          )
         ((org-enforce-todo-dependencies t)
          (org-agenda-dim-blocked-tasks 'invisible)
          (org-agenda-files (list "~/Dropbox/org/gtd/personal.org"))
          ))

))
(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-enforce-todo-dependencies t)


(setq org-capture-templates
      '(
        ("r" "Retro" entry (file+headline "~/Dropbox/org/gtd/retro.org" "Inbox") "* TODO %?\n")
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

;; TODO: figure out how to force file to use
;; (org-velocity-read)

(require 'leap)

(add-hook 'org-mode-hook (lambda () (whitespace-mode -1)))

(defun dtk/toggle-flag ()
  (interactive)
  (let (
        (flagged (org-entry-get nil "FLAGGED")))
    (if flagged
        (org-delete-property "FLAGGED" "PROPERTIES")
      (org-entry-put nil "FLAGGED" "t"))))


;; TODO: this won't work until I remove the font lock pattern for properties

(defun font-lock-flagged ()
  "TODO"
  (font-lock-add-keywords
   nil '(("\\(:FLAGGED:\\)"
          1 font-lock-warning-face t))))

(add-hook 'org-mode-hook 'font-lock-flagged)

;; (defun flagged-p ()
;;   "TODO"
;;   (org-entry-get nil "FLAGGED")
;;   )

;; (defun flagged-p (limit)
;;   (and (save-excursion
;;          (re-search-forward ":FLAGGED:" limit)
;;                        )))

;; (font-lock-add-keywords 'org-mode
;;                         '((flagged-p . font-lock-warning-face)))

;; (org-drawer-regexp)
(setq font-lock-keywords (delq (assoc org-drawer-regexp font-lock-keywords) font-lock-keywords))
(setq font-lock-keywords (delq (assoc "^[ 	]*:\\(PROPERTIES\\|CLOCK\\|LOGBOOK\\|RESULTS\\):[ 	]*$" font-lock-keywords) font-lock-keywords))
;; (t (("\\(:FLAGGED:\\)" 1 font-lock-warning-face t) (org-font-lock-hook) ("^\\(\\**\\)\\(\\* \\)\\(.*\\)" (1 ...) (2 ...) (3 ...)) ("^[ 	]*\\(\\(|\\|\\+-[-+]\\).*\\S-\\)" (1 ... t)) ("^[ 	]*|\\(?:.*?|\\)? *\\(:?=[^|
;; ]*\\)" (1 ... t)) ("^[ 	]*| *\\([#*]\\) *|" (1 ... t)) ("^[ 	]*|\\( *\\([$!_^/]\\) *|.*\\)|" (1 ... t)) ("| *\\(<[lrc]?[0-9]*>\\)" (1 ... t)) ("^[ 	]*:\\(PROPERTIES\\|CLOCK\\|LOGBOOK\\|RESULTS\\):[ 	]*$" (0 ... t)) ("^[ 	]*:END:" (0 ... t)) ("^\\(?4:[ 	]*\\)\\(?1::\\(?2:.*?\\):\\)[ 	]+\\(?3:[^
;; ].*?\\)\\(?5:[ 	]*\\)$" (1 ... t) (3 ... t)) (org-activate-tags (1 ... prepend)) ...) ("\\(:FLAGGED:\\)" (1 font-lock-warning-face t)) (org-font-lock-hook (0 nil)) ("^\\(\\**\\)\\(\\* \\)\\(.*\\)" (1 (org-get-level-face 1)) (2 (org-get-level-face 2)) (3 (org-get-level-face 3))) ("^[ 	]*\\(\\(|\\|\\+-[-+]\\).*\\S-\\)" (1 (quote org-table) t)) ("^[ 	]*|\\(?:.*?|\\)? *\\(:?=[^|
;; ]*\\)" (1 (quote org-formula) t)) ("^[ 	]*| *\\([#*]\\) *|" (1 (quote org-formula) t)) ("^[ 	]*|\\( *\\([$!_^/]\\) *|.*\\)|" (1 (quote org-formula) t)) ("| *\\(<[lrc]?[0-9]*>\\)" (1 (quote org-formula) t)) ("^[ 	]*:\\(PROPERTIES\\|CLOCK\\|LOGBOOK\\|RESULTS\\):[ 	]*$" (0 (quote org-special-keyword) t)) ("^[ 	]*:END:" (0 (quote org-special-keyword) t)) ...)

(provide 'init-org)
