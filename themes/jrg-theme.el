
;; jrg-theme.el: Emacs color theme inspired by dark-laptop.
(deftheme jrg
  "Emacs24 color theme inspired by dark-laptop")

;; Define colors for easy use
(custom-theme-set-faces
 'jrg
 ;; basics
 '(default ((t (:background "black" :foreground "gray90" ))))
 '(cursor ((t (:background "yellow"))))
 '(mode-line ((t (:foreground "black" :background "gray90"))))
 '(region ((t (:background "gray25"))))
 ;; font-lock
 '(font-lock-builtin-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-comment-face ((t (:foreground "LightOrangeRed" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 '(font-lock-doc-string-face ((t (:foreground "LightSalmon" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "LightSkyBlue"))))
 '(font-lock-keyword-face ((t (:foreground "Cyan"))))
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 '(font-lock-reference-face ((t (:foreground "LightSteelBlue"))))
 '(font-lock-string-face ((t (:foreground "LightSalmon"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
 '(font-lock-warning-face ((t (:foreground "Red" :weight bold))))
 '(hl-line ((t (:background "gray13"))))
 )

(require 'ansi-color)
