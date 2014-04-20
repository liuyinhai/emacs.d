;;This file is the configuration of appearance  of Emacs.

(set-background-color "#C7EDCC")

(tool-bar-mode -1)
;; (menu-bar-mode nil)
(scroll-bar-mode nil)
(global-font-lock-mode t)

(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq mouse-yank-at-point t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq make-backup-files nil) 

;; Dispay the filename on the title tar.
(setq frame-title-format
      '("" (buffer-file-name "%f"
					(dired-directory dired-directory "%b"))))
;;(global-linum-mode t)
;;(global-linum-mode nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;; Courier New; Consolas
 
 '(default ((t (:inherit nil :stipple nil :background "#C7EDCC" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New")))))
