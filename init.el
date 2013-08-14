;; Will probably need altering machine-dependant 
(push "/opt/boxen/homebrew/bin" exec-path)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
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

;; Get some better-defaults! Added as git submodule
(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

;; Grabbin' Emacs 24 packaging 
(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

;; Use el-get
(add-to-list 'load-path "~/.emacs.d/el-get")
(require 'el-get)

;; Adding additional package directories
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; init package with all package repos
(package-initialize)

;; Grab all yo packages
(setq el-get-sources
      '((:name ruby-mode
               :type elpa
               :load "ruby-mode.el")
        (:name inf-ruby :type elpa)
        (:name css-mode :type elpa)
        (:name haml-mode :type elpa)
        (:name magit :type marmalade)
        (:name sass-mode :type elpa)
        (:name undo-tree :type elpa)
        (:name smex :type elpa)
        (:name js2-mode :type elpa)
        (:name coffee-mode :type elpa)))
(el-get 'sync)

(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))
(load-theme 'zenburn t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; A more helpful M-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Old M-x binding
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Ensure .coffee files use coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))

;; Set RET to newline AND indent
(define-key global-map (kbd "RET") 'newline-and-indent)
