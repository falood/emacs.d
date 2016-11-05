;;; package -- powerline.el
;;; Commentary:
;;    (require 'powerline)
;;; Code:

(defconst green "#35c200")
(defconst red "#dd8500")
;(defconst red "#ddc200")
(defconst blue "#2076c8")
;; (defconst darkblue "#071e26")
(defconst darkblue "#000")
(defconst grey "#6b6b6b")
(defconst white "#fff")
(defconst black "#000")

(make-face 'mode-line-color-1)
(set-face-attribute 'mode-line-color-1 nil
                    :foreground black
                    :background red)

(make-face 'mode-line-color-2)
(set-face-attribute 'mode-line-color-2 nil
                    :foreground white
                    :background grey)

(make-face 'mode-line-color-3)
(set-face-attribute 'mode-line-color-3 nil
                    :foreground grey
                    :background white)

(make-face 'mode-line-color-4)
(set-face-attribute 'mode-line-color-4 nil
                    :foreground white
                    :background blue)

(make-face 'mode-line-color-5)
(set-face-attribute 'mode-line-color-5 nil
                    :foreground red
                    :background blue)

(make-face 'mode-line-color-6)
(set-face-attribute 'mode-line-color-6 nil
                    :foreground blue
                    :background darkblue
                    :box nil)

(make-face 'mode-line-color-7)
(set-face-attribute 'mode-line-color-7 nil
                    :foreground grey
                    :background darkblue)

(make-face 'mode-line-color-8)
(set-face-attribute 'mode-line-color-8 nil
                    :foreground white
                    :background grey)

(make-face 'mode-line-color-9)
(set-face-attribute 'mode-line-color-9 nil
                    :foreground darkblue
                    :background darkblue)

(set-face-attribute 'mode-line nil
                    :foreground darkblue
                    :background darkblue
                    :box nil)

(set-face-attribute 'mode-line-highlight nil
                    :foreground darkblue
                    :background darkblue
                    :box nil)

(set-face-attribute 'mode-line-inactive nil
                    :foreground black
                    :background black
                    :box nil)

(setq-default mode-line '((:foreground darkblue :background darkblue :box nil) mode-line))
(setq-default mode-line-format
 (list  '(:eval (concat (propertize " %m " 'face 'mode-line-color-1)
                        (propertize "" 'face 'mode-line-color-5)))
        '(:eval (concat (propertize " %* %b " 'face 'mode-line-color-4)
                        (propertize (vc-branch) 'face 'mode-line-color-4)
                        (propertize "" 'face 'mode-line-color-6)))
        '(:eval (propertize " "
                            'display '((space :align-to (- right-fringe 20)))
                            'face 'mode-line-color-9
                            ))

        '(:eval (concat (propertize "" 'face 'mode-line-color-7)
                        (propertize " %p " 'face 'mode-line-color-2)))
        '(:eval (concat (propertize "" 'face 'mode-line-color-8)
                        (propertize "%4l:%3c     " 'face 'mode-line-color-3)))
        ))

(defun vc-branch ()
  "Get git branch."
 (if (stringp vc-mode)
   (let ((b (replace-regexp-in-string (format "^ %s" (vc-backend buffer-file-name)) " " vc-mode)))
     (if (string-match "[:@]" b)
         (format " %s " (substring b 2))
       " "
       ))
   " "))

(provide 'powerline)

;;; powerline ends here
