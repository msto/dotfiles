;; Package repositories
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

;; Map cmd to meta
;; (setq mac-command-modifier 'meta)
(setq mac-option-modifier 'meta)

;; Initialize package manager
(require 'package)
(package-initialize)

;; Better defaults
;; (require 'better-defaults)

;; Kill welcome message
(setq inhibit-startup-screen t)

;; Activate evil-mode by default
(require 'evil)
(evil-mode 1)

;; Font
(set-face-attribute 'default nil
		    :family "Source Code Pro")

;; Org-mode
(require 'org)

;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files (list "~/Dropbox (Personal)/org"
                             "~/Dropbox (Personal)/org/meetings"))

(setq org-todo-keywords
    '((sequence "TODO" "NEXT" "WAIT" "|" "DONE")))

(setq org-log-done 'time)

(setq org-checkbox-hierarchical-statistics t)

;; (setq org-startup-folded nil)

(setq org-startup-indented t)

;; Solarized theme
;; (setq solarized-use-variable-pitch nil)
;; Avoid all font-size changes
;; (setq solarized-scale-org-headlines nil)

;; (setq solarized-height-minus-1 1.0)
;; (setq solarized-height-plus-1 1.0)
;; (setq solarized-height-plus-2 1.0)
;; (setq solarized-height-plus-3 1.0)
;;(setq solarized-height-plus-4 1.0)
;; (load-theme 'solarized-light t)
(load-theme 'zenburn t)

;; Relative line numbering
(require 'linum-relative)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

;; Cloned plugins 
(let ((default-directory  "~/.emacs.d/plugins"))
  (normal-top-level-add-subdirs-to-load-path))

;; Ruler at column 80
(require 'fill-column-indicator)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages (quote (linum-relative spacemacs-theme evil))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(package-selected-packages (quote (spacemacs-theme linum-relative evil))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;)
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(custom-enabled-themes (quote (solarized-light)))
;; '(custom-safe-themes
 ;;  (quote
;;    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
;; '(package-selected-packages
 ;;  (quote
 ;;   (solarized-theme org-evil spacemacs-theme linum-relative evil))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (better-defaults zenburn-theme spacemacs-theme solarized-theme org-evil linum-relative dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
