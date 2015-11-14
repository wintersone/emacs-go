;;; Config for go
(yas/global-mode 1)
(setq visible-bell t)

(setq inhibit-startup-message t)
(setq default-fill-column 60)
(setq user-full-name "Huan Huang")
(setq user-mail-address "wintersone@gmail.com")

;;%匹配括号
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(provide 'init-local)
