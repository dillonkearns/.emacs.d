(require 'perspective)
(require 'f)

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

(defvar org-base-path "~/Dropbox/org")
(defvar gtd-base-path (f-join org-base-path "gtd"))

(custom-persp "gtd-work"
              (find-file (f-join gtd-base-path "work.org")))

(custom-persp "gtd-personal"
              (find-file (f-join gtd-base-path "personal.org")))

(custom-persp "emacs.d"
              (find-file "~/.emacs.d/personal"))

(custom-persp "1"
              (find-file "~/work/web"))

(custom-persp "2"
              (find-file "~/work/web2"))
