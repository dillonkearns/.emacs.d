;; diff-hl

(defface diff-hl-change
  '((default :foreground "blue3")
    (((class color) (min-colors 88) (background light))
     :background "#ddddff")
    (((class color) (min-colors 88) (background dark))
     :background "#2222ff"))
  "Face used to highlight changed lines."
  :group 'diff-hl)

(defface diff-hl-delete
  '((default :foreground "red3")
    (((class color) (min-colors 88) (background light))
     :background "#ffdddd")
    (((class color) (min-colors 88) (background dark))
     :background "#663333"))
  "Face used to highlight deleted lines."
  :group 'diff-hl)

(defface diff-hl-insert
  '((default :foreground "green4")
    (((class color) (min-colors 88) (background light))
     :background "#ddffdd")
    (((class color) (min-colors 88) (background dark))
     :background "#336633"))
  "Face used to highlight deleted lines."
  :group 'diff-hl)

;; powerline

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#538053" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
