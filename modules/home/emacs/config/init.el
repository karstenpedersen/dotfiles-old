;; Garbage collector
(use-package gcmh
  :diminish gcmh-mode
  :config
  (setq gcmh-idle-delay 5
	gcmh-high-cons-threshold (* 16 1024 1024))  ; 16mb
  (gcmh-mode 1))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-percentage 0.1))) ;; Default value for `gc-cons-percentage'

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs ready in %s with %d garbage collections."
		     (format "%.2f seconds"
			     (float-time
			      (time-subtract after-init-time before-init-time)))
		     gcs-done)))

;; Load custom files
(load (expand-file-name "variables.el" user-emacs-directory))
(load (expand-file-name "nix-config.el" user-emacs-directory))

;; Emacs
(setq dired-free-space nil)

;; Whitespaces
(setq show-trailing-whitespace t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq use-short-answers t) ;; "yes" or "no" becomes "y" and "n"
(setq confirm-kill-emacs 'yes-or-no-p) ;; Confirm to quit

;; Lines
;; (setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 80)
(setq line-move-visual t)
(setq sentence-end-double-space nil)

;; Delete
(setq trash-directory variables/trash)
(setq delete-by-moving-to-trash t)

;; recentf-mode
(recentf-mode 1)
(setq recentf-max-saved-items 100)

;; Blank scratch buffer
(setq initial-major-mode 'org-mode ;; Major mode of new buffers
      initial-scratch-message ""
      initial-buffer-choice t)

;; Registers
(setq register-preview-delay 0)
(set-register ?A (cons 'file variables/dotfiles))
(set-register ?B (cons 'file variables/nextcloud))

;; Line numbers
(defun display-line-numbers--turn-on ()
  "Turn on `display-line-numbers-mode'."
  (unless (or (minibufferp) (eq major-mode 'pdf-view-mode) (eq major-mode 'term-mode))
    (display-line-numbers-mode)))

;; Todo
(setq vc-follow-symlinks t)

;; compilation-mode
(use-package compile
  :config
  (setq compilation-scroll-output t)
  (define-key compilation-mode-map (kbd "g") nil)
  (define-key compilation-mode-map (kbd "r") 'recompile)
  (define-key compilation-mode-map (kbd "h") nil)
  (global-set-key (kbd "C-c C-r") 'recompile))
  
;; (with-eval-after-load 'compile

;; Which-key
(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-min-display-lines 3
        which-key-max-display-columns nil)
  (which-key-mode)
  (which-key-setup-minibuffer))

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs_undo_history"))))

(use-package evil
  :init
  (setq evil-want-fine-undo t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-set-initial-state 'debugger-mode 'motion)
  (evil-set-initial-state 'pdf-view-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'calc-mode 'emacs)
  (evil-set-undo-system 'undo-tree)
  (evil-mode))

(use-package evil-surround
  :after evil
  :defer 2
  :config
  (global-evil-surround-mode 1))

(use-package direnv
  :config
  (direnv-mode))

(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package vertico
  :config
  (vertico-mode))

(use-package consult)

(use-package orderless
  :custom
  (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

(use-package marginalia
  :config
  (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))

;; Keybindings
(use-package general)

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 ;; Navigation
 "-" '(dired-jump :which-key "dired jump"))

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

 "f" '(nil :which-key "files")
 "fj" '(consult-find :which-key "find file")
 "fk" '(consult-buffer :which-key "find file")
 "fb" '(consult-bookmark :which-key "bookmarks")
 "fn" '(spacemacs/new-empty-buffer :which-key "new file")
 "fr" '(consult-recent-file :which-key "recent files")

 ;; Windows
 "w" '(nil :which-key "window")
 "wd" '(evil-window-delete :which-key "delete window")
 "w-" '(jib/split-window-vertically-and-switch :which-key "split below")
 "w/" '(jib/split-window-horizontally-and-switch :which-key "split right")
 "wl" '(evil-window-right :which-key "evil-window-right")
 "wh" '(evil-window-left :which-key "evil-window-left")
 "wj" '(evil-window-down :which-key "evil-window-down")
 "wk" '(evil-window-up :which-key "evil-window-up")

 ;; Compilation
 "c" '(nil :which-key "compilation")
 "cc" '(compile :which-key "compile")
 "cr" '(recompile :which-key "recompile")
 "ce" '(compile-goto-error :which-key "compile-goto-error")
 )

(use-package savehist
  :init
  (savehist-mode))

(use-package yasnippet
  :config
  (setq yas-snippet-dirs (list (expand-file-name "snippets/" user-emacs-directory)))
  (yas-global-mode 1))

(use-package magit)

;; Visual packages
(use-package paren
  ;; highlight matching delimiters
  :ensure nil
  :config
  (setq show-paren-delay 0.1
	show-paren-highlight-openparen t
	show-paren-when-point-inside-paren t
	show-paren-when-point-in-periphery t)
  (show-paren-mode 1))

;; LaTeX
(setq org-latex-pdf-process
      '("tectonic -X compile --outdir=%o -Z shell-escape -Z continue-on-errors %f"))

(use-package auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  ;; Tectonic
  ;; https://tectonic-typesetting.github.io/book/latest/howto/auctex-setup/index.html
  (setq TeX-engine-alist '((
			    default
			    "Tectonic"
			    "tectonic -X compile -f plain %T"
			    "tectonic -X watch"
			    nil)))
  (setq LaTeX-command-style '(("" "%(latex)")))
  (setq TeX-process-asynchronous t
	TeX-check-TeX nil
	TeX-engine 'default)
  (let ((tex-list (assoc "TeX" TeX-command-list))
	(latex-list (assoc "LaTeX" TeX-command-list)))
    (setf (cadr tex-list) "%(tex)"
	  (cadr latex-list) "%l"))
  :defer t)

(use-package pdf-tools
  :mode	 ("\\.pdf\\'" . pdf-view-mode)
  :config
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (pdf-tools-loader :no-query)
  (require 'pdf-occur))

;; Presentation mode
(defun my-presentation-on ())

(defun my-presentation-off ())

(add-hook 'presentation-on-hook #'my-presentation-on)
(add-hook 'presentation-off-hook #'my-presentation-off)

(setq presentation-default-text-scale 5)

(use-package presentation :defer t)
