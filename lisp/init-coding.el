;;c 和 c++ 编程。
(require 'cc-mode)
(define-key c-mode-base-map [(return)] 'newline-and-indent)
(add-hook 'c-mode-hook
	 '(lambda ()
         (c-set-style "k&r")))

;;[code];; C/C++/Java mode 
(defun my-c-mode-hook() 
  ;; 将回车代替C-j的功能，换行的同时对齐 
  (define-key c-mode-map [return] 'newline-and-indent) 
  (interactive) 
  ;; 设置C程序的对齐风格 
  (c-set-style "k&r") 
  ;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐 
  ;; (c-toggle-auto-state) 
  ;; 此模式下，当按Backspace时会删除最多的空格 
  (setq tab-width 4 
        ;; this will make sure spaces are used instead of tabs 
        indent-tabs-mode t) 
  (c-toggle-hungry-state) 
  ;; TAB键的宽度设置为8 
  (setq c-basic-offset 4) 
  ;; 在菜单中加入当前Buffer的函数索引 
  (imenu-add-menubar-index) 
  ;; 在状态条上显示当前光标在哪个函数体内部 
  (which-funciton-mode) 
  ) 

(defun my-c++-mode-hook() 
  (define-key c++-mode-map [return] 'newline-and-indent) 
  (interactive) 
  (c-set-style "k&r") 
  ;; (c-toggle-auto-state) 
  (setq tab-width 4 
        ;; this will make sure spaces are used instead of tabs 
        indent-tabs-mode t) 
  (c-toggle-hungry-state) 
  (setq c-basic-offset 4) 
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

(require 'google-c-style)

;; (add-hook 'c-mode-hook 'my-c-mode-hook) 
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook) 
(add-hook 'java-mode-hook 'my-java-mode)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

