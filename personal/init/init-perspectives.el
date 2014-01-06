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

   (custom-persp "org"
                 (find-file (f-join gtd-base-path "work.org"))
                 (find-file (f-join gtd-base-path "personal.org")))

   (custom-persp "emacs.d"
                 (find-file "~/.emacs.d/personal"))

   (custom-persp "gearup"
                 (find-file "~/opensource/gearup"))

   ))

(defun invoca/web-1 ()
  (interactive)
  (custom-persp "1"
                (find-file "~/work/web")))

(defun invoca/web-2 ()
  (interactive)
  (custom-persp "2"
                (find-file "~/work/web2")))

(defun invoca/web-3 ()
  (interactive)
  (custom-persp "3"
                (find-file "~/work/web3")))

(provide 'init-perspectives)
