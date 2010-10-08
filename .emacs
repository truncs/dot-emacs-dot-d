;; Taken from the comment section in inf-ruby.el
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
(add-to-list 'load-path "~/.emacs.d/color-theme")
(autoload 'clojure-mode "clojure-mode" "A mode for clojure lisp" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)
(add-hook 'clojure-mode-hook 'clojure-test-maybe-enable)


(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/zenburn.el")
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
(require 'magit)
;(if window-system
;    (color-theme-blackboard))
(if window-system
    (color-theme-zenburn))
