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
        (:name coffee-mode :type elpa)
        (:name flycheck :type marmalade)))
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

(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode"
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(shift return)] 'smart-open-line)
(global-set-key (kbd "M-o") 'smart-open-line)

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor and it's beginning, according to the current mode"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(control shift return)] 'smart-open-line-above)
(global-set-key (kbd "M-O") 'smart-open-line-above)

(global-set-key (kbd "M-S") 'magit-status)

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to beginning of the line.
Toggle between first non-whitespace character and beginning of line.
If ARG is !nil or 1, move forward ARG - 1 lines first. If
point reaches the beginning or end of buffer, stop."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; Remap C-a to `smarter-move-beginning-of-line`
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Highlight comment annotations
(defun font-lock-comment-annotations ()
  "Highlight a bunch of well known comment annotations"
  (font-lock-add-keywords nil
                          '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):" 1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

