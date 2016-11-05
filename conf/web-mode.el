(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl?\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'"    . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'"  . web-mode))

(setq web-mode-engines-alist
      '(("django" . "\\.tpl\\'")))

(add-hook 'web-mode-hook
          (lambda() (flycheck-mode 0)))

(setq web-mode-enable-css-colorization t)


;; Less
(add-hook 'less-css-mode-hook 'rainbow-mode)
