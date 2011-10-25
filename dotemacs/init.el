;; Remove annoying splash screen
(setq inhibit-splash-screen t)

;; stop having to type yes or no and instead just a y or n will suffice
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable fringes ie the big ass margin separator
;; notice this if statement detects if you're in gui mode
(if window-system
    (progn
      (scroll-bar-mode -1)
       (fringe-mode 0)))

(set-face-attribute 'default nil :height 140)


;; Line Numbers - modified version of linum to view line numbers up to current line
(load-file "~/bin/dotfiles/dotemacs/linum.el")
(load-file "~/bin/dotfiles/dotemacs/linum-off.el")
  (line-number-mode 1)
  (column-number-mode 1)  ;; Line numbers on left most column
  (global-linum-mode 1)
  (setq linum-format "%d ")
  ;;(setq linum-format 'dynamic)
  (custom-set-faces
  '(linum ((t (:foreground "yellow")))))

;; ecb/cedet bulky flabby slow loading shit
(if window-system
    (progn
      (add-to-list 'load-path "~/bin/dotfiles/dotemacs/cedet-1.0.0")
      (add-to-list 'load-path "~/bin/dotfiles/dotemacs/ecb-2.402") 
      (load-file "~/bin/dotfiles/dotemacs/cedet-1.0.0/common/cedet.el")
 

      (global-ede-mode 1)                      ; Enable the Project management system
      (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
      (global-srecode-minor-mode 1)            ; Enable template insertion menu

      ;;Remove that damned ecb tip of the day
      (require 'ecb)
      (setq ecb-tip-of-the-day nil)

      ;;keybindings
      (global-set-key (kbd "C-e") 'ecb-activate)
      (global-set-key (kbd "C-c a") 'ecb-deactivate)
      
      (custom-set-variables
       ;; custom-set-variables was added by Custom.
       ;; If you edit it by hand, you could mess it up, so be careful.
       ;; Your init file should contain only one such instance.
       ;; If there is more than one, they won't work right.
       '(ecb-layout-name "left13")
       '(ecb-layout-window-sizes (quote (("left13" (0.20382165605095542 . 0.975609756097561)))))
       '(ecb-options-version "2.40")
       '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
       '(ecb-source-path (quote ("/Users/neil/Projects/pendragon"))))
      (custom-set-faces
       ;; custom-set-faces was added by Custom.
       ;; If you edit it by hand, you could mess it up, so be careful.
       ;; Your init file should contain only one such instance.
       ;; If there is more than one, they won't work right.
       )
      ))

;;Makin emacs look pwettier
(add-to-list 'load-path "~/bin/dotfiles/dotemacs/color-theme-6.6.0")
(add-to-list 'load-path "~/bin/dotfiles/dotemacs/zenburn")
(require 'color-theme)
(color-theme-initialize)
(require 'color-theme-zenburn)
(color-theme-zenburn)

;;open remote directories
(setq tramp-default-method "ssh")

;;view compressed files as a directory
(auto-compression-mode 1)

;;disable menubar,toolbar,scrollbar
(menu-bar-mode -1) 
;;(tool-bar-mode -1) 

(if (functionp 'tool-bar-mode) (tool-bar-mode -1))

;;magit
(add-to-list 'load-path "~/bin/dotfiles/dotemacs/magit")
(require 'magit)                                     

;; create a backup file directory dis shit aint workin
;;(defun make-backup-file-name (file)
;;(concat “~/.emacs.d/emacs_backups/” (file-name-nondirectory file) “~”))

;;highlight current line
(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#330") 


;;emacs default size
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 120))

;;emacs speaks statistics
(add-to-list 'load-path "~/bin/dotfiles/dotemacs/ess-5.14/lisp/ess-site")
(load "~/bin/dotfiles/dotemacs/ess-5.14/lisp/ess-site")
(require 'ess-site)


;;turn off that damn bell
(defun my-bell-function ()
  (unless (memq this-command
		'(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;;ya-snippet
(add-to-list 'load-path
                  "~/bin/dotfiles/dotemacs/yasnippet-0.6.1c")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/bin/dotfiles/dotemacs/yasnippet-0.6.1c/snippets")

;;--------------ido mode ------------------------------

(ido-mode 1)
;;(ido-everywhere 1)
(setq ido-enable-flex-matching t)

;; do not confirm a new file or buffer
(setq confirm-nonexistent-file-or-buffer nil)

;;---------------- ido stuff end -----------------------


;;------------ eshell ----------------------


(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))



;; -----------------------------------------



;;-----------REMAPPED KEYS--------------

;;buffer-menu to current window
(global-set-key "\C-x\C-b" 'buffer-menu)


;;-----------Emacs Debug----------------

;;gimme stack trace showing what function is complaining about the string being nill
(setq debug-on-error t)

;; my try at hiding those damne tilda files, but not disabling their
;; existence
;; save backup and autosave files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


