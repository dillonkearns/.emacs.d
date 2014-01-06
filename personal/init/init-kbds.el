(defun define-kbds (mode-map kbd-pairs-list)
  "Iterate through list of paris"
  (-each kbd-pairs-list (lambda (keymap-pair)
                       (let ((key-binding (car keymap-pair)) (command (cdr keymap-pair)))
                         (define-key mode-map (kbd key-binding) command)))))

(require 'prelude-mode)
(require 'init-font-faces)

(define-prefix-command 'dtk-map)
(global-set-key (kbd "C-.") 'dtk-map)

(define-kbds prelude-mode-map '(
                   ;; super keys
                   ("M-s-g"       . ag)
                   ("s-g"         . ag-project)
                   ("s-G"         . ag-project-regexp)
                   ("s-b"         . projectile-switch-to-buffer)
                   ("s-t"         . projectile-find-test-file)
                   ("s-T"         . dtk-tdd-split)
                   ("s-S"         . dtk/open-root-in-source-tree)
                   ("s-j"         . persp-switch)
                   ("s-1"         . invoca/web-1)
                   ("s-2"         . invoca/web-2)
                   ("s-3"         . invoca/web-3)

                   ;; magit
                   ("s-m c"         . magit-checkout)


                   ("<C-return>"         . other-window)
                   ("C-o"         . other-window)
                   ("C-%"         . vr/query-replace)

                   ("C-c C-o"     . toggle-window-split)

                   ("M-P"         . move-text-up)
                   ("M-N"         . move-text-down)
                   ("C-c C-,"     . ert-results-rerun-all-tests)

                   ;; ace-jump-mode
                   ("C-c C-j"     . jump-to-corresponding)
                   ("C-c C-k"         . ace-jump-word-mode)
                   ("C-c C-l"         . ace-jump-line-mode)

                   ("s-="         . increase-default-font-height)
                   ("s--"         . decrease-default-font-height)

                   ;; multiple-cursors
                   ("C-S-c C-S-c" . mc/edit-lines)
                   ("C->"         . mc/mark-next-like-this)
                   ("C-<"         . mc/mark-previous-like-this)
                   ("C-c C-<"     . mc/mark-all-like-this)

                   ;; org-mode
                   ("C-c c"       . org-capture)
                   ("s-v"         . org-velocity)

                   ))
;; DTK: get this to work (don't use this binding in org-mode. Only prog modes?)
;; ("C-c C-l"     . dash-at-point)

(require 'org)
(define-kbds org-mode-map '(
                            ("C-M-p"       . org-move-subtree-up)
                            ("C-M-n"       . org-move-subtree-down)
                            ))
(define-kbds dtk-map '(
                       ("C-f"     .     dtk/toggle-flag)
                       ("C-o"     .     org-toggle-ordered-property)

                            ))

;; (require 'phi-search)
;; (global-set-key (kbd "C-s") 'phi-search)
;; (global-set-key (kbd "C-r") 'phi-search-backward)

;; (global-set-key (kbd "C-s") 'isearch-forward)
;; (global-set-key (kbd "C-r") 'isearch-backward)

;; ("M-p"         . diff-hl-previous-hunk)
;; ("M-n"         . diff-hl-next-hunk)

(global-set-key (kbd "M-p") 'diff-hl-previous-hunk)
(global-set-key (kbd "M-n") 'diff-hl-next-hunk)

(provide 'init-kbds)
