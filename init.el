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
(global-set-key (kbd "RET") 'newline-and-indent)

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
(yas-global-mode 1)

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
 '(column-number-mode t)
 '(custom-enabled-themes '(xcode))
 '(custom-safe-themes
   '("5ff3a60e4766a4b74afa7268c9a57c7a72ebb7386ae2629b4cee27562b1e9e90" "5a05a46286e47d1bda8151b37fea5e7e38be1e291f19fb73402a76fbef5ee95c" "4cd89e46d7fc2060e18021cf4a89f6af28661aba6a454e445cce2666b1611ab7" "1805fb283472cbe44571b8035125e3f575889fc9c4c0c6335622ac7c9938da5d" "aa5890424b1fec35d8bd1b2b7d3218bf3abc279f4a6f6172c498d3cfa1f81bf1" "14314fdae0c75ea8d2e28187213015a8cd881d0dad3e474b397158658aada668" "1598d2288563022f68d889643984294c1b50c986dee338ad9f2b9c18f15e4148" "078bde11b5fc0b7902a40262dda4db73be1b6c5158c8d76d4cddea98b77807e0" "d4bd862e3fd3985c00a5bd7fb32d574a119bd515ab49c7737690c26acfa3092f" "fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" "040c9c002d6b9af54c70186494f92609b150b24426c6f014b935ef504d964965" "60c9fed6a113923f49343520221c95628c203c7f8553e01843d136603328b823" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "617341f1be9e584692e4f01821716a0b6326baaec1749e15d88f6cc11c288ec6" default))
 '(package-selected-packages
   '(powerline dired-sidebar jedi gnu-elpa-keyring-update ack docker-tramp rust-mode yaml-mode multi-term yasnippet-snippets markdown-mode interleave company-mode hl-todo magit ac-dabbrev go-autocomplete auto-complete-config smex ace-jump-mode go-mode auto-complete dracula-theme use-package evil powerline dired-sidebar))
 '(tool-bar-mode nil))

;; Use xcode theme
(load  (expand-file-name "themes/xcode-theme.el" user-emacs-directory))
(load-theme 'xcode t)

;; modes
(electric-indent-mode 0)
(ido-mode 1)
(tool-bar-mode 0)

(put 'upcase-region 'disabled nil)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
(setq jedi:tooltip-method nil)
(setq jedi:get-in-function-call-delay 0)

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

(require 'powerline)
(global-tab-line-mode)
(defvar my/tab-height 20)
(defvar my/tab-left (powerline-wave-right 'tab-line nil my/tab-height))
(defvar my/tab-right (powerline-wave-left nil 'tab-line my/tab-height))

(defun my/tab-line-tab-name-buffer (buffer &optional _buffers)
  (powerline-render (list my/tab-left
                          (format " %s  " (buffer-name buffer))
                          my/tab-right)))
(setq tab-line-tab-name-function #'my/tab-line-tab-name-buffer)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)

(set-face-attribute 'tab-line nil ;; background behind tabs
      :background "gray40"
      :foreground "gray60" :distant-foreground "gray50"
      :family "Fira Sans Condensed" :height 1.0 :box nil)
(set-face-attribute 'tab-line-tab nil ;; active tab in another window
      :inherit 'tab-line
      :foreground "gray70" :background "gray90" :box nil)
(set-face-attribute 'tab-line-tab-current nil ;; active tab in current window
      :background "#b34cb3" :foreground "white" :box nil)
(set-face-attribute 'tab-line-tab-inactive nil ;; inactive tab
      :background "gray80" :foreground "black" :box nil)
(set-face-attribute 'tab-line-highlight nil ;; mouseover
      :background "white" :foreground 'unspecified)

(defun mp-split-below (arg)
  "Split window below from the parent or from root with ARG."
  (interactive "P")
  (split-window (if arg (frame-root-window)
                  (window-parent (selected-window)))
                nil 'below nil))
(defun mp-toggle-window-dedication ()
  "Toggles window dedication in the selected window."
  (interactive)
  (set-window-dedicated-p (selected-window)
     (not (window-dedicated-p (selected-window)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SF Mono" :foundry "APPL" :slant normal :weight normal :height 88 :width normal)))))
