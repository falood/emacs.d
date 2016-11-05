;; (require 'irony)
;; 
;; (add-hook 'c++-mode-hook  'irony-mode)
;; (add-hook 'c-mode-hook    'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; 
;; (add-to-list 'company-backends 'company-irony)
;; 
;; (add-hook 'irony-mode-hook
;;           (lambda ()
;;             (irony-eldoc)
;;             (define-key irony-mode-map [remap completion-at-point]
;;               'irony-completion-at-point-async)
;;             (define-key irony-mode-map [remap complete-symbol]
;;               'irony-completion-at-point-async)
;;             (company-irony-setup-begin-commands)))
;; 
;;                                         ; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; 
;; (require 'flycheck)
;; (add-to-list 'flycheck-checkers 'irony)
