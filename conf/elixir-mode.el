(require 'elixir-mode)
(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.elixir\\'" . elixir-mode))
(add-hook 'elixir-mode-hook 'subword-mode)

(require 'alchemist)
(setq alchemist-buffer-status-modeline nil)
(setq alchemist-help-ansi-color-docs t)
(setq alchemist-project-compile-when-needed t)
(setq alchemist-complete-debug-mode nil)


(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'alchemist-mode-hook
          (lambda()
            (setq mode-name "Elixir-A")))
