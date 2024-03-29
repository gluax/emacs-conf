(setq user-full-name "Jon Pavlik"
      user-mail-address "jonathan.t.pavlik@gmail.com")

(global-set-key (kbd "\e\ec")
                (lambda () (interactive) (find-file "~/docs/orgfiles/gcal.org")))
(global-set-key (kbd "\e\eg")
                (lambda () (interactive) (find-file "~/docs/orgfiles/games.org")))
(global-set-key (kbd "\e\el")
                (lambda () (interactive) (find-file "~/docs/orgfiles/links.org")))
(global-set-key (kbd "\e\en")
                (lambda () (interactive) (find-file "~/docs/orgfiles/notes.org")))
(global-set-key (kbd "\e\em")
                (lambda () (interactive) (find-file "~/docs/orgfiles/memes.org")))
(global-set-key (kbd "\e\es")
                (lambda () (interactive) (find-file "~/docs/orgfiles/stories.org")))

;; font
(set-default-font "Monospace-12")

;; disable typical start scren
(setq inhibit-splash-screen t)
(setq inihbit-startup-screen t)

;; disable menu bars and scroll bar 
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; highlights line mode
;; (global-hl-line-mode 1)

;; display line number
(global-linum-mode 1)

;; rename yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; bind revert buffer to f5
(global-set-key (kbd "<f5>") 'revert-buffer)

;; auto close pairs
(electric-pair-mode 1)

(setq save-interprogram-paste-before-kill t)

;; auto reload files if they changed on system
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;; Key binding to macro that opens a terminal in screen mode with zsh.
(fset 'screen
      [?\M-x ?t ?e ?r ?m return return ?s ?c ?r ?e ?e ?n return ? ])
(global-set-key (kbd "C-x t") 'screen)

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-;") 'mc/mark-all-like-this))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package pcre2el
  :ensure t
  :config
  (pcre-mode))

(use-package wgrep
  :ensure t)

(use-package fzf
  :ensure t)

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] #'easy-kill)
  (global-set-key [remap mark-sexp] #'easy-mark))

;; Better buffer list interface
(defalias 'list-buffers 'ibuffer)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key[remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-char)
	 ("C-'" . avy-goto-char-2)))

(use-package auto-complete
  :ensure t
  :init
  (progn
    ;;(ac-config-default)
    ;;(global-auto-complete-mode t)
    ))

(use-package color-theme
  :ensure t
  :config
  (color-theme-initialize)
  (color-theme-subtle-hacker))

