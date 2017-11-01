(use-package ivy :ensure t
  :diminish (ivy-mode . "")
  :demand
  :bind
  (:map ivy-mode-map
        ("C-'" . ivy-avy)
        ("C-s" . swiper)
        ("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file)
        ("C-c g" . counsel-git)
        ("C-c j" . counsel-git-grep)
        ("C-c k" . counsel-ag))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "(%d/%d) "))
