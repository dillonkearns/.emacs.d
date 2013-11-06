(defun dtk-autohooks ()
  (interactive)
  (dolist (path (directory-files (concat prelude-personal-dir "/" "hooks") t ".*el$"))
    (let* ((mode       (file-name-nondirectory (file-name-sans-extension path)))
           (hook-name  (intern (concat mode "-hook")))
           (defun-name (intern (concat "rwd-" mode "-hook")))
           (lisp       (read-file-to-string path)))
      (eval (read (concat "(defun " (symbol-name defun-name) " () " lisp ")")))
      (and (functionp defun-name)
           (remove-hook hook-name defun-name))
      (add-hook hook-name defun-name))))





(eval-after-load 'ruby-mode
  '(progn
     (require 'ruby-block)
     (setq ruby-block-highlight-toggle 'overlay)
     (setq ruby-block-highlight-toggle t)
     (setq ruby-block-highlight-toggle 'minibuffer)

     (ruby-block-mode t)
     (ruby-test-mode t)
     (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)
))


(defun dtk-run-test-command ()
  "TODO"
  (interactive)
  (do-applescript (format
  "
tell application \"iTerm\"
		tell the current session of current terminal
			write text \"%s\"
		end tell
	end tell

" (ruby-test-command (buffer-file-name))))
)
