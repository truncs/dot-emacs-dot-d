;; global variables
(setq
   inhibit-startup-screen t
    create-lockfiles nil
     make-backup-files nil
      column-number-mode t
       scroll-error-top-bottom t
        show-paren-delay 0.5
	 use-package-always-ensure t
	  sentence-end-double-space nil)

;; buffer local variables
(setq-default
   indent-tabs-mode nil
    tab-width 4
     c-basic-offset 4)

;; modes
(electric-indent-mode 0)
(ido-mode 1)
(tool-bar-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
   package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
		                          ("org" . "http://orgmode.org/elpa/")
					                      ("melpa" . "http://melpa.org/packages/")
							                          ("melpa-stable" . "http://stable.melpa.org/packages/"))
    package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
    (package-refresh-contents)
      (package-install 'use-package))
(require 'use-package)

;; Packages

;; Ace Jump
(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode)
  :init
  (progn
    (require 'cl)))

(use-package smex
  :defer t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config
  (progn
    (smex-initialize)))

;; Use the dracula theme
(use-package dracula-theme)

;; Ensime for scala
(use-package ensime
  :ensure t
  :pin melpa)

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa)

;; Autocomplete
(use-package auto-complete)

;; Go Mode for emacs
(use-package go-mode
  :defer t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smex ace-jump-mode go-mode auto-complete ensime dracula-theme use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
