;; (defun emacs-re-enable-frame-theme (_frame)
;;   "Re-enable active theme, if any, upon FRAME creation.
;; Add this to `after-make-frame-functions' so that new frames do
;; not retain the generic background set by the function
;; `emacs-avoid-initial-flash-of-light'."
;;   (enable-theme theme))
;;
;; (defun emacs-avoid-initial-flash-of-light ()
;;   "Avoid flash of light when starting Emacs, if needed.
;; New frames are instructed to call `emacs-re-enable-frame-theme'."
;;   (setq mode-line-format nil)
;;   (set-face-attribute 'default nil :background "#1e1e2e" :foreground "#cdd6f4")
;;   (set-face-attribute 'mode-line nil :background "#181825" :foreground "#cdd6f4" :box 'unspecified)
;;   (add-hook 'after-make-frame-functions #'emacs-re-enable-frame-theme))
;;
;; (emacs-avoid-initial-flash-of-light)

;; Modes
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(column-number-mode 1)
(show-paren-mode 1)

;; Disable startup screens
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-buffer-menu t)

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Window
(setq frame-resize-pixelwise t)
(setq window-resize-pixelwise nil)

;; Initialise installed packages at this early stage, by using the available cache.
(setq package-enable-at-startup t)
