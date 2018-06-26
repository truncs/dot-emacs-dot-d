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

;; Disable beeping
(setq visible-bell 1)


;; global keybindings
(global-unset-key (kbd "C-z"))
(global-set-key [f1] 'ansi-term)


;; ansi-mode
(defun my-term-mode-hook ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-k")
    (lambda ()
      (interactive)
      (term-send-raw-string "\C-k")
      (kill-line)))
  (setq yas-dont-activate t))

(add-hook 'term-mode-hook 'my-term-mode-hook)

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

;; Solidity settings
(use-package solidity-mode
  :pin melpa)


(use-package scala-mode
  :pin melpa)

(use-package company
  :pin melpa)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'solidity-mode-hook
	(lambda ()
	(set (make-local-variable 'company-backends)
		(append '((company-solidity company-capf company-dabbrev-code))
			company-backends))))

;; Autocomplete
(use-package auto-complete
  :defer t
  :config
  (progn 
    (ac-set-trigger-key "TAB")
    (ac-config-default)
    (global-auto-complete-mode t)
    (setq ac-delay 0.02)
    (setq ac-use-menu-map t)
    (setq ac-menu-height 50)
    (setq ac-use-quick-help nil) 
    (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
    (setq ac-ignore-case nil)
    (setq ac-dwim  t)
    (setq ac-fuzzy-enable t)
    (use-package ac-dabbrev
      :config
      (progn
        (add-to-list 'ac-sources 'ac-source-dabbrev)))
    (setq-default ac-sources '(
                           ac-source-yasnippet
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers
                           ))
     (setq ac-modes '(js3-mode
                     emacs-lisp-mode
                     lisp-mode
                     lisp-interaction-mode
                     slime-repl-mode
                     c-mode
                     cc-mode
                     c++-mode
                     go-mode
                     java-mode
                     eclim-mode
                     malabar-mode
                     clojure-mode
                     clojurescript-mode
                     scala-mode
                     scheme-mode
                     ocaml-mode
                     tuareg-mode
                     coq-mode
                     haskell-mode
                     agda-mode
                     agda2-mode
                     perl-mode
                     cperl-mode
                     python-mode
                     ruby-mode
                     enh-ruby-mode
                     lua-mode
                     ecmascript-mode
                     javascript-mode
                     js-mode
                     js2-mode
                     php-mode
                     css-mode
                     makefile-mode
                     sh-mode
                     fortran-mode
                     f90-mode
                     ada-mode
                     xml-mode
                     sgml-mode
                     ts-mode
                     sclang-mode
                     verilog-mode))))



;; Yasnippet
(use-package yasnippet
  :config
  (yas-reload-all))


;; Magit
(use-package magit
  :defer t)

;; Go Mode for emacs
(use-package go-mode
  :defer t)

(use-package hl-todo
  :defer t
  :config 
  (add-hook 'prog-mode-hook 'hl-todo))

;; Markdown mode settings
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("617341f1be9e584692e4f01821716a0b6326baaec1749e15d88f6cc11c288ec6" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets markdown-mode interleave company-mode hl-todo magit ac-dabbrev go-autocomplete auto-complete-config smex ace-jump-mode go-mode auto-complete ensime dracula-theme use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; modes
(electric-indent-mode 0)
(ido-mode 1)
(tool-bar-mode 0)

