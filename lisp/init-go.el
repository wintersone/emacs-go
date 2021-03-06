;;; Config for go
(require 'go-mode-autoloads)
(require 'go-autocomplete)
(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)
(require 'go-flycheck)
(require 'yasnippet)
;;打开Yasnippet模式
(yas/global-mode 1)

(load-file "~/gocode/src/golang.org/x/tools/cmd/oracle/oracle.el")
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
  ; Go Oracle
(add-hook 'go-mode-hook 'my-go-mode-hook)
(provide 'init-go)
