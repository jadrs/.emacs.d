;;; _ui.el

;; Theme
;; (require 'zenburn-theme)
;; (load-theme 'zenburn t)
(require 'arjen-grey-theme)
(load-theme 'arjen-grey t)
;; (require 'gruvbox-theme)
;; (load-theme 'gruvbox-dark-medium t)
;;(require 'snazzy-theme)
;;(load-theme 'snazzy t)

;; Interactivelly-do-things
(require 'ido)
(ido-mode t)

;; Add colors to the terminal (M-x term)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (add-to-list 'custom-theme-load-path (concat emacs-dir "themes/"))
;; (load-theme 'jrg t)

;; ;(set-foreground-color "gray90")
;; (set-background-color "gray10")

;; Remove uncessary UI elements
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(menu-bar-mode   -1)

;; ;; Font
;; (set-face-attribute 'default nil :height 110 :family "Monospace")
;; (set-face-attribute 'default nil :family "Inconsolata" :height 120)
(set-default-font "Inconsolata")

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
(setq linum-format "%3d")

;; highlights current line
(global-hl-line-mode t)
;(set-face-background 'hl-line "#3e4446")
(set-face-background 'hl-line "#3e448f")

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

; tabs for buffers
(require 'tabbar)
(tabbar-mode t)

(global-set-key [M-S-left] 'tabbar-backward-tab)
(global-set-key [M-S-right] 'tabbar-forward-tab)
(global-set-key [M-S-up] 'tabbar-forward-group)
(global-set-key [M-S-down] 'tabbar-backward-group)

; Speed up by not using images
(setq tabbar-use-images nil)

;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 2 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "gray75"
 :box '(:line-width 2 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 2 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "gray75"
 :foreground "black"
 :underline nil
 :box '(:line-width 2 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-modified nil
 :background "gray30"
 :foreground "red"
 :underline nil
 :box '(:line-width 2 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected-modified nil
 :background "gray75"
 :foreground "red"
 :underline nil
 :box '(:line-width 2 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 2 :color "gray20" :style nil))
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "gray20"
;;  :height 0.6)

;; Change padding of the tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))

 ;; customize to show all normal files in one group
(defun my-tabbar-buffer-groups()
  "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts
 with '*', plus dired buffers), and the rest.  This works at
 least with Emacs v24.2 using tabbar.el v1.7."
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
	      ((eq major-mode 'dired-mode) "emacs")
	      (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; ; enter fullscreen mode
;; (defun switch-full-screen ()
;;   (interactive)
;;   (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
;; (global-set-key [f11] 'switch-full-screen)
(global-set-key [f11] 'toggle-frame-fullscreen)

(require 'powerline)
(powerline-default-theme)
