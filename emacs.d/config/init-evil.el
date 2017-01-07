
(use-package evil
  :ensure t
  :config
  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous
    (kbd "C-d")     'evil-scroll-down
    (kbd "C-u")     'evil-scroll-up)
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
	"b" 'helm-buffers-list
	"f" 'helm-find-files
	"m" 'helm-recentf
	"p" 'fzf
	"P" 'fzf-directory
	"x" 'helm-M-x
	"y" 'helm-show-kill-ring
    )))

(provide 'init-evil)
