;;Remove annoying splash screen
(setq inhibit-splash-screen t)

;; stop having to type yes or no and instead just a y or n will suffice
(fset 'yes-or-no-p 'y-or-n-p)

;;turn off that damn bell
(defun my-bell-function ()
  (unless (memq this-command
		'(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; Line Numbers - modified version of linum to view line numbers up to current line
  (load-file "~/bin/dotfiles/dotemacs/linum.el")
  (load-file "~/bin/dotfiles/dotemacs/linum-off.el")
  (line-number-mode 1)
  (column-number-mode 1)  ;; Line numbers on left most column
  (global-linum-mode 1)
  ;;(setq linum-format "%2d ")
  (setq linum-format 'dynamic)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:foreground "yellow")))))

;;package manager stuff
(require 'package)
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
 '(custom-theme-load-path (quote ("~/bin/dotfiles/dotemacs/themes")))
 '(custom-safe-themes (quote ("e9704e8b957e4151cd570c5f25ec81c297aa2b6a" "517aecb1202bfa31fd3c44473d72483c5166124d" default)))
 '(ecb-layout-name "left13")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))

;;load theme DONT PUT IN "-theme" part of name 
(load-theme 'zenburn)

;; Disable fringes ie the big ass margin separator
;; notice this if statement detects if you're in gui mode
(if window-system
    (progn
      (scroll-bar-mode -1)
       (fringe-mode 0)))

(set-face-attribute 'default nil :height 140)

;;open remote directories
(setq tramp-default-method "ssh")

;;view compressed files as a directory
(auto-compression-mode 1)

;;disable menubar,toolbar,scrollbar
(menu-bar-mode -1) 
;;(tool-bar-mode -1) 

(if (functionp 'tool-bar-mode) (tool-bar-mode -1))

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
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el")

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

;;keybindings
(global-set-key (kbd "C-e") 'ecb-activate)
(global-set-key (kbd "C-c a") 'ecb-deactivate)
