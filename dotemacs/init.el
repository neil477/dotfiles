;; Require CL
(require 'cl)

;;setup load-path
(add-to-list 'load-path "~/Dropbox/bin/dotfiles/dotemacs")
(cd "~/Dropbox/bin/dotfiles/dotemacs")
(load "subdirs.el")
(cd "~")

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;;linum mode
(column-number-mode 1)  ;; Line numbers on left most column
(global-linum-mode 1)

(load "~/Dropbox/bin/dotfiles/dotemacs/lisp/linum-mod.el")

;; Turn linum mode off for eshell and minor modes
(require 'linum-off)

;; unique buffers
(require 'uniquify)

(add-to-list 'load-path "~/Dropbox/bin/dotfiles/dotemacs/site-lisp")
(add-to-list 'load-path "~/Dropbox/bin/dotfiles/dotemacs/lisp")

;;load osx specific stuff
;;(load-file "~/Dropbox/bin/dotfiles/dotemacs/osxstuff.el")
(require 'osxstuff.el)

;;term stuff
(require 'ansi-term)

;;Remove annoying splash screen
(setq inhibit-splash-screen t)

;; stop having to type yes or no and instead just a y or n will suffice
(fset 'yes-or-no-p 'y-or-n-p)

;;set the cursor type
(set-default 'cursor-type 'bar)

;; enable universal clipboard
(setq x-select-enable-clipboard t)

;;kill process i dont care if u do
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;;useful stuff from screencast -- http://www.youtube.com/watch?v=a-jRN_ba41w

;;show paren-mode
(show-paren-mode t)

;;transient mark mode
(setq transient-mark-mode t)

;;--------------------------------------------------------------------------------
;; TODO


;;load smart tabs stolen from https://github.com/rmm5t
;;(load "tabs")

;;hippie mode
;;(global-set-key (kbd "TAB") 'hippie-expand)


;; Org Mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/test.org"))


;; erc

;; (setq erc-prompt-for-nickserv-password nil)
;; (setq erc-nickserv-identify-mode 'autodetect)
;; (load "~/.emacs.d/.erc-auth.el") ; erc-password
;; (setq erc-prompt-for-nickserv-password nil)
;; (erc :server "irc.freenode.net" :nick erc-username  :password erc-password)
;; (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#erc" "#python"))))

;;--------------------------------------------------------------------------------

;;remember recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;package manager stuff
(require 'package);
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))

;; Add the user-contributed repository
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'custom-theme-load-path "~/Dropbox/bin/dotfiles/dotemacs/themes")

(add-to-list 'custom-theme-load-path  "~/Dropbox/bin/dotfiles/dotemacs/themes/tomorrow-theme")

;;load theme DONT PUT IN "-theme" part of name 
(load-theme 'base16-tomorrow t)

(setq server-host (system-name)
                server-use-tcp t)

;; Disable fringes ie the big ass margin separator
;; notice this if statement detects if you're in gui mode
;; Start the emacs server
(if (display-graphic-p)
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

;;--------------ido mode ------------------------------

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

;; do not confirm a new file or buffer
(setq confirm-nonexistent-file-or-buffer nil)

;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(setq ido-save-directory-list-file "~/Dropbox/.emacs.d/cache/ido.last"
      ido-ignore-buffers ;; ignore these guys
      '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
      ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
      ido-case-fold  t                 ; be case-insensitive
      
      ido-enable-last-directory-history t ; remember last used dirs
      ido-max-work-directory-list 30   ; should be enough
      ido-max-work-file-list      50   ; remember many
      ido-use-filename-at-point nil    ; don't use filename at point (annoying)
      ido-use-url-at-point nil         ; don't use url at point (annoying
      ido-enable-flex-matching nil     ; don't try to be too smart
      ido-max-prospects 8              ; don't spam my minibuffer
      ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;;----------------------------------------------------


;;------------ eshell ----------------------

(defun clear-shell ()
   (interactive)
   (let ((old-max comint-buffer-maximum-size))
     (setq comint-buffer-maximum-size 0)
     (comint-truncate-buffer)
     (setq comint-buffer-maximum-size (+ 1 old-max))))

;; -----------------------------------------



;;-----------REMAPPED KEYS--------------


(setq mac-option-key-is-meta nil)
;;rebind meta to control
(setq mac-command-key-is-meta t)


;;buffer-menu to current window
(global-set-key "\C-x \C-b" 'buffer-menu)

;;keybindings
(global-set-key (kbd "\C-c e") 'ecb-activate)
(global-set-key (kbd "\C-c d") 'ecb-deactivate)

(global-set-key (kbd "\C-h C-f") 'find-function)
(global-set-key (kbd "\C-c C-w") 'kill-buffer-and-window)
(global-set-key (kbd "\C-c C-e") 'eval-buffer)
(global-set-key (kbd "\C-c C-s") '(lambda () (interactive) (ansi-term "/bin/zsh")))
(global-set-key (kbd "\C-w") 'backward-kill-word)
(global-set-key (kbd "\C-x C-k") 'kill-region) ;;todo
(global-set-key (kbd "\C-c C-k") 'kill-region) ;;todo
(global-set-key (kbd "\C-c \\") 'balance-windows)

(global-set-key (kbd "\M-g") 'goto-line)



;;from http://ergoemacs.org/emacs/effective_emacs.html

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(defun next-emacs-buffer ()
  "Switch to the next emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
Emacs buffers are those whose name starts with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-match "^*" (buffer-name))) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))




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

;; switch quickly between buffers
(global-set-key (kbd "C-<left>") 'previous-user-buffer)
(global-set-key (kbd "C-<right>") 'next-user-buffer)
(global-set-key (kbd "s-<left>") 'previous-emacs-buffer)
(global-set-key (kbd "s-<right>") 'next-emacs-buffer)

(global-set-key (kbd "M-k") 'kill-this-buffer)

;; unbind cmd-k
(global-unset-key (kbd "s-k"))

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


;;----------------ruby stuff------------------------------------------------------


(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.erb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . ruby-mode))

;; for repl
(require 'inf-ruby)

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-setup-keybindings "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings))


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))


(setq exec-path (cons (expand-file-name "/Users/neil/.rvm/gems/ruby-1.9.3-rc1/bin") exec-path))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . scss-mode))

;;--------------------------------------------------------------------------------

;;markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))



;;ecb/cedet

(global-ede-mode 1)                      ;; Enable the Project management system

(setq ecb-tip-of-the-day nil         ;;Remove that damned ecb tip of the day
      ecb-version-check nil
      stack-trace-on-error t
      ecb-layout-name "left13"
      ecb-options-version "2.40"
      ecb-primary-secondary-mouse-buttons '(quote mouse-1--mouse-2))

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

(when (display-graphic-p)
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; TODO unobtrusive bell in modeline
;;turn the alarm bell off without enabling visual bell
(setq ring-bell-function 'ignore)


;; visual line mode enables word wrapping
(visual-line-mode 1)




;;;==================== Window Management ===========================================

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<left>") 'windmove-left)

;;measure time to startup emacs
(defvar *emacs-load-start* (current-time))

(message "My .emacs loaded in %dms" (destructuring-bind (hi lo ms) (current-time)
                             (- (+ hi lo) (+ (first *emacs-load-start*) (second
                             *emacs-load-start*)))))


;; eshell

(setq eshell-banner-message "")

(setq eshell-prompt-function (lambda nil (concat (abbreviate-file-name (eshell/pwd)) "\n ϟ ")))

(setq eshell-prompt-regexp "^[^ϟ]* [ϟ] ")


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


;; dired
(setq dired-listing-switches "-alh")

(add-hook 'dired-load-hook
            (function (lambda () (load "dired-x"))))

(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))


;;anything.el (now helm.el)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

;;pdf
(setq auto-mode-alist (cons '("\\.pdf$" . doc-view-mode) auto-mode-alist))
(setq exec-path (append exec-path '("/usr/local/bin/gs")))

;;add unix newline to end of file
(setq require-final-newline t)


;;delete buffer and file
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

;;--------------------------------------------------------------------------------
;;mode-line
(require 'cust-modeline)


;;---------------------------------------------------------------------
;; ibuffer

(require 'ibuffer) 
(setq ibuffer-saved-filter-groups
  (quote (("default"      
            ("Org" ;; all org-related buffers
              (mode . org-mode))  
            ("Mail"
              (or  ;; mail-related buffers
               (mode . message-mode)
               (mode . mail-mode)
               ;; etc.; all your mail related modes
               ))
            ("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . perl-mode)
                (mode . python-mode)
                (mode . emacs-lisp-mode)
                ;; etc
                )) 
            ("ERC"   (mode . erc-mode))
	    ("Consoles" 
	     (mode . term-mode)
	     )))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

(global-set-key (kbd "C-x C-b") 'ibuffer)


;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "New name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))


;; magit
(require 'magit)



;--------------------------------------------------------------------------------
;;Emacs Help And Documentation

;; Make docs more pretty to read.
;; display horizontal line for the Form Feed char (ASCII 12, ^L) The
;; Form Feed char is often used in elisp source code for marking
;; sections. The command forward-page (and backward-page) moves to the
;; next form feed char.
(require 'pp-c-l)
(setq pp^L-^L-string "                                                           ")
(pretty-control-l-mode 1)

;--------------------------------------------------------------------------------
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;--------------------------------------------------------------------------------
(require 're-builder)
(setq reb-re-syntax 'string)
;--------------------------------------------------------------------------------
(load "~/Dropbox/bin/dotfiles/dotemacs/site-lisp/nxhtml/autostart.el")
