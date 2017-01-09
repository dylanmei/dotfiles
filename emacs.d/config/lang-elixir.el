(require 'init-smartparens)

(use-package alchemist
  :config
  (add-hook 'elixir-mode-hook 'alchemist-mode))

(use-package elixir-mode
  :config
  (add-hook 'elixir-mode-hook #'smartparens-mode))

(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
    :when '(("SPC" "RET"))
    :actions '(insert navigate))
  (sp-local-pair "do" "end"
    :when '(("SPC" "RET"))
    :post-handlers '(sp-ruby-def-post-handler)
    :actions '(insert navigate)))

(provide 'lang-elixir)