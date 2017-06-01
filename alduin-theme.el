;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with <open> and enter text in its buffer.

(deftheme alduin "The Alduin theme for Emacs")

(defvar alduin-default-colors
  '(("alduin-bg"             . "#121212")
    ("alduin-fg"             . "#DFDFAF")
    ("alduin-black"          . "#1C1C1C")
    ("alduin-red"            . "#AF1600")
    ("alduin-green"          . "#AF5F00")
    ("alduin-yellow"         . "#878787")
    ("alduin-blue"           . "#AF875F")
    ("alduin-magenta"        . "#875F5F")
    ("alduin-cyan"           . "#87AFAF")
    ("alduin-white"          . "#DFDFAF")
    ("alduin-bold"           . "#FFFFFF")
    ("alduin-white-bright"   . "#FFDF87")
    ("alduin-magenta-bright" . "#AF8787")
    ("alduin-black-bright"   . "#87875f")
    ("alduin-black-alt"      . "#262626")))

(defmacro alduin-apply-colors (&rest body)
  `(let ((foo "bar")
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   alduin-default-colors))
     ,@body))

;; apply colors
(alduin-apply-colors
 (custom-theme-set-faces
  'alduin
  ;;;; default
  `(default ((t (:foreground ,alduin-fg :background ,alduin-bg))))
  ;;;; strings
  `(font-lock-string-face ((t (:foreground ,alduin-white-bright))))
  ;;;; functions
  `(font-lock-function-name-face ((t (:foreground ,alduin-magenta))))
  ;;;; constants
  `(font-lock-type-face ((t (:foreground ,alduin-magenta-bright))))
  ;;;; comments
  `(font-lock-comment-face ((t (:foreground ,alduin-black-bright))))
  `(font-lock-comment-delimiter-face ((t (:foreground ,alduin-black-bright))))
  ;;;; keywords (if etc)
  `(font-lock-keyword-face ((t (:foreground ,alduin-yellow))))
  ;;;; variables
  `(font-lock-variable-name-face ((t (:foreground ,alduin-cyan))))
  ;;;; mode line
  `(mode-line ((t (:foreground ,alduin-bg :background ,alduin-black-bright :box t :overline nil))))
  `(mode-line-inactive ((t (:foreground ,alduin-black-bright :background ,alduin-bg :box t :overline nil))))
  ;;;; fringe
  `(fringe ((t (:background ,alduin-black))))
  ;;;; hl line
  `(hl-line ((t (:background ,alduin-black-alt))))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'alduin)
