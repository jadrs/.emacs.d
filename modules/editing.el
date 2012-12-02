
;; Settings for better editing
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(delete-selection-mode t)
(show-paren-mode t)

;; programming hooks
(add-hook 'prog-mode-hook 'linum-mode)

;; indentation style
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "linux")
(setq-default c-basic-offset 2)     ;; use 2 spaces
(setq c-tab-always-indent "other")  ;; do not indent if literal

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
(global-set-key (kbd "C-c +") 'text-scale-increase)
(global-set-key (kbd "C-c -") 'text-scale-decrease)
(global-set-key (kbd "C-.")   'repeat)

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key [f7] 'switch-to-previous-buffer)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "M-S-<right>") 'switch-to-next-buffer)
(global-set-key (kbd "M-S-<left>")  'switch-to-prev-buffer)

;; electric modes
(electric-pair-mode t)
;;(electric-indent-mode t)
;;(electric-layout-mode t)

;; Autocompletion/snippets
(global-set-key (kbd "M-'") 'hippie-expand)
(setq snippets-dir (concat emacs-dir "snippets"))
(require 'yasnippet)
(yas--initialize)
(yas/load-directory snippets-dir)

;; WriteGood-mode
(add-to-list 'load-path (concat non-elpa-dir "writegood-mode.el"))
(require 'writegood-mode)
(add-hook 'text-mode-hook 'writegood-turn-on)
(add-hook 'latex-mode-hook 'writegood-turn-on)
