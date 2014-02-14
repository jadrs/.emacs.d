;;; _editing.el

;; Settings for better editing
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(delete-selection-mode t)
(show-paren-mode t)

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; autopair
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

;; auto-fill collumn width
(setq-default fill-column 79)

;; programming hooks
(add-hook 'prog-mode-hook 'linum-mode)

(add-hook 'prog-mode-hook 'hs-minor-mode) ;; hide-show blocks of code/comments
(add-hook 'prog-mode-hook
          (lambda()
	    (local-set-key (kbd "M-+") 'hs-show-block)
	    (local-set-key (kbd "M--") 'hs-hide-block)
	    (local-set-key (kbd "M-C-+") 'hs-show-all)
	    (local-set-key (kbd "M-C--") 'hs-hide-all)))

(require 'fill-column-indicator)
(add-hook 'prog-mode-hook 'fci-mode)

;; open .m files in octave-mode
(add-to-list 'auto-mode-alist' ("\\.m\\'" . octave-mode))

;; open .h files in c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; highlight entire bracket expression
(setq show-paren-style 'expression)

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
;; (global-set-key (kbd "M-S-<right>") 'switch-to-next-buffer)
;; (global-set-key (kbd "M-S-<left>")  'switch-to-prev-buffer)
(global-set-key (kbd "C-M-k")       'kill-this-buffer)
(global-set-key (kbd "M-=")         'hippie-expand) ; Autocompletion

;; snippets
(require 'yasnippet)
;; (setq yas-snippets-dir "~/.emacs.d/snippets")  ; override default snippets
(yas-global-mode 1)

;; writegood-mode
(add-to-list 'load-path (concat non-elpa-dir "writegood-mode.el"))
(require 'writegood-mode)
(add-hook 'text-mode-hook 'writegood-turn-on)
(add-hook 'latex-mode-hook 'writegood-turn-on)
