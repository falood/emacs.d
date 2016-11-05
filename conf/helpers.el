;; Global modes
(global-highlight-parentheses-mode t)
(global-anzu-mode +1)
(global-undo-tree-mode)

(eldoc-mode)

(add-hook 'after-init-hook 'global-flycheck-mode)
(add-to-list 'auto-mode-alist '("\\.log'" . auto-revert-mode))

;; Web-mode json backend for restclient
(add-to-list 'auto-mode-alist '("\\.api" . restclient-mode))

;; AG
(require 'ag)
(setq ag-highlight-search 't)
(setq ag-reuse-buffers 't)
(setq ag-reuse-window 't)


;; Company Mode
(require 'company)
(add-to-list 'company-backends 'company-dabbrev)

(setq company-show-numbers t)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 4)

(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'company-dabbrev)

(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-i") 'company-complete)


;; Copy and comment
(defun copy-and-comment (beg end &optional region)
  (interactive (list (mark) (point)
    	     (prefix-numeric-value current-prefix-arg)))
  (let ((str (if region
                 (funcall region-extract-function nil)
               (filter-buffer-substring beg end))))
    (comment-region beg end region)
    (insert str)))

(global-set-key (kbd "s-; c") 'copy-and-comment)


;; Delete white space to next word.
(defun whack-whitespace (arg)
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
    (re-search-forward regexp nil t)
    (replace-match "" nil nil)))

(define-key global-map (kbd "s-; SPC") 'whack-whitespace)


;; Delete a line
(define-key global-map (kbd "s-; k") 'kill-whole-line)


;; Projectile
(setq projectile-cache-file "~/.emacs.d/cache/projectile.cache")
(setq projectile-enable-caching t)
(projectile-mode)


;; Counsel
(counsel-projectile-on)

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "s-i f") 'counsel-find-file)

(global-set-key (kbd "s-i b") 'ivy-switch-buffer)
(global-set-key (kbd "s-i s") 'counsel-grep-or-swiper)
(global-set-key (kbd "s-i a g") 'counsel-ag)

(global-unset-key (kbd "s-p"))
(global-set-key (kbd "s-p p") 'counsel-projectile-switch-project)
(global-set-key (kbd "s-p f") 'counsel-projectile-find-file)
(global-set-key (kbd "s-p b") 'counsel-projectile-switch-to-buffer)
(global-set-key (kbd "s-p a g") 'counsel-projectile-ag)


;; fasd
(global-set-key (kbd "s-i d") 'fasd-find-file)
(global-fasd-mode 1)


;; Ace jump
(ace-pinyin-global-mode)
(global-set-key (kbd "s-i c") 'ace-pinyin-jump-char-2)


;; Editor Config
(require 'editorconfig)


;; Multiple Cursors
(require 'multiple-cursors)
(setq mc/list-file "~/.emacs.d/cache/mc-lists.el")
(global-set-key (kbd "M-o") 'mc/edit-lines)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)


;; Eshell
(require 'pcomplete)
(setq eshell-highlight-prompt nil)
(setq eshell-prompt-regexp "^[^#$\n]*[#⟩]+ ")
(setq eshell-prompt-function
      (lambda ()
        (concat
         "\n"
         (propertize (abbreviate-file-name (eshell/pwd)) 'face `(:foreground "#2076c8"))
         (let ((s (magit-get-current-branch)))
           (when (stringp s)
               (concat " · (" (propertize s 'face `(:foreground "#dd8500")) ")")))
         "\n"
         (propertize (if (= (user-uid) 0) "#" "⟩") 'face `(:foreground "#35c200"))
         (propertize " " 'face `(:foreground "#298BAE"))
         )))

(add-hook 'eshell-mode-hook
          (lambda()
            (setq pcomplete-cycle-completions nil)
            (setq show-trailing-whitespace nil)
            (rename-buffer (generate-new-buffer-name "ESH"))
            (linum-mode 0)))

(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(add-hook 'term-mode-hook
          (lambda()
            (setq show-trailing-whitespace nil)
            (linum-mode 0)))


;; Magit
(require 'magit)
(setq magit-auto-revert-mode nil)
(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g l g") 'magit-log-current)
(global-set-key (kbd "s-g s t") 'magit-status)
(global-set-key (kbd "s-g d s") 'magit-diff-staged)
(global-set-key (kbd "s-g d d") 'magit-diff-unstaged)
(global-set-key (kbd "s-g b r") 'magit-branch-manager)
(global-set-key (kbd "s-g c i") 'magit-commit)


;; Dired
(require 'dired-k)
(add-hook 'dired-initial-position-hook 'dired-k)
(define-key dired-mode-map (kbd "g") 'dired-k)

(require 'direx-k)
(global-unset-key (kbd "s-s"))
(global-set-key (kbd "s-s") 'direx-project:jump-to-project-root-other-window)
(define-key direx:direx-mode-map (kbd "g") 'direx-k)


;; Git gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode)
(setq git-gutter-fr:side 'right-fringe)
