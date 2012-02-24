;;terminal emulator keybinding issues
;;might need to unbind stuff the preferences menu

(global-set-key "\M-[5C" 'next-buffer)
(global-set-key "\M-[5D" 'previous-buffer)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(define-key input-decode-map "\e\eOC" [(meta right)])
(define-key input-decode-map "\e\eOD" [(meta left)])

(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)
(global-set-key [(meta right)] 'windmove-right) 
(global-set-key [(meta left)] 'windmove-left)
