;; Emacs configuration entry point

;; Common Lisp extensions
(require 'cl)

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
        ("original"  . "http://tromey.com/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa"     . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Packages installed by default
(defvar my-packages '(auctex python yasnippet member-function cpputils-cmake google-c-style xml-rpc);; gtags)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load non-elpa and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar non-elpa-dir (concat emacs-dir "non-elpa/")
  "Packages not yet avilable in ELPA")
(defvar module-dir (concat emacs-dir "modules/")
  "The core of my emacs config")

;; Add to load path
(add-to-list 'load-path non-elpa-dir)
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))

;; ;; start in server mode
;; (server-start)
