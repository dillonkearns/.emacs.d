(setq standup-notes-dir (expand-file-name "standup" org-base-path))

(defun tomorrow() (seconds-to-time (+ (time-to-seconds (current-time)) 86400)))

(defun before-standup-p ()
  "t if it's before 9:00AM"
  (< (string-to-int (format-time-string "%H")) 9)
)

(defun standup-file-date ()
  "Take notes for today if in the morning before standup, otherwise notes are for tomorrow's standup"
  (if (before-standup-p)
      (current-time)
      (tomorrow)
  )
)

(defun standup-file-name ()
  (let (date (standup-file-date))
    (expand-file-name
     (format "%s.org" (format-time-string "%Y-%m-%d" date))
     standup-notes-dir)
))
