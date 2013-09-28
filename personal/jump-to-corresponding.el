;; source: http://ck.kennt-wayne.de/2013/may/emacs%3A-jump-to-matching-paren-beginning-of-block

(defun goto-match-paren (arg)
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t nil)
        )
  )

(defun goto-matching-ruby-block (arg)
  (cond
   ;; are we at an end keyword?
   ((equal (current-word) "end")
    (ruby-beginning-of-block))

   ;; or are we at a keyword itself?
   ((string-match (current-word) "\\(for\\|while\\|until\\|if\\|class\\|module\\|case\\|unless\\|def\\|begin\\|do\\)")
    (ruby-end-of-block)
    )

   ;; is there an end keyword anywhere on this line?
   ((string-match "end" (thing-at-point 'line))
    (ruby-beginning-of-block))

   ;; or are we at a keyword itself?
   (t (ruby-end-of-block))
   )
  )

(defun jump-to-corresponding (arg)
  (interactive "p")

  (if (or
       (looking-at "[\[\(\{]")
       (looking-at "[\]\)\}]")
       (looking-back "[\[\(\{]" 1)
       (looking-back "[\]\)\}]" 1))

      (goto-match-paren arg)

    (when (eq major-mode 'ruby-mode)
      (goto-matching-ruby-block arg)
      )

    )
  )
