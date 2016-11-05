(require 'erlang-start)
(add-hook 'erlang-mode-hook
        (lambda () (imenu-add-to-menubar "Index")))
