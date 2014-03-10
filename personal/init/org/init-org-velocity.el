(require 'org)
(require 'org-velocity)

(setq org-velocity-bucket (expand-file-name "velocity.org" org-directory))
(setq org-velocity-always-use-bucket t)
(setq org-velocity-force-new t)

;; TODO: figure out how to force file to use
;; (org-velocity-read)

(provide 'init-org-velocity)
