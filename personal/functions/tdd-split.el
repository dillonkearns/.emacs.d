(defun dtk-tdd-split ()
  (interactive)
  (let ((test-file-path (projectile-completing-read "Test file: " (projectile-current-project-test-files))))
    (delete-other-windows)
    (find-file (expand-file-name test-file-path (projectile-project-root)))
    (find-file-other-window (expand-file-name (dtk-matching-code-file-path test-file-path) (projectile-project-root)))
    (other-window 1)
))

(defun dtk-matching-code-file-name (test-file-path)
  "Strip _test from the file-name"
  (replace-regexp-in-string "_test" "" (file-name-nondirectory test-file-path))
)

(defun dtk-matching-files (file-name-to-match)
  "Return project files matching pattern"
  (delq nil
        (mapcar (lambda (file-name)
          (and (string-match file-name-to-match file-name) file-name)) (projectile-current-project-files)))
)

(defun dtk-matching-code-file-path (test-file-path)
  "Return code file if unique, otherwise return result of a projectile-completing-read"
  (dtk-matching-files (dtk-matching-code-file-name test-file-path))
    (if (= (length (dtk-matching-files (dtk-matching-code-file-name test-file-path))) 0)
        (throw 'no-test-file (format "No project file matches'%s'" test-file-path))
      )

    (if (> (length (dtk-matching-files (dtk-matching-code-file-name test-file-path))) 1)
      (projectile-completing-read "Choose code file:" (dtk-matching-files (dtk-matching-code-file-name test-file-path)))
      (car (dtk-matching-files (dtk-matching-code-file-name test-file-path)))
))

(provide 'tdd-split)
