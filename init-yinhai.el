
(set-background-color "#C7EDCC")

;; remove toolbar mode
(tool-bar-mode -1)

(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq mouse-yank-at-point t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)


;; 去掉菜单栏
;; (menu-bar-mode nil)
;; 去掉滚动条
(scroll-bar-mode nil)
;; 语法高亮
(global-font-lock-mode t)

;; 显示行号
;;(global-linum-mode t)
;;(global-linum-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;快捷键
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
(global-set-key [f8] 'other-window)
(global-set-key [f9] 'dabbrev-expand)
(global-set-key [f10] 'kmacro-end-and-call-macro)
(global-set-key [f11] 'semantic-chart-tag-complexity)
(global-set-key [f12] 'speedbar)
(global-set-key [C-tab] "\C-q\t")   ; Control tab quotes a tab.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;Setq;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(setq-default ispell-program-name "aspell -a -l en")

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

(auto-image-file-mode)



;; ;;;备份设置
;; (setq backup-by-copying-when-mismatch t)
;; (setq make-backup-files t) 
;; (setq version-control t)
;; (setq kept-old-versions 1) 
;; (setq kept-new-versions 5) 
;; (setq delete-old-versions t)
;; (require 'backup-dir) 
;; (setq bkup-backup-directory-info 
;;       '((t "/home/meteor/.backups" ok-create full-path))) 
 
(put 'upcase-region 'disabled nil)

;(load "desktop") 
;(desktop-load-default) 
;(desktop-read)

(setq imaxima-use-maxima-mode-flag t)
(put 'narrow-to-region 'disabled nil)

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
;;;


; insert-current-time
(defun insert-current-time ()
    "Insert the current time"
    (interactive "*")
    (insert (current-time-string)))


; insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 %l:%M %a %p")))

;;c 和 c++ 编程。
(require 'cc-mode)
(define-key c-mode-base-map [(return)] 'newline-and-indent)
(add-hook 'c-mode-hook
	 '(lambda ()
         (c-set-style "k&r")))

[code];; C/C++/Java mode 
(defun my-c-mode-hook() 
  ;; 将回车代替C-j的功能，换行的同时对齐 
  (define-key c-mode-map [return] 'newline-and-indent) 
  (interactive) 
  ;; 设置C程序的对齐风格 
  ;; (c-set-style "k&r") 
  ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐 
  ;; (c-toggle-auto-state) 
  ;; 此模式下，当按Backspace时会删除最多的空格 
  (c-toggle-hungry-state) 
  ;; TAB键的宽度设置为8 
  (setq c-basic-offset 4) 
  ;; 在菜单中加入当前Buffer的函数索引 
  (imenu-add-menubar-index) 
  ;; 在状态条上显示当前光标在哪个函数体内部 
  (which-function-mode) 
  ) 
(defun my-c++-mode-hook() 
  (define-key c++-mode-map [return] 'newline-and-indent) 
  (interactive) 
  (c-set-style "k&r") 
  ;; (c-toggle-auto-state) 
  ;; (c-toggle-hungry-state) 
  ;; (setq c-basic-offset 4) 
  (imenu-add-menubar-index) 
  (which-function-mode) 
  ) 
(defun my-java-mode() 
  (define-key java-mode-map [return] 'newline-and-indent) 
  (interactive) 
  (c-set-style "java") 
  (c-toggle-auto-state) 
  (c-toggle-hungry-state) 
  (setq c-basic-offset 4) 
  (imenu-add-menubar-index) 
  (which-function-mode) 
  ) 
(add-hook 'c-mode-hook 'my-c-mode-hook) 
(add-hook 'c++-mode-hook 'my-c++-mode-hook) 
(add-hook 'java-mode-hook 'my-java-mode)

;;octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))


;; (require 'cedet)
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)


;;auctex
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)

;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (load "preview-latex.el" nil t t)

;; (add-to-list 'load-path
;;              "~/.emacs.d/plugins/yasnippet-0.6.1c")
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

;; ;;             C  mode
;; (add-hook 'c-mode-hook 'hs-minor-mode)
;; (defun my-c-mode-auto-pair ()
;;   (interactive)
;;   (make-local-variable 'skeleton-pair-alist)
;;   (setq skeleton-pair-alist  '(
;;     (?` ?` _ "''")
;;     (?\( ?  _ " )")
;;     (?\[ ?  _ " ]")
;;     (?{ \n > _ \n ?} >)))
;;   (setq skeleton-pair t)
;;   (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
;;   (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;; (add-hook 'c-mode-hook 'my-c-mode-auto-pair)

;; (require 'header2)
;; (setq make-header-hooks '(header-mode-line
;;                             header-blank
;;                             header-file-name
;;                             header-blank
;;                             header-copyright
;;                             header-blank
;;                             header-rcs
;;                             header-author
;;                             header-creation-date
;;                             header-modification-author
;;                             header-modification-date
;;                             header-update-count
;;                             ))

;; (setq make-header-hooks '(header-mode-line
;;                             header-blank
;;                             header-file-name
;;                             header-blank
;;                             header-copyright
;;                             header-blank
;;                             header-rcs
;;                             header-author
;;                             header-creation-date
;;                             header-modification-author
;;                             header-modification-date
;;                             header-update-count
;;                             header-blank
;;                             header-history
;;                             header-blank
;;                             ))
(setq header-copyright-notice " Copyright (C) 2013 Yinhai Liu Email:yinhai.liu@gmail.com" )

(provide 'init-yinhai)
