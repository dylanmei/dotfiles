(package-initialize)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;; Don't litter my init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Essential settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq vc-follow-symlinks t)

;; Package-specific configs
(require 'init-evil)
(require 'init-smartparens)
(require 'init-auto-save)

(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package fzf
  :ensure t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (setq helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
        helm-autoresize-mode t
        helm-split-window-in-side-p t
        helm-scroll-amount 8
        helm-move-to-line-cycle-in-source t
        helm-ff-file-name-history-use-recentf t
        helm-echo-input-in-header-line t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)
  (helm-mode 1))

(use-package projectile
  :ensure t
  :defer 1
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package undo-tree
  :ensure t
  :diminish t
  :config
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist
  (list (cons "." (expand-file-name "undo-tree-history" user-emacs-directory)))))

(require 'lang-elixir)
(provide 'init)
