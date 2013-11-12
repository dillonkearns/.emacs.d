;; global key bindings

(defun define-kbds (mode-map kbd-pairs-list)
  "Iterate through list of paris"
  (-each kbd-pairs-list (lambda (keymap-pair)
                       (let ((key-binding (car keymap-pair)) (command (cdr keymap-pair)))
                         (define-key mode-map (kbd key-binding) command)))))

(defvar dtk-keys-minor-mode-map
  (let ((map (make-keymap)))
    (define-kbds map '(
                       ;; super keys
                       ("M-s-g"       . ag)
                       ("s-g"         . ag-project)
                       ("s-G"         . ag-project-regexp)
                       ("s-b"         . projectile-switch-to-buffer)
                       ("s-t"         . projectile-find-test-file)
                       ("s-T"         . dtk-tdd-split)
                       ("s-S"         . dtk/open-root-in-source-tree)
                       ("s-j"         . persp-switch)
                       ("s-J"         . persp-switch-quick)
                       ("s-P"         . persp-switch-back)


                       ("C-o"         . other-window)
                       ("C-%"         . vr/query-replace)

                       ("M-p"         . diff-hl-previous-hunk)
                       ("M-n"         . diff-hl-next-hunk)
                       ("M-P"         . move-text-up)
                       ("M-N"         . move-text-down)
                       ("C-c C-l"     . dash-at-point)
                       ("C-c C-j"     . jump-to-corresponding)
                       ("C-c C-,"     . ert-results-rerun-all-tests)

                       ;; multiple-cursors
                       ("C-S-c C-S-c" . mc/edit-lines)
                       ("C->"         . mc/mark-next-like-this)
                       ("C-<"         . mc/mark-previous-like-this)
                       ("C-c C-<"     . mc/mark-all-like-this)

                       ;; org-mode
                       ("C-c c"       . org-capture)

))
    map)
  "My personal keymap."
)

(define-minor-mode dtk-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " dtk" 'dtk-keys-minor-mode-map)

(dtk-keys-minor-mode t)
