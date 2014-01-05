(defun dtk/open-root-in-source-tree ()
  (interactive)
  (shell-command-to-string "open -a SourceTree $(git rev-parse --show-toplevel)"))

(provide 'open-in-source-tree)
