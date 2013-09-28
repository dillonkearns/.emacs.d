;; diff-hl

(defface diff-hl-insert
  '((default :inherit diff-added)
    (((class color)) :foreground "green4" :background "green4"))
  "Face used to highlight inserted lines."
  :group 'diff-hl)

(defface diff-hl-delete
  '((default :inherit diff-removed)
    (((class color)) :foreground "red3" :background "red3"))
  "Face used to highlight deleted lines."
  :group 'diff-hl)

(defface diff-hl-change
  '((default :foreground "blue3" :background "blue3")
    (((class color) (min-colors 88) (background light))
     :background "#ddddff")
    (((class color) (min-colors 88) (background dark))
     :background "#333355"))
  "Face used to highlight changed lines."
  :group 'diff-hl)
