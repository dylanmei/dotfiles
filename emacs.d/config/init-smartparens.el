(use-package smartparens
  :init
  (progn
    (use-package smartparens-config)
    (use-package smartparens-html)
    (smartparens-global-mode 1)
    (show-smartparens-global-mode 1))
  :ensure t
  :config
  (progn
    (setq smartparens-strict-mode 1)
    (setq sp-highlight-pair-overlay nil)))

(use-package evil-smartparens
  :ensure t
  :config
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(provide 'init-smartparens)
