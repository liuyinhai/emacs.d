
;;(setq-default ispell-program-name "aspell -a -l en")

;; Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

(auto-image-file-mode)

;; (require 'session)
;; (add-hook 'after-init-hook 'session-initialize)

;; (load "desktop") 
;; (desktop-load-default) 
;; (desktop-read)

;; ;;buffer list
;; (require 'ibuffer)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)

;;;
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "") 'tabbar-backward-group)
(global-set-key (kbd "") 'tabbar-forward-group)
(global-set-key (kbd "") 'tabbar-backward)
(global-set-key (kbd "") 'tabbar-forward)

(require 'recentf)
(recentf-mode 1)

(setq imaxima-use-maxima-mode-flag t)
(put 'narrow-to-region 'disabled nil)

(cond
 ((= 24 emacs-major-version)
  (require 'org-latex-hack)))

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

