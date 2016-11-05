(require 'company)

(defun config-python-venv ()
  (interactive)
  (require 'projectile)
  (let* ((path-dir (car (projectile-get-project-directories)))
         (venv-path (concat path-dir "venv")))
    (if (file-directory-p venv-path)
        (setq python-shell-virtualenv-path venv-path)
        (setq python-shell-virtualenv-path "~/.emacs.d/.python-environments/default")
      )))

(add-hook 'python-mode-hook
          (lambda()
            (config-python-venv)
            (jedi:setup)
            (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)))
