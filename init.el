;; Emacs configuration entry point

;; ;; Common Lisp extensions
;; (require 'cl)

;; set buffer name as frame title
(setq frame-title-format "emacs - %b")

;; Don't want any startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Don't want any backup files nor autosaving
(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil)

;; Emacs package repositories
(require 'package)
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; solves some dead keys issues
(require 'iso-transl)

;; Packages installed by default
(defvar my-packages
  '(python google-c-style xml-rpc flycheck autopair writegood-mode ido zenburn-theme yasnippet fill-column-indicator tabbar powerline arjen-grey-theme auctex-latexmk)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load non-elpa and custom files
(defvar emacs-dir
  (file-name-directory load-file-name)
  "top level emacs dir")

(defvar non-elpa-dir
  (concat emacs-dir "non-elpa/")
  "Packages not yet avilable in ELPA")

(defvar module-dir
  (concat emacs-dir "modules/")
  "The core of my emacs config")

;; Add to load path
(add-to-list 'load-path non-elpa-dir)
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8ec2e01474ad56ee33bc0534bdbe7842eea74dccfb576e09f99ef89a705f5501" "0809485f08aa8c9b0100033eaa2d04f6a7410c2afcdbd76ce368a7a8e5744ffb" default)))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet xml-rpc writegood-mode tabbar spacemacs-theme spacegray-theme snazzy-theme powerline minimal-theme material-theme gruvbox-theme green-is-the-new-black-theme google-c-style flycheck fill-column-indicator darktooth-theme clues-theme blackboard-theme autopair auctex-latexmk arjen-grey-theme)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
