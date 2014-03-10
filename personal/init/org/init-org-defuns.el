(require 'org)

;;;;; custom functions
(defun org-gtd/schedule-for-tomorrow-agenda ()
  (interactive)
  (org-agenda-schedule nil "+"))

(defun org-gtd/schedule-for-tomorrow ()
  (interactive)
  (org-schedule nil "+"))

(defun dtk/toggle-flag ()
  (interactive)
  ;; org-agenda-mode
  (if (eq major-mode 'org-agenda-mode)
      (progn
        (org-agenda-goto)
        (dtk/toggle-flag-helper)
        (other-window -1)
        (org-agenda-redo))
    (dtk/toggle-flag-helper)
    ))

(defun dtk/toggle-flag-helper ()
  (let ((flagged (org-entry-get nil "FLAGGED")))
    (if flagged
        (org-delete-property "FLAGGED" "PROPERTIES")
      (org-entry-put nil "FLAGGED" "t"))))

;; source: http://dl.dropboxusercontent.com/u/3968124/sacha-emacs.html#sec-1-5-10-5
;; (defun my/org-agenda-mark-done-and-add-followup ()
;;   "Mark the current TODO as done and add another task after it.
;; Creates it at the same level as the previous task, so it's better to use
;; this with to-do items than with projects or headings."
;;   (interactive)
;;   (org-agenda-todo "DONE")
;;   (org-agenda-switch-to)
;;   (org-capture 0 "t"))
;; ;; Override the key definition
;; (define-key org-agenda-mode-map "X" 'my/org-agenda-mark-done-and-add-followup)

(provide 'init-org-defuns)
