;; Variables

;; Directories
(defvar variables/home (concat (getenv "HOME") "/") "Home directory.")
(defvar variables/nextcloud (concat variables/home "Nextcloud/") "Nextcloud directory.")
(defvar variables/notes (concat variables/nextcloud "notes/") "Notes directory.")
(defvar variables/dotfiles (concat variables/home "dotfiles/") "Dotfiles directory.")
(defvar variables/repos (concat variables/home "repos/") "Projects directory.")
(defvar variables/trash (concat variables/home ".Trash/") "Trash directory.")

;; org-mode
(setq org-directory variables/notes)

(provide 'variables)