(use-package ox-reveal
  :ensure ox-reveal
  :config
  (when org-reveal-note-key-char
    (add-to-list 'org-structure-template-alist
		 '(org-reveal-note-key-char . "NOTES")))

  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js@3.6.0")
  (setq org-reveal-mathjax t)
  ;; reset org structure templates bc reveal breaks it
  (setq org-structure-template-alist (eval (car (get 'org-structure-template-alist 'standard-value)))))

(use-package htmlize
  :ensure t)

(use-package yasnippet-snippets
  :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("html" . (ac-sourc-words-in-buffer ac-source-abbrev))))
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (global-set-key (kbd "C-c p SPC") 'counsel-projectile)
  (global-set-key (kbd "C-c p s i") 'counsel-projectile-git-grep))

(require 'org-tempo)

(use-package org
  :ensure org-plus-contrib
  :defer 7)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/docs/orgfiles")
 '(org-export-html-postamble nil)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t))

(setq org-file-apps
      (append '(
                ("\\.pdf\\'" . "evince %s")
                ) org-file-apps ))

(define-key global-map "\C-ca" 'org-agenda)

(use-package org-ac
  :ensure t
  :init (progn
          (require 'org-ac)
          (org-ac/config-default)
          ))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/docs/orgfiles/gcal.org"))

(setq org-capture-templates
      '(
        ("a" "Appointment" entry (file+headline "~/docs/orgfiles/gcal.org" "Appointments:")
         "* TODO %?\n:PROPERTIES:\n\n:END:\n:DEADLINE: %^T \n %i\n")
        ("g" "Game Idea" entry (file+headline "~/docs/orgfiles/games.org" "Game Ideas:")
         "* TODO %?\n:PROPERTIES:\n\n:END:\n:DEADLINE: %^T \n %i\n")
        ("l" "Link" entry (file+headline "~/docs/orgfiles/links.org" "Links:")
         "* %? [[%^{Link}][%^{Description}]] %^g")
        ("m" "Memes" entry (file+headline "~/docs/orgfiles/memes.org" "Memes:")
         "* %? [[%^{Link}][%^{Description}]] %^g")
        ("n" "Notes" entry (file+headline "~/docs/orgfiles/notes.org" "Notes:")
         "* %u %?" :prepend t)
        ("t" "Projectile Projects" entry (file "~/docs/orgfiles/projects.org")
         "* %^{Project Path}")
        ("s" "Story Idea" entry (file+headline "~/docs/orgfiles/stories.org" "Story Ideas:")
         "* TODO %?\n:PROPERTIES:\n\n:END:\n:DEADLINE: %^T \n %i\n")
        ))

(defun load-projectile-projects-from-org (file)
  (if (file-exists-p file)
      (with-temp-buffer
        (insert-file-contents file)
        (loop for project in (split-string (string-trim (buffer-string)) "\n")
              do (projectile-add-known-project (file-name-as-directory (string-trim-left project "* ")))
              )) nil))

(defun load-most-recent-projectile-project-from-org (file)
  (if (file-exists-p file)
      (with-temp-buffer
        (insert-file-contents file)
        (projectile-add-known-project (string-trim-left (car(reverse(split-string (string-trim (buffer-string)) "\n"))) "* "))
        )) nil)

(require 'org-tempo)

(use-package org
  :ensure org-plus-contrib
  :defer 7)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(custom-set-variables
 '(org-directory "~/docs/orgfiles")
 '(org-export-html-postamble nil)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t))

(setq org-file-apps
      (append '(
                ("\\.pdf\\'" . "evince %s")
                ) org-file-apps ))

(global-set-key "\C-ca" 'org-agenda)

(use-package org-ac
  :ensure t
  :init (progn
          (require 'org-ac)
          (org-ac/config-default)
          ))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list "~/docs/orgfiles/gcal.org" "~/docs/orgfiles/classes.org"))

(defadvice org-capture-finalize
    (after delete-capture-frame activate)
  "Advise capture-finalize to close the frame."
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(defadvice org-capture-destroy
    (after delete-capture-frame activate)
  "Advise capture-destroy to close the frame."
  (if (equal "capture" (frame-parameter nil 'name))
      (delete-frame)))

(use-package noflet
  :ensure t)

(defun make-capture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame'((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
    (org-capture)))

;; Load gcal api secrets from file.
(let ((g-secrets "~/gsecrets.el"))
  (when (file-exists-p g-secrets)
    (load g-secrets)))

(use-package org-gcal
  :ensure t
  :config
  (setq org-gcal-client-id gcal-client-id
        org-gcal-client-secret gcal-client-secret
        org-gcal-file-alist '(("jonathan.t.pavlik@gmail.com" . "~/docs/orgfiles/gcal.org")
                              ("gfiun4c6u8ksdvl4esmtp9vlns@group.calendar.google.com" . "~/docs/orgfiles/classes.org"))))


(defun org-capture-after-finalize-hooks ()
  (when (string= "a" (plist-get org-capture-plist :key))
    (org-gcal-sync))
  (when (string= "t" (plist-get org-capture-plist :key))
    (load-most-recent-projectile-project-from-org "~/docs/orgfiles/projects.org"))
  )
;;(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync))
(add-hook 'org-capture-after-finalize-hook #'org-capture-after-finalize-hooks)

(use-package calfw
  :ensure t
  :ensure calfw-org
  :ensure calfw-ical
  :config
  (setq cfw:org-overwrite-default-keybinding t)
  ;; Define a macro to open agenda file as a calfw calendar.
  (fset 'mycal
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([3 97 97 134217848 99 102 119 58 111 112 101 14 14 tab return] 0 "%d")) arg)))
  (global-set-key (kbd "\e\ec") 'mycal))

(use-package calfw-org
  :ensure t)

(use-package calfw-gcal
  :ensure t
  :config
  (require 'calfw-gcal))

(use-package org-projectile
  :ensure t
  :bind
  ("C-c n p" . org-projectile-project-todo-completing-read)
  :config
  (progn
    (setq org-projectile-projects-file
          "~/docs/orgfiles/project_tools.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-follow-after-init t
          treamacs-width 35
          treemacs-indentation 2
          treemacs-git-intergration t
          treemacs-collapse-dirs 3
          treemacs-silent-refresh nil
          treemacs-change-root-without-asking nil
          tremacs-sorting 'alphabetic-desc
          treemacs-show-hidden-files t
          treemacs-never-persist nil
          treemacs-is-never-other-window nil
          treeacs-goto-tag-strategy 'refetch-index)
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t))
  :bind
  (:map global-map
        ([f8] . treemacs)
        ([f9] . treemacs-projectile)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package all-the-icons
  :ensure t
  :defer 0.5)

(use-package all-the-icons-ivy
  :ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))

(use-package all-the-icons-dired
  :ensure t)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package magit
  :ensure t
  :init
  (progn
    (bind-key "C-x g" 'magit-status)))

(use-package git-timemachine
  :ensure t)

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

(use-package org-pdfview
  :ensure t)

(use-package dictionary
  :ensure t)

(use-package synosaurus
  :ensure t)

(use-package company               
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
          ;; Easy navigation to candidates with M-<n>
          company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package sly
  :ensure t)

(use-package go-mode
   :ensure t
  :init
  (setq gofmt-command "goimports")
  (defun custom-go-mode-hook () 
    (setq tab-width 2 indent-tabs-mode 1)
    (go-eldoc-setup)
    (local-set-key (kbd "M-.") #'godef-jump)
    (add-hook 'before-save-hook 'gofmt-before-save))
  (add-hook 'go-mode-hook 'custom-go-mode-hook))

(use-package go-eldoc
  :ensure t
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package gotest
  :after go-mode
  :ensure t) 

(use-package go-projectile
  :after projectile
  :ensure t)

(use-package company-go
  :after company
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

(use-package racer
  :ensure t
  :config
  (add-hook 'racer-mode-hook #'company-mode)
  (setq company-tooltip-align-annotations t)
  (setq racer-rust-src-path "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))

(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (setq rust-format-on-save t))

(use-package cargo
  :ensure t
  :config
  (setq compilation-scroll-output t)
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package flycheck-rust
  :after flycheck
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-hook 'rust-mode-hook 'flycheck-mode))
