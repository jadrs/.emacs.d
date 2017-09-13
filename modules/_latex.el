;; Basic latex settings
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; (add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)  ;; menubar

;; doc-view mode
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(setq doc-view-continuous t)

(require 'auctex-latexmk)
(auctex-latexmk-setup)
(setq auctex-latexmk-inherit-TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; continuous compilation
(add-to-list 'TeX-command-list '("latexmk" "latexmk -pdf -pvc %t" TeX-run-TeX))

;; a normal font size for the headings
(setq font-latex-fontify-sectioning 1.0)


;;(global-set-key [C-f12] (lambda() (interactive) (shell-command "make all > make.log; echo \"make all\"")))
;;(global-set-key [C-f12] (lambda() (interactive) (shell-command (concat "pdflatex " (buffer-file-name)))))
