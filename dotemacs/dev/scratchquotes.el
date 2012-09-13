(defun read-lines (fPath) 
  "Return a list of lines of a file at at FPATH." 
  (with-temp-buffer 
    (insert-file-contents fPath) 
    (split-string (buffer-string) "\n" t)))

(defun processfile (file) 
  (if (file-readable-p file)
      (setq myList (read-lines file)
	    (setq Rmessage (nth (random (length '(myList))) myList)))
    (message "file does not exit"
	     (setq Rmessage "")
	     )
    )
  )
