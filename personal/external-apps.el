(defun dtk/open-root-in-source-tree ()
  (interactive)
    (shell-command-to-string "open -a SourceTree $(git rev-parse --show-toplevel)")
)

(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command 
   (format "open -a /Applications/Marked.app %s" 
       (shell-quote-argument (buffer-file-name))))
)
