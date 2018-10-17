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
  :pin melpa
  :config 
  (progn
    (setq company-idle-delay 0)
    (setq company-dabbrev-downcase 0)))

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
     (setq ac-modes '(ada-mode
                     agda-mode
                     agda2-mode
                     c++-mode
                     c-mode
                     cc-mode
                     clojure-mode
                     clojurescript-mode
                     coq-mode
                     cperl-mode
                     css-mode
                     eclim-mode
                     ecmascript-mode
                     emacs-lisp-mode
                     enh-ruby-mode
                     f90-mode
                     fortran-mode
                     go-mode
                     haskell-mode
                     java-mode
                     javascript-mode
                     js-mode
                     js2-mode
                     lisp-interaction-mode
                     lisp-mode
                     lua-mode
                     makefile-mode
                     malabar-mode
                     ocaml-mode
                     perl-mode
                     php-mode
                     python-mode
                     ruby-mode
                     scala-mode
                     scheme-mode
                     sclang-mode
                     sgml-mode
                     sh-mode
                     slime-repl-mode
                     ts-mode
                     tuareg-mode
                     xml-mode
                     js3-mode
                     verilog-mode
                     yaml-mode))))



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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (ample-zen)))
 '(custom-safe-themes
   (quote
    ("2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "617341f1be9e584692e4f01821716a0b6326baaec1749e15d88f6cc11c288ec6" default)))
 '(package-selected-packages
   (quote
    (yaml-mode ample-zen-theme multi-term yasnippet-snippets markdown-mode interleave company-mode hl-todo magit ac-dabbrev go-autocomplete auto-complete-config smex ace-jump-mode go-mode auto-complete ensime dracula-theme use-package evil))))
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

