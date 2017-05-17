;; Basic latex settings
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(global-set-key [C-f12] (lambda() (interactive) (shell-command "make all > make.log; echo \"make all\"")))
;;(global-set-key [C-f12] (lambda() (interactive) (shell-command (concat "pdflatex " (buffer-file-name)))))
