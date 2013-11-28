;; Remap C-x f to use projectile's find file
(global-set-key (kbd "C-x f") 'projectile-find-file)

;; Meta-x uses smex, Meta-X reverts to default
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; More useful line indenting and line opening
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-o") 'smart-open-line)
(global-set-key [(control shift return)] 'smart-open-line-above)
(global-set-key (kbd "M-O") 'smart-open-line-above)

;; Meta-S shortcut for Magit
(global-set-key (kbd "M-S") 'magit-status)

;; Remap C-a to `smarter-move-beginning-of-line`
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Vim-style line collapsing
(global-set-key "\C-k" 'kill-and-join-forward)
