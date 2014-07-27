(prelude-eval-after-init
 (progn
   (persp-mode 1)
   (require 'perspective)
   (require 'f)

   (defmacro custom-persp (name &rest body)
     `(let ((initialize (not (gethash ,name perspectives-hash)))
            (current-perspective persp-curr))
        (persp-switch ,name)
        (when initialize ,@body)
        (setq persp-last current-perspective)))

   (defvar gtd-base-path (f-join org-directory "gtd"))

   (custom-persp "emacs.d"
                 (find-file "~/.emacs.d/personal"))

   (custom-persp "org"
                 (find-file (f-join gtd-base-path "personal.org"))
                 (find-file (f-join gtd-base-path "work.org")))

   ))

(defun invoca/web-1 ()
  (interactive)
  (custom-persp "1"
                (find-file "~/work/web1")))

(defun invoca/web-2 ()
  (interactive)
  (custom-persp "2"
                (find-file "~/work/web2")))

(defun invoca/web-3 ()
  (interactive)
  (custom-persp "3"
                (find-file "~/work/web3")))

(defun invoca/web-4 ()
  (interactive)
  (custom-persp "4"
                (find-file "~/work/web4")))

(provide 'init-perspectives)
