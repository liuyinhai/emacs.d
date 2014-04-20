(defun sanityinc/gbk-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "GBK" v)))

(defun locale-is-gbk-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/gbk-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/gbk-locale-p (getenv "LC_ALL"))
      (sanityinc/gbk-locale-p (getenv "LC_CTYPE"))
      (sanityinc/gbk-locale-p (getenv "LANG"))))

(when (or window-system (locale-is-gbk-p))
  (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (set-language-environment 'Chinese-GBK)
  (setq locale-coding-system 'gbk)
  (set-default-coding-systems 'gbk)
  (set-terminal-coding-system 'gbk)
  (unless (eq system-type 'windows-nt)
   (set-selection-coding-system 'gbk))
  (prefer-coding-system 'gbk))

(provide 'init-locales)
