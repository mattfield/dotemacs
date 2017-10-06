(add-to-list 'load-path "~/.emacs.d/profiles/")

(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))

;; Adding additional package directories
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
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

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(custom-enabled-themes (quote (smart-mode-line-dark)))
 '(custom-safe-themes
   (quote
    ("e269026ce4bbd5b236e1c2e27b0ca1b37f3d8a97f8a5a66c4da0c647826a6664" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "3e7420b886a5ec5c4fd8328c4b1d9f0f9d5e49e60ee4d5fd9a228078affb3828" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(fci-rule-color "#373b41")
 '(package-selected-packages
   (quote
    (circe-notifications dakrone-theme es-mode dockerfile-mode slack helm-itunes helm-youtube helm-smex helm-make helm-gitignore helm-projectile helm helm-flx exec-path-from-shell yaml-mode terraform-mode smooth-scrolling smex smart-mode-line puppet-mode projectile pretty-lambdada paredit magit go-mode flx-ido expand-region evil-visual-mark-mode evil-matchit dired+ color-theme-sanityinc-tomorrow color-theme-approximate better-defaults)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))

(load "mattfield/profile")

(color-theme-approximate-on)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
