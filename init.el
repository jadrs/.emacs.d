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

(setq package-check-signature nil)

;; Emacs package repositories
(require 'package)
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
	;("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; solves some dead keys issues
(require 'iso-transl)

;; Packages installed by default
(defvar my-packages
  '(python google-c-style xml-rpc flycheck autopair writegood-mode ido zenburn-theme yasnippet yasnippet-snippets fill-column-indicator centaur-tabs powerline arjen-grey-theme highlight-indent-guides tramp-theme auctex-latexmk smart-mode-line)
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

;; ;; Emacs server
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(blacken-allow-py36 t)
;;  '(blacken-line-length 79)
;;  '(custom-safe-themes
;;    (quote
;;     ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "54449a089fc2f95f99ebc9b9b6067c802532fd50097cf44c46a53b4437d5c6cc" "9b35c097a5025d5da1c97dba45fed027e4fb92faecbd2f89c2a79d2d80975181" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" "cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" default)))
;;  '(package-selected-packages
;;    (quote
;;     (python-black atom-dark-theme atom-one-dark-theme multiple-cursors smart-mode-line-powerline-theme smart-mode-line sublime-themes moe-theme material-theme flatland-black-theme flatland-theme ample-zen-theme tangotango-theme auctex-latexmk tramp-theme zenburn-theme yasnippet-snippets xml-rpc writegood-mode tabbar powerline highlight-indent-guides google-c-style flycheck fill-column-indicator autopair arjen-grey-theme)))
;;  '(tabbar-separator (quote (0.5))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1e9001d2f6ffb095eafd9514b4d5974b720b275143fbc89ea046495a99c940b0" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "6ebdb33507c7db94b28d7787f802f38ac8d2b8cd08506797b3af6cdfd80632e0" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "19b9349a6b442a2b50e5b82be9de45034f9b08fa36909e0b1be09433234610bb" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" default)))
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(package-selected-packages
   (quote
    (centaur-tabs ample-theme hc-zenburn-theme blacken pyvenv zenburn-theme yasnippet-snippets xml-rpc writegood-mode virtualenvwrapper tabbar smart-mode-line powerline highlight-indent-guides google-c-style flycheck fill-column-indicator autopair auctex-latexmk arjen-grey-theme)))
 '(tabbar-separator (quote (0.5))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
