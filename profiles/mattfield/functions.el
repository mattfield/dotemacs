;; coffee-mode
(defun coffee-custom ()
  "coffee-mode hook"
  (make-local-variable 'tab-width)
  (set 'tab-width 2)
  (set 'coffee-tab-width 2))
(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; scss-mode
(defun scss-custom ()
  "scss-mode hook"
  (setq css-indent-offset 2)
  (setq css-indent-level 2))
(add-hook 'scss-mode-hook 'scss-custom)

;; livescript-mode
;; (defun livescript-custom ()
;;   "livescript-mode-hook"
;;   (set 'livescript-indent-level 2))
;; (add-hook 'livescript-mode-hook 'livescript-custom)

(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode"
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor and it's beginning, according to the current mode"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

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

(defun kill-and-join-forward (&optional arg)
  "Normally, killing the newline between indented lines doesn't
remove extra spaces caused by indentation. This fixes that"
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
    (kill-line arg)))

(dolist (command '(yank yank-pop))
  (eval '(defadvice command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     js2-mode     scss-mode
                                                     clojure-mode scheme-mode
                                                     haskell-mode ruby-mode
                                                     rspec-mode   python-mode
                                                     c-mode       plain-text-mode
                                                     js2-mode     html-mode
                                                     coffee-mode  haml-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(defun copy-line-or-region ()
  "Copy current line or current selection"
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position (line-beginning-position 2)))))

(defun reindent-whole-buffer ()
  "Reindent the whole buffer"
  (interactive)
  (indent-region (point-min)
                 (point-max)))

(defun cider-namespace-refresh ()
  (interactive)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl)
    (clojure.tools.namespace.repl/refresh)"))

