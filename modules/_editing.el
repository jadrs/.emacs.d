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

(require 'tabbar)
(tabbar-mode t)
(global-set-key [M-S-left] 'tabbar-backward-tab)
(global-set-key [M-S-right] 'tabbar-forward-tab)
(global-set-key [M-S-up] 'tabbar-forward-group)
(global-set-key [M-S-down] 'tabbar-backward-group)

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

;; snippets
(require 'yasnippet)
;; (setq yas-snippets-dir "~/.emacs.d/snippets")  ; override default snippets
(yas-global-mode 1)

;; writegood-mode
(add-to-list 'load-path (concat non-elpa-dir "writegood-mode.el"))
(require 'writegood-mode)
(add-hook 'text-mode-hook 'writegood-turn-on)
(add-hook 'latex-mode-hook 'writegood-turn-on)
