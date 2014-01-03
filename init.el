;; Will probably need altering machine-dependant
(push "/opt/boxen/homebrew/bin" exec-path)

(add-to-list 'load-path "~/.emacs.d/profiles/")

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

;; Adding additional package directories
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; init package with all package repos
(package-initialize)

(defun packages-install (package-list)
  "Installs and updates all of the packages listed."
  (message "Refreshing the packages...")
  (dolist (package package-list)
    (when (not (package-installed-p package))
      (package-install package)))
  (message "Packages updated successfully."))

(defmacro use-packages (&rest package-list)
  `(packages-install '(,@package-list)))

(load-theme 'zenburn t)

;; A more helpful M-x
(require 'smex)
(smex-initialize)

(load "mattfield/profile")
