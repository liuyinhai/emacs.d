;;Author:Liu Yinhai
;;Email: yinhai.liu@gmail.com
;;Updated on Mon Sep 30 09:36:45 2013.

(setq load-path (cons "~/.emacs.d" load-path))
(setq load-path (cons "~/.emacs.d/lisp" load-path))
;;(setq load-path (cons "~/.emacs.d/elisp/tramp" load-path))

;;the configuration of appearance of Emacs
(load "init-appear")

;;The shortcut for emacs.
(load "init-shortcut")

;;Config the comman program.
(load "init-program")

;;define the utility function
(load "init-function")

;;Config the feature of coding
(load "init-coding")

(set-background-color "#C7EDCC")

(require 'org-latex-hack)

(unless *is-linux*
  (require 'cl-lib)
  (yas/load-directory "~/.emacs.d/snippets")
  (setenv "http_proxy" "http://web-proxy.oa.com:8080")
  (prefer-coding-system 'gbk)
  (setq default-buffer-file-coding-system 'gbk))

(provide 'init-local)
