;;; _ui.el

;; Theme
(require 'zenburn-theme)
(load-theme 'zenburn t)

;; Interactivelly-do-things
(require 'ido)
(ido-mode t)

;; Add colors to the terminal (M-x term)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (add-to-list 'custom-theme-load-path (concat emacs-dir "themes/"))
;; (load-theme 'jrg t)

;; ;(set-foreground-color "gray90")
;; (set-background-color "black")

;; Remove uncessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(menu-bar-mode   -1)

;; ;; Font
;; (set-face-attribute 'default nil :height 110 :family "Monospace")

;; blink instead of beep
(setq visible-bell t)

;; Modeline
(line-number-mode     t)
(column-number-mode   t)
(size-indication-mode t)

;;behavior
(fset 'yes-or-no-p 'y-or-n-p)

;; linum-mode style
(global-linum-mode t)
(setq linum-format "%3d ")

;; highlights current line
(global-hl-line-mode t)

; search & replace highlighting
(setq search-highlight t)           ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

;; display time
(setq display-time-24hr-format t)
(display-time)

; set UTF8
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)

; easy window switching
(windmove-default-keybindings 'meta)

; copy/paste
(setq x-select-enable-clipboard t)
