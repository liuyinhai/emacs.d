;;The shortcut for emacs.

(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'wy-go-to-char)
(global-set-key (kbd "C-3") 'copy-region-as-kill) 
(global-set-key (kbd "C-4") 'save-buffer)
(global-set-key (kbd "C-5") 'comment-region)
(global-set-key (kbd "C-6") 'uncomment-region)
(global-set-key (kbd "C-7") 'backward-kill-word)
(global-set-key (kbd "C-8") 'set-mark-command)
(global-set-key (kbd "C-9") 'switch-to-buffer)
(global-set-key (kbd "C-0") 'other-window) 

(global-set-key [f1] 'find-file)
(global-set-key [f2] 'goto-line)
(global-set-key [f3] 'compile)
(global-set-key [f4] 'shell)
(global-set-key [f5] 'switch-to-buffer)
(global-set-key [f6] 'set-mark-command)
(global-set-key [f7] 'mark-whole-buffer)
(global-set-key [f8] 'list-buffers)
(global-set-key [f9] 'dabbrev-expand)
(global-set-key [f10] 'kmacro-end-and-call-macro)
(global-set-key [f11] 'semantic-chart-tag-complexity)
(global-set-key [f12] 'speedbar)
(global-set-key [C-tab] "\C-q\t")

(global-set-key "%" 'match-paren)
(define-key global-map (kbd "C-c o") 'just-one-space)
(define-key global-map (kbd "C-c x") 'kill-region)
(define-key global-map (kbd "C-c c") 'copy-region-as-kill)
(define-key global-map (kbd "C-c t") 'insert-current-time)
(define-key global-map (kbd "C-c d") 'insert-date)
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
;; Mouse
(global-set-key [mouse-2] 'imenu)

;;
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

