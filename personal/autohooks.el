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
     (require 'rbenv)
     (global-rbenv-mode)
     (setq rbenv-show-active-ruby-in-modeline nil)

     (require 'ruby-block)
     (setq ruby-block-highlight-toggle 'overlay)
     (setq ruby-block-highlight-toggle t)
     (setq ruby-block-highlight-toggle 'minibuffer)

     (ruby-block-mode t)
))
