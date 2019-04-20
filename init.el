(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
 	     '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives
	     '("stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(org-babel-load-file (expand-file-name "~/.emacs.d/conf.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-directory "~/docs/orgfiles")
 '(org-export-html-postamble nil)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (flycheck-rust cargo racer flycheck easy-kill fzf wgrep pcre2el company-go go-projectile gotest go-eldoc company go-mode treemacs-magit treemacs synosaurus dictionary sly all-the-icons-dired all-the-icons-ivy all-the-icons org-pdfview pdf-tools magit git-timemachine treemacs-projectile org-projectile calfw-org counsel-tramp counsel-projectile projectile calfw-cal calfw-ical calfw-gcal calfw org-gcal noflet org-ac web-mode iedit expand-region hungry-delete undo-tree yasnippet-snippets auto-yasnippet yasnippet htmlize org-edna auto-org-md help-find-org-mode ox-reveal which-key use-package try org-bullets counsel color-theme auto-complete ace-window)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
