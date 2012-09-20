;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))


;; (defun term-paste ()
;;   (interactive)
;;   ;;; Paste stuff into terminal without having to change modes

;;   (term-line-mode)
;; ;;  (yank)
;; ;;  (term-char-mode)
;;   )


;; (define-key (term-mode-map) (kbd "s-v") nil)

;; (define-key term-mode-map (kbd "s-v") 'term-paste)

(provide 'ansi-term)
