(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default c-basic-offset 2)
(setq-default default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message nil)

(fset 'yes-or-no-p 'y-or-n-p)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

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

;; Use scss-mode instead of sass-mode for SCSS files
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Ensure .coffee files use coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; Use yasnippets EVERYWHERE!
(yas-global-mode 1)

;; Expand region delete mode ACTIVATE
(pending-delete-mode t)

;; flx-ido + projectile = \o/
(flx-ido-mode 1)
(setq ido-use-faces nil)

;; Beef-up Emacs GC threshold
(setq gc-cons-threshold 20000000)
