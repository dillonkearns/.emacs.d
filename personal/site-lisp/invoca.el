(require 's)

(defvar invoca/rbenv-version
  "ree-1.8.7-2012.02"
  "Default ruby version")

(defvar invoca/sshnode-dir
  "~/current"
  "Default directory for find-file when calling sshnode.")

(defun invoca/exec-command (shell-command)
  "Execute a shell command with the invoca ruby version and return its output"
  (s-chomp (shell-command-to-string (invoca/format-command shell-command))))

(defun invoca/format-command (shell-command)
  "Execute a shell command with the invoca ruby version and return its output"
  (format "RBENV_VERSION=%s %s" invoca/rbenv-version shell-command))


(defun invoca/sshnode (&optional node-name)
  (interactive)
  (let* (
         (node-name (or node-name (invoca/select-node)))
         (ip-address (invoca/exec-command (format "knife node show %s | awk '/IP:/ { print $2 }'" node-name)))
         )
    (ido-find-file-in-dir (format "/ssh:ringrevenue@%s:%s" ip-address invoca/sshnode-dir))
    ))

(defun invoca/knife-node-show (&optional node-name)
  (interactive)
  (let* (
         (node-name (or node-name (invoca/select-node)))
         (command-output (invoca/exec-command (format "knife node show %s" node-name)))
         (buffer-name (format "*node show %s*" node-name))
         )


    (let ((output-buffer (get-buffer-create buffer-name)))
      (switch-to-buffer output-buffer)
      (insert command-output)
      (view-mode)
      )
))

(defun invoca/select-node ()
  (let ((node-list (s-split "\n" (invoca/exec-command "knife node list"))))
    (ido-completing-read "Choose a server:" node-list)
    )
  )

(provide 'invoca)
