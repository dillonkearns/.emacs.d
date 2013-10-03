(global-linum-mode t)
(setq vc-follow-symlinks t)
(setq ruby-insert-encoding-magic-comment nil)
(global-set-key [remap move-beginning-of-line]
                'move-beginning-of-line)

(setq rbenv-show-active-ruby-in-modeline nil)
(setq ace-jump-mode-scope 'window)


;; Based on: http://programmers.stackexchange.com/a/19683
;; Original idea from: http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (progn
        (comment-or-uncomment-region (line-beginning-position) (line-end-position))
        (next-line)
        )
    (comment-dwim arg)))
(global-set-key "\M-;" 'comment-dwim-line)
