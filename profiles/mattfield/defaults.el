(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default c-basic-offset 2)
(setq-default default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

;; Turn off warning bells entirely in Emacs.App
(setq ring-bell-function 'ignore)

;; Highlight current line
(global-hl-line-mode 1)

;; Auto refresh buffers!
(global-auto-revert-mode 1)

;; Lines should be 80 characters wide
(setq fill-column 80)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

(projectile-global-mode)

;; Pretty lambdas!
(require 'pretty-lambdada)
(pretty-lambda-for-modes)

;; Use scss-mode instead of sass-mode for SCSS files
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

;; Livescript mode
(add-to-list 'load-path "~/.emacs.d/packages/custom/livescript-mode/")
(require 'livescript-mode)
(add-to-list 'auto-mode-alist '("\\.ls\\'" . livescript-mode))

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'pretty-lambda)
(add-hook 'scheme-mode-hook 'pretty-lambda)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; Ensure .coffee files use coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; Use yasnippets EVERYWHERE!
;; (yas-global-mode 1)

;; Expand region delete mode ACTIVATE
(pending-delete-mode t)

;; flx-ido + projectile = \o/
(flx-ido-mode 1)
(setq ido-use-faces nil)

;; Beef-up Emacs GC threshold
(setq gc-cons-threshold 20000000)

(setq clojure-defun-style-default-indent t)

(load-theme 'sanityinc-tomorrow-night t)

;; A more helpful M-x
(require 'smex)
(smex-initialize)

(require 'smart-mode-line)
(setq sml/theme 'dark)
(add-to-list 'sml/replacer-regexp-list '("^~/.emacs.d/" ":ED:"))
(sml/setup)

(require 'quack)

;; Because you should never use OSX native fullscreen <10.9
(setq ns-use-native-fullscreen nil)

;; References Proof General
;; (load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

