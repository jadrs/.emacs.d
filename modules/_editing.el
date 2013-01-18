
;; Settings for better editing
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(delete-selection-mode t)
(show-paren-mode t)

;; programming hooks
(add-hook 'prog-mode-hook 'linum-mode)

;; open .h files in c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; ;;indentation style
;; (setq-default c-default-style "linux")
;; (setq-default c-basic-offset 2)     ;; use 2 spaces
;; (setq c-tab-always-indent "other")  ;; do not indent if literal
;; (setq-default indent-tabs-mode nil)

;; Google C++ Style
;; http://code.google.com/p/google-styleguide/
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; C/C++ switch-case tunning
(c-set-offset 'case-label '+)
(c-set-offset 'statement-case-open 0)

;; spell-checking
(setq-default ispell-program-name "aspell")
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Moving cursor down at bottom scrolls only a single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)

;; uniq buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-ignore-buffers-re "^\\*")

;; keybindings
(global-set-key (kbd "C-c +")       'text-scale-increase)
(global-set-key (kbd "C-c -")       'text-scale-decrease)
(global-set-key (kbd "C-.")         'repeat)
(global-set-key (kbd "C-c c")       'comment-or-uncomment-region)
(global-set-key (kbd "C-c g")       'goto-line)
(global-set-key (kbd "M-S-<right>") 'switch-to-next-buffer)
(global-set-key (kbd "M-S-<left>")  'switch-to-prev-buffer)
(global-set-key (kbd "M-S-<up>")    'buffer-menu)

(global-set-key (kbd "C-M-k")       'kill-this-buffer)

;; electric modes
(electric-pair-mode t)
;; (electric-indent-mode t)
;; (electric-layout-mode t)

;; Autocompletion
(global-set-key (kbd "M-'") 'hippie-expand)

;; snippets
(setq yas-snippets-dir (concat emacs-dir "snippets")) ; override default snippets
(require 'yasnippet)
(yas--initialize)

;; WriteGood-mode
(add-to-list 'load-path (concat non-elpa-dir "writegood-mode.el"))
(require 'writegood-mode)
(add-hook 'text-mode-hook 'writegood-turn-on)
(add-hook 'latex-mode-hook 'writegood-turn-on)
