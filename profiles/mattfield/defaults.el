(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default c-basic-offset 2)
(setq-default default-tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(if (fboundp 'fringe-mode) (set-fringe-style -1))
(tooltip-mode -1)

;; Turn off warning bells entirely in Emacs.App
(setq ring-bell-function 'ignore)

;; Highlight current line
(global-hl-line-mode 0)

;; Auto refresh buffers!
(global-auto-revert-mode 1)

;; Lines should be 80 characters wide
(setq fill-column 80)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

(projectile-global-mode)

;; Expand region delete mode ACTIVATE
(pending-delete-mode t)

;; Beef-up Emacs GC threshold
(setq gc-cons-threshold 20000000)

;; (load-theme 'dakrone t)
(load-theme 'misterioso t)

(require 'smooth-scrolling)
(smooth-scrolling-mode t)

(require 'smart-mode-line)
(setq sml/theme 'respectful)
(add-to-list 'sml/replacer-regexp-list '("^~/.emacs.d/" ":ED:"))
(sml/setup)

(require 'git-gutter+)
(global-git-gutter+-mode)

(require 'use-package)
(setq use-package-always-ensure t)

;; Because you should never use OSX native fullscreen <10.9
(setq ns-use-native-fullscreen nil)

(add-hook 'json-mode-hook
          (lambda ()
            (setq json-reformat:indent-width 2)))
