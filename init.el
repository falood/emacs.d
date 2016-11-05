;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; (setq url-proxy-services '(("http" . "127.0.0.1:7676")))
;; (setq url-proxy-services '(("http" . "127.0.0.1:8080")))
(package-initialize)

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(setenv "PATH" (concat
                (concat (shell-command-to-string "brew --prefix coreutils")
                        "/libexec/gnubin:")
                "/usr/local/sbin:/usr/local/bin:"
                (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(setq default-directory "~")

(require 'cask "/usr/local/Cellar/cask/0.8.1/cask.el")
(cask-initialize)

(setq custom-file "~/.emacs.d/conf/custom.el")
(load custom-file)


(load "powerline.el")

(load "~/.emacs.d/conf/helpers.el")
(load "~/.emacs.d/conf/theme.el")

(load "~/.emacs.d/conf/python-mode.el")
(load "~/.emacs.d/conf/erlang-mode.el")
(load "~/.emacs.d/conf/elixir-mode.el")
(load "~/.emacs.d/conf/web-mode.el")
(load "~/.emacs.d/conf/cxx-mode.el")
(load "~/.emacs.d/conf/lua-mode.el")
(load "~/.emacs.d/conf/markdown-mode.el")
