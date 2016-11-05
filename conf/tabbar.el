(defconst green "#35c200")
(defconst red "#dd8500")
(defconst blue "#2076c8")
(defconst darkblue "#071e26")
(defconst grey "#6b6b6b")
(defconst white "#fff")
(defconst black "#000")

(require 'tabbar)
(tabbar-mode t)
(tabbar-mwheel-mode -1)
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

; (setq tabbar-buffer-groups-function nil)
(setq tabbar-separator '(1))

(set-face-attribute 'tabbar-default nil
                    :family "monofur"
                    :background darkblue
                    :foreground darkblue
                    :inherit nil
                    :height 1.0
                    :width 'normal
                    :slant 'normal
                    :underline nil
                    :strike-through nil
                    :stipple nil)

(set-face-attribute 'tabbar-unselected nil
                    :foreground red
                    :background darkblue
                    :box nil)

(set-face-attribute 'tabbar-selected nil
                    :foreground darkblue
                    :background red
                    :box nil)

(set-face-attribute 'tabbar-modified nil
                    :foreground darkblue
                    :background green
                    :box nil)

(set-face-attribute 'tabbar-button nil
                    :box nil)


(defun switch-tabbar (num)
  (let* ((tabs (tabbar-tabs
                (tabbar-current-tabset)
                ))
         (tab (nth
               (if (> num 0) (- num 1) (+ (length tabs) num))
               tabs)))
    (if tab (switch-to-buffer (car tab)))))

(global-set-key (kbd "s-1") (lambda () (interactive) (switch-tabbar 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (switch-tabbar 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (switch-tabbar 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (switch-tabbar 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (switch-tabbar 5)))
(global-set-key (kbd "s-6") (lambda () (interactive) (switch-tabbar 6)))
(global-set-key (kbd "s-7") (lambda () (interactive) (switch-tabbar 7)))
(global-set-key (kbd "s-8") (lambda () (interactive) (switch-tabbar 8)))
(global-set-key (kbd "s-9") (lambda () (interactive) (switch-tabbar 9)))
(global-set-key (kbd "s-0") (lambda () (interactive) (switch-tabbar 10)))

(global-set-key (kbd "s-}") 'tabbar-forward-tab)
(global-set-key (kbd "s-{") 'tabbar-backward-tab)


(defun tabbar-buffer-tab-label (tab)
  (let ((label  (if tabbar--buffer-show-groups
                    (format "  %s  " (tabbar-tab-tabset tab))
                  (format "  %s  " (tabbar-tab-value tab)))))
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))
