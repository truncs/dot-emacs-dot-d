 (defun add-to-load-path (path)
   "Adds path to the load-path"
   (add-to-list 'load-path (expand-file-name path)))

 (defmacro set-tab-width(n)
   "Returns a lambda to set tab-width to n"
   `(lambda nil (setq tab-width ,n)))

 (defvar system-prefix nil "system prefix")

 ;; load-paths
 (mapc (lambda (x) (add-to-load-path (concat user-emacs-directory x)))
       '("elisp"
	 "elisp/slime"
	 "elisp/clojure-mode"
	 "elisp/magit"
	 "elisp/color-theme"
	 "elisp/yasnippet-bundle"))


(require 'yasnippet-bundle)
;; autoloads
(autoload 'magit-status "magit" "Magit" t)

 ;; Taken from the comment section in inf-ruby.el
 (autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
 (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
 (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
 (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
 (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
 (add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
 (add-to-list 'load-path "~/.emacs.d/themes")
 (autoload 'clojure-mode "clojure-mode" "A mode for clojure lisp" t)
 (add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
 (autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
 (autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
 (add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)

 ;; No bars please 
 (menu-bar-mode -1)
 (tool-bar-mode -1)
 (scroll-bar-mode -1)

 ;; No startup splash as well
 (setq inhibit-splash-screen t)
 ;; Keys for getting the data in and out of clipboard
 (global-set-key [(shift delete)] 'clipboard-kill-region)
 (global-set-key [(control insert)] 'clipboard-kill-ring-save)
 (global-set-key [(shift insert)] 'clipboard-yank)

 (defun toggle-fullscreen (&optional f)
   (interactive)
   (let ((current-value (frame-parameter nil 'fullscreen)))
     (set-frame-parameter nil 'fullscreen
			  (if (equal 'fullboth current-value)
			      (if (boundp 'old-fullscreen) old-fullscreen nil)
			    (progn (setq old-fullscreen current-value)
				   'fullboth)))))

 (global-set-key [f11] 'toggle-fullscreen)

 ; Make new frames fullscreen by default. Note: this hook doesn't do
 ; anything to the initial frame if it's in your .emacs, since that file is
 ; read _after_ the initial frame is created.
 (add-hook 'after-make-frame-functions 'toggle-fullscreen)

 ; font size
 (set-face-attribute 'default nil :height 110)


 (load-file "~/.emacs.d/themes/zenburn.el")
 (load-file "~/.emacs.d/themes/color-theme-blackboard.el")
 (load-file "~/.emacs.d/themes/color-theme-molokai.el")
 (load-file "~/.emacs.d/themes/color-theme-twilight.el")
 ;(load file "~/.emacs.d/themes/color-theme-vibrant-ink.el")
 ;(require 'magit)
 ;(if window-system
 ;   (color-theme-blackboard))
 ;(if window-system
 ;    (color-theme-twilight))
 (color-theme-molokai)
 ;(if window-system
 ;    color-theme-charcoal-black))

(ido-mode 1)
(iswitchb-mode 1)