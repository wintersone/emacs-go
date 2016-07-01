;;; Config for org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-agenda-files (quote ("/Users/huanghuan/Dropbox/daily.org")))
(setq org-log-done t)
;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "/Users/huanghuan/Dropbox/daily.org" "Tasks")
                  "* TODO [#A] %?")))
(provide 'init-org)
