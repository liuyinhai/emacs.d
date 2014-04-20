;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;define function;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun ska-point-to-register()
    "Store cursorposition _fast_ in a register. 
  Use ska-jump-to-register to jump back to the stored 
  position."
    (interactive)
      (setq zmacs-region-stays t)
        (point-to-register 8))

(defun ska-jump-to-register()
    "Switches between current cursorposition and position
  that was stored with ska-point-to-register."
    (interactive)
      (setq zmacs-region-stays t)
        (let ((tmp (point-marker)))
	          (jump-to-register 8)
		          (set-register 8 tmp)))

; insert-current-time
(defun insert-current-time ()
    "Insert the current time"
    (interactive "*")
    (insert (format-time-string "%Y-%m-%e %k:%M")))


; insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%e")))

