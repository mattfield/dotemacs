;; Remap C-x f to use projectile's find file
(global-set-key (kbd "C-x f") 'projectile-find-file)

;; Meta-x uses smex, Meta-X reverts to default
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; More useful line indenting and line opening
;; (define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-o") 'smart-open-line)
(global-set-key [(control shift return)] 'smart-open-line-above)
(global-set-key (kbd "M-O") 'smart-open-line-above)

;; Shortcut for magit-status
(global-set-key (kbd "C-c m s") 'magit-status)

;; Remap C-a to `smarter-move-beginning-of-line`
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Vim-style line collapsing
(global-set-key "\C-k" 'kill-and-join-forward)

;; Expand region
(global-set-key (kbd "C-\\") 'er/expand-region)

(global-set-key (kbd "M-Q") 'reindent-whole-buffer)

;; Copy to system clipboard
(defun copy-to-system-clipboard ()
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "pbcopy"))

(global-set-key (kbd "C-M-c") 'copy-to-system-clipboard)

;(global-set-key (kbd "C-c r") 'cider-namespace-refresh)
