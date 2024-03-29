;;; sly-autoloads.el --- autoload definitions for SLY

;; Copyright (C) 2007  Helmut Eller

;; This file is protected by the GNU GPLv2 (or later), as distributed
;; with GNU Emacs.

;;; Commentary:

;; This code defines the necessary autoloads, so that we don't need to
;; load everything from .emacs.
;;
;; JT@14/01/09: FIXME: This file should be auto-generated with autoload cookies.

;;; Code:

(autoload 'sly "sly"
  "Start a Lisp subprocess and connect to its Slynk server." t)

(autoload 'sly-mode "sly"
  "SLY: The Superior Lisp Interaction (Minor) Mode for Emacs." t)

(autoload 'sly-connect "sly"
  "Connect to a running Slynk server." t)

(autoload 'hyperspec-lookup "lib/hyperspec" nil t)

(autoload 'sly-editing-mode "sly" "SLY" t)

(defvar sly-contribs '(sly-fancy)
  "A list of contrib packages to load with SLY.")

(autoload 'sly-setup "sly"
  "Setup some SLY contribs.")

(define-obsolete-variable-alias 'sly-setup-contribs
  'sly-contribs "2.3.2")

(if (or (not (memq 'slime-lisp-mode-hook lisp-mode-hook))
        noninteractive
        (prog1 (y-or-n-p "[sly] SLIME detected in `lisp-mode-hook', which causes keybinding conflicts.
Remove it for this Emacs session?")
          (warn
           "To restore SLIME in this session, customize `lisp-mode-hook'
and replace `sly-editing-mode' with `slime-lisp-mode-hook'.")
          (remove-hook 'lisp-mode-hook 'slime-lisp-mode-hook)))
    (add-hook 'lisp-mode-hook 'sly-editing-mode)
  (warn "`sly.el' loaded OK. To use SLY, customize `lisp-mode-hook' and
replace `slime-lisp-mode-hook' with `sly-editing-mode'."))

(provide 'sly-autoloads)

;;; sly-autoloads.el ends here
;; Local Variables:
;; no-byte-compile: t
;; End:

;;;### (autoloads nil nil ("sly-pkg.el") (0 0 0 0))

;;;***

;;;### (autoloads nil "sly" "sly.el" (0 0 0 0))
;;; Generated autoloads from sly.el

(define-obsolete-variable-alias 'sly-setup-contribs 'sly-contribs "2.3.2")

(defvar sly-contribs '(sly-fancy) "\
A list of contrib packages to load with SLY.")

(autoload 'sly-mode "sly" "\
Minor mode for horizontal SLY functionality.

\(fn &optional ARG)" t nil)

(autoload 'sly-editing-mode "sly" "\
Minor mode for editing `lisp-mode' buffers.

\(fn &optional ARG)" t nil)

(autoload 'sly "sly" "\
Start a Lisp implementation and connect to it.

  COMMAND designates a the Lisp implementation to start as an
\"inferior\" process to the Emacs process. It is either a
pathname string pathname to a lisp executable, a list (EXECUTABLE
ARGS...), or a symbol indexing
`sly-lisp-implementations'. CODING-SYSTEM is a symbol overriding
`sly-net-coding-system'.

Interactively, both COMMAND and CODING-SYSTEM are nil and the
prefix argument controls the precise behaviour:

- With no prefix arg, try to automatically find a Lisp.  First
  consult `sly-command-switch-to-existing-lisp' and analyse open
  connections to maybe switch to one of those.  If a new lisp is
  to be created, first lookup `sly-lisp-implementations', using
  `sly-default-lisp' as a default strategy.  Then try
  `inferior-lisp-program' if it looks like it points to a valid
  lisp.  Failing that, guess the location of a lisp
  implementation.

- With a positive prefix arg (one C-u), prompt for a command
  string that starts a Lisp implementation.

- With a negative prefix arg (M-- M-x sly, for example) prompt
  for a symbol indexing one of the entries in
  `sly-lisp-implementations'

\(fn &optional COMMAND CODING-SYSTEM INTERACTIVE)" t nil)

(autoload 'sly-connect "sly" "\
Connect to a running Slynk server. Return the connection.
With prefix arg, asks if all connections should be closed
before.

\(fn HOST PORT &optional CODING-SYSTEM INTERACTIVE-P)" t nil)

(autoload 'sly-hyperspec-lookup "sly" "\
A wrapper for `hyperspec-lookup'

\(fn SYMBOL-NAME)" t nil)

(autoload 'sly-info "sly" "\
Read SLY manual

\(fn FILE &optional NODE)" t nil)

(if (or (not (memq 'slime-lisp-mode-hook lisp-mode-hook)) noninteractive (prog1 (y-or-n-p "[sly] SLIME detected in `lisp-mode-hook', which causes keybinding conflicts.\nRemove it for this Emacs session?") (warn "To restore SLIME in this session, customize `lisp-mode-hook'\nand replace `sly-editing-mode' with `slime-lisp-mode-hook'.") (remove-hook 'lisp-mode-hook 'slime-lisp-mode-hook))) (add-hook 'lisp-mode-hook 'sly-editing-mode) (warn "`sly.el' loaded OK. To use SLY, customize `lisp-mode-hook' and\nreplace `slime-lisp-mode-hook' with `sly-editing-mode'."))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sly" '("sly-" "define-sly-" "make-sly-" "inferior-lisp-program")))

;;;***
