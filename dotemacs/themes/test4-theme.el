;;; test4-theme.el --- Custom face theme for Emacs

;; Copyright (C) 2010 neil b.

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(deftheme test4)

(custom-theme-set-faces
 'test4
 '(default ((t (:background "#000200" :foreground "#FFFFFF"))))
 '(cursor ((t (:background "#FFFFFF" :foreground "#ffffff"))))
 '(region ((t (:background "#323232"))))
 '(mode-line ((t (:background "#bfbfbf" :foreground "#000000"))))
 '(mode-line-inactive ((t (:background "#e5e5e5" :foreground "#333333"))))
 '(fringe ((t (:background "#f2f2f2"))))
 '(minibuffer-prompt ((t (:foreground "#0000cd"))))
 '(font-lock-builtin-face ((t (:foreground "#387788"))))
 '(font-lock-comment-face ((t (:foreground "#DE4B0C"))))
 '(font-lock-constant-face ((t (:foreground "#35BE1B"))))
 '(font-lock-function-name-face ((t (:foreground "#45BE00"))))
 '(font-lock-keyword-face ((t (:foreground "#3DC200"))))
 '(font-lock-string-face ((t (:foreground "#F70000"))))
 '(font-lock-type-face ((t (:foreground "#228b22"))))
 '(font-lock-variable-name-face ((t (:foreground "#947100"))))
 '(font-lock-warning-face ((t (:foreground "#ff0000" :weight bold))))
 '(isearch ((t (:background "#cd00cd" :foreground "#b0e2ff"))))
 '(lazy-highlight ((t (:background "#afeeee"))))
 '(link ((t (:foreground "#0000ff" :underline t))))
 '(link-visited ((t (:foreground "#8b008b" :underline t))))
 '(button ((t (:underline t))))
 '(header-line ((t (:background "#e5e5e5" :foreground "#333333")))))

(provide-theme 'test4)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; test4-theme.el  ends here
