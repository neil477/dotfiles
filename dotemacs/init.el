;; Require CL
(require 'cl)

;;setup load-path
(add-to-list 'load-path "~/Dropbox/bin/dotfiles/dotemacs/")

;;load osx specific stuff
(load-file "~/Dropbox/bin/dotfiles/dotemacs/osxstuff.el")


;;Remove annoying splash screen
(setq inhibit-splash-screen t)

;; stop having to type yes or no and instead just a y or n will suffice
(fset 'yes-or-no-p 'y-or-n-p)

;;set the cursor type
(set-default 'cursor-type 'bar)

;;my first elisp
;;(load "scratchquotes")

; assign a list to a var
 ;; (setq myList '(" \"Difficulty's An Excuse \n K'naan \"" "\"You never know when your opportunity is gonna stop...you don't if something happens you may never get that chance again. So when you do have that opportunity you wanna take advantage of it. Thats where I learned how to work hard.\" Jeremy Lin " " \"The biggest thing for you is to do more than just practice with your team. If you're not a good shooter, for me I struggled with my shots so after practise, in the morning, sometimes at midnight I would work on my weaknesses. Find time to work on your game and your weaknesses. \" Jeremy Lin" ))

;; (setq Rmessage (nth (random 3) myList)) 


;; (setq file "~/Dropbox/bin/dotfiles/dotemacs/quotes")

;; (setq Rmessage (processfile file))


;; enable universal clipboard
(setq x-select-enable-clipboard t)


;;inhibit scratch message
;;(setq initial-scratch-message (concat ";;" Rmessage))

;;kill process i dont care if u do
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;;useful stuff from screencast -- http://www.youtube.com/watch?v=a-jRN_ba41w

;;show paren-mode
(show-paren-mode t)

;;transient mark mode
(setq transient-mark-mode t)

;;load smart tabs stolen from https://github.com/rmm5t
;;(load "tabs")

;;hippie mode ToDo
;;(global-set-key (kbd "TAB") 'hippie-expand)




;;--------------------------------------------------------------------------------

;;remember recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; Line Numbers - modified version of linum to view line numbers up to current line
(load-file "~/Dropbox/bin/dotfiles/dotemacs/linum.el")
;; Turn linum mode off for eshell and minor modes
(load-file "~/Dropbox/bin/dotfiles/dotemacs/linum-off.el")  
  ;;(line-number-mode 1)
  (column-number-mode 1)  ;; Line numbers on left most column1
  (global-linum-mode 1)
  ;;(setq linum-format 'dynamic)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(linum ((t (:foreground "yellow")))))

;;package manager stuff
(require 'package);
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

;; Add the user-contributed repository
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get")
(require 'el-get)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-theme-load-path (quote ("~/Dropbox/bin/dotfiles/dotemacs/themes")))
 '(custom-safe-themes (quote ("e9704e8b957e4151cd570c5f25ec81c297aa2b6a" "517aecb1202bfa31fd3c44473d72483c5166124d" default)))
 '(ecb-layout-name "left13")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))

;;load theme DONT PUT IN "-theme" part of name 
(load-theme 'zenburn t)

;; Disable fringes ie the big ass margin separator
;; notice this if statement detects if you're in gui mode
;; Start the emacs server
(if window-system
    (progn
      (scroll-bar-mode -1)
       (fringe-mode 0)
       (server-start)
       (if  (eq nil (get-buffer "*console*")) (ansi-term "/bin/zsh" "console"))))

(set-face-attribute 'default nil :height 140)

;;open remote directories
(setq tramp-default-method "ssh")

;;view compressed files as a directory
(auto-compression-mode 1)

;;disable menubar,toolbar,scrollbar
(menu-bar-mode -1) 

(if (functionp 'tool-bar-mode) (tool-bar-mode -1))


 ;; (set-face-background 'linum nil :background "#CCC")

;;--------------ido mode ------------------------------

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

;; do not confirm a new file or buffer
(setq confirm-nonexistent-file-or-buffer nil)

;;---------------- ido stuff end -----------------------

;;------------ eshell ----------------------


;; (defun eshell/clear ()
;;   (interactive)
;;   (let ((inhibit-read-only t))
;;     (erase-buffer)))

(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size (+ 1 old-max))))

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; -----------------------------------------



;;-----------REMAPPED KEYS--------------


(setq mac-option-key-is-meta nil)
;;rebind meta to control
(setq mac-command-key-is-meta t)


;;buffer-menu to current window
(global-set-key "\C-x\C-b" 'buffer-menu)

;;keybindings
(global-set-key (kbd "C-c e") 'ecb-activate)
(global-set-key (kbd "C-c d") 'ecb-deactivate)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-c C-w") 'kill-buffer-and-window)
(global-set-key (kbd "C-c C-e") 'eval-buffer)
(global-set-key (kbd "C-c C-s") 'eshell)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-c \\") 'balance-windows)


(defun next-buff ()
  "In selected window switch to next buffer."
  (interactive)
  (if (window-minibuffer-p)
      (error "Cannot switch buffers in minibuffer window"))
  (switch-to-next-buffer)

  (if (or (string-equal (buffer-name) "*Messages*") (string-equal (buffer-name) "*scratch*")) (next-buff)))

(defun prev-buff ()
  "In selected window switch to previous buffer."
  (interactive)
  (if (window-minibuffer-p)
      (error "Cannot switch buffers in minibuffer window"))
  (switch-to-prev-buffer)
    (if (or (string-equal (buffer-name) "*Messages*") (string-equal (buffer-name) "*scratch*")) (progn (message "test") (prev-buff))))



;;from http://www.youtube.com/watch?v=a-jRN_ba41w

;; map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap


;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window

;; speed i need speed
(global-set-key (kbd "C-<right>") 'next-buff)
(global-set-key (kbd "C-<left>") 'prev-buff)
(global-set-key (kbd "M-k") 'delete-current-buffer)

;; Unlearn switch buffers
(global-unset-key (kbd "C-x <right>"))
(global-unset-key (kbd "C-x <left>"))


(defun delete-current-buffer () (interactive) (kill-buffer (current-buffer)))





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

(unless (require 'el-get nil t)
(url-retrieve
 "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
 (lambda (s)
   (let (el-get-master-branch)
     (end-of-buffer)
     (eval-print-last-sexp)))))

;;ruby-mode hook
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation))))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))

(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode)))



;; local sources
(setq el-get-sources
      '((:name magit
               :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))
	(:name yaml-mode 
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda () (yaml-mode-hook)))
	(:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
	(:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               :features rhtml-mode
	       :after (lambda () (rhtml-mode-hook)))
	(:name ecb_snap
               :type elpa)
	
	(:name yasnippet
	       :type elpa)

	))
        
(setq my-packages
      (append
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync my-packages)

;;ecb/cedet
(global-ede-mode 1)                      ; Enable the Project management system

;;Remove that damned ecb tip of the day
(setq ecb-tip-of-the-day nil)

(setq ecb-version-check nil)

; Need for ECB in emacs 24
(setq stack-trace-on-error t)

;;----------------------Obligatory Elisp----------------------------------------------------



(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(global-set-key (kbd "C-c x") 'fc-eval-and-replace)




;; prompt before exit

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;;turn the alarm bell off without enabling visual bell
(setq ring-bell-function 'ignore)


;; visual line mode enables word wrapping
(visual-line-mode 1)


;;------------------ Org Mode ------------------------------------------------------------
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/test.org"))


;;-------------------erc------------------------------------------------------------------

;; (setq erc-prompt-for-nickserv-password nil)
;; (setq erc-nickserv-identify-mode 'autodetect)
;; (load "~/.emacs.d/.erc-auth.el") ; erc-password
;; (setq erc-prompt-for-nickserv-password nil)
;; (erc :server "irc.freenode.net" :nick erc-username  :password erc-password)
;; (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#erc" "#python"))))


;;;==================== Window Management ===========================================

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)


;;----------Debugger-------------
 (setq debug-on-error nil)


;;measure time to startup emacs
(defvar *emacs-load-start* (current-time))

(message "My .emacs loaded in %dms" (destructuring-bind (hi lo ms) (current-time)
                             (- (+ hi lo) (+ (first *emacs-load-start*) (second
                             *emacs-load-start*)))))


;; eshell

(setq eshell-banner-message "")

(setq eshell-prompt-function (lambda nil (concat (abbreviate-file-name (eshell/pwd)) "\n ϟ ")))

(setq eshell-prompt-regexp "^[^ϟ]* [ϟ] ")

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)


;; advice function - look into how these work
 (defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
        "Prevent annoying \"Active processes exist\" query when you quit Emacs."
        (flet ((process-list ())) ad-do-it))


(defun save-current-file-path ()
  "Save the current file path in the kill-ring"
  (interactive)
  (message (buffer-file-name))
  (kill-new (buffer-file-name)))

(global-set-key (kbd "M-p") 'save-current-file-path)

;; (substitute-key-definition
;;            'quit-window '(lambda () (interactive) (quit-window "KILL")) global-map)

 ;; (substitute-key-definition 'kill-current-buffer 'kill-buffer map global-map)
