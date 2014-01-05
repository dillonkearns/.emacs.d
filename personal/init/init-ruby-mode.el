(setq ruby-insert-encoding-magic-comment nil)

(require 'ruby-test-mode)

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
  "Run test command in iTerm."
  (interactive)
  (do-applescript (format
  "
tell application \"iTerm\"
		tell the current session of current terminal
			write text \"%s\"
		end tell
	end tell

" (ruby-test-command (buffer-file-name)))))

(provide 'init-ruby-mode)
