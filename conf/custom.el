;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode t)
(global-hl-line-mode 1)
(setq inhibit-startup-screen t)
(setq gc-cons-threshold (* 511 1024 1024))
(setq gc-cons-percentage 0.0001)
(run-with-idle-timer 5 t #'garbage-collect)


(setq split-width-threshold 1)
;; (setq ns-use-native-fullscreen nil)
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;; (setq scroll-step 1)
(setq scroll-conservatively 1)
;; (setq auto-window-vscroll nil)

(setq frame-title-format "%b")
(display-time)
(transient-mark-mode t)
;; 80 column
;; (setq default-fill-column 80)
(fset 'yes-or-no-p 'y-or-n-p)

;; Default Major Mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook
          (lambda()
            (setq show-trailing-whitespace nil)
            (linum-mode 0)))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default line-spacing 0)
(setq-default c-basic-offset 4)

;; Tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(setq ad-redefinition-action 'accept)

;; Auto-Save
(require 'saveplace)
(setq save-place-file "~/.emacs.d/cache/saved-places")
(setq-default save-place t)
(setq auto-save-list-file-prefix "~/.emacs.d/cache/auto-save-list")


;; Audo-Delete-Trailing-Whitespace
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Key-Bind
(global-unset-key (kbd "C-\\"))
(global-unset-key (kbd "s-h"))
; (global-unset-key (kbd "s-v"))

(global-set-key (kbd "s-b") 'windmove-left)
(global-set-key (kbd "s-f") 'windmove-right)
;; (global-set-key (kbd "s-p") 'windmove-up)
;; (global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-o") 'zygospore-toggle-delete-other-windows)

(global-set-key (kbd "s-h") 'split-window-horizontally)
; (global-set-key (kbd "s-v") 'split-window-vertically)

(global-set-key (kbd "s-t") 'shell-switcher-new-shell)
(global-set-key (kbd "s-w") 'kill-buffer-and-window)
(global-set-key (kbd "s-k") 'kill-this-buffer)

(global-set-key (kbd "s-N") 'new-frame)
(global-set-key (kbd "s-W") 'delete-frame)

; (setq mac-option-modifier 'meta)
; (setq mac-command-modifier 'super)

;; Buffe
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; User
(setq user-full-name "falood")
(setq user-mail-address "falood@gmail.com")


;; Custom Variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242728" "#ff0066" "#63de5d" "#E6DB74" "#06d8ff" "#ff8eff" "#53f2dc" "#f8fbfc"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("70403e220d6d7100bae7775b3334eddeb340ba9c37f4b39c189c2c29d458543b" default)))
 '(fci-rule-color "#424748")
 '(global-fasd-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(hl-paren-background-colors
   (quote
    ("#0000FF" "#CE4323" "#3B7FFF" "#FED300" "#708183" "#E8E8E8")))
 '(hl-paren-colors (quote ("#FFF" "#FFF" "#FFF" "#FFF" "#FFF" "#FFF")))
 '(lua-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (zygospore web-mode wakatime-mode undo-tree sr-speedbar solarized-theme polymode ob-elixir multiple-cursors monokai-theme markdown-mode magit lua-mode highlight-parentheses helm-swoop helm-projectile helm-ag git-timemachine git-gutter-fringe flycheck fasd erlang elm-mode editorconfig direx dired-k diff-hl darkokai-theme counsel-projectile company-restclient company-jedi anzu alchemist ag ace-pinyin)))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff0066")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#63de5d")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#53f2dc")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#06d8ff"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#990099" :foreground "#242728" :inverse-video t))))
 '(mode-line ((t (:overline nil :underline nil :foreground nil :background nil :box nil))))
 '(mode-line-inactive ((t (:overline nil :underline nil :foreground nil :background nil :box nil)))))
