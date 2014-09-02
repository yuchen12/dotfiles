;; -*- Mode: Emacs-Lisp -*-
;; -*- encoding: utf-8 -*-

;; personal information
(setq user-full-name "Wang Zhen")
(setq user-mail-address "yuchen12@gmail.com")

;; disable splash screen
(setq inhibit-splash-screen t)
;; show column number
(setq column-number-mode t)
;; hilight current line
(global-hl-line-mode 1)
;; line number
(global-linum-mode 1)

;; tab width
(setq tab-width 4)
;; insert spaces for indentation rather than tab characters
(setq-default indent-tabs-mode nil)
;; tab stop list
(setq tab-stop-list (number-sequence 4 120 4))

;; set cursor color
(set-cursor-color "red3")
;; use a big kill ring
(setq kill-ring-max 200)
;; scroll
(setq scroll-margin 5
      scroll-conservatively 10000)
;; paren
(show-paren-mode t)
;;(setq show-paren-style 'expression)

;;(mouse-avoidance-mode 'animate)

;; set frame title
(setq frame-title-format "emacs@%b -- %f")

;; 
(icomplete-mode 1)
(iswitchb-mode 1)

;;

;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;	    cedet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cedet)
(require 'semantic)
(require 'srecode)
;; enble EDE(project management) features
(global-ede-mode 1)
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
				  global-semanticdb-minor-mode
				  global-semantic-idle-summary-mode
				  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)
;; enable SRecode(Template managment) minor-mode
(global-srecode-minor-mode 1)

;; C/C++ mode settings
;;(require 'cc-mode)
(defun my-c-mode-hook()
  (c-set-style "stroustrup")
  (c-set-offset 'substatement-open '-)
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (c-set-offset 'brace-list-open '+)
  (c-toggle-hungry-state)
  (modify-syntax-entry ?_ "w" c-mode-syntax-table) ;; treat underscore as word
  (modify-syntax-entry ?_ "w" c++-mode-syntax-table)
  )
(setq c-basic-offset 4)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;; key bindings
(global-set-key "\C-k" 'kill-whole-line)
(global-set-key "\M-k" 'kill-line)
(global-set-key "\C-x?" 'help-command)
(global-set-key "\C-h" 'backward-char) ;; use ctrl+h to move backword instead of ctrl+b
(global-set-key [f5] 'goto-line)
;;(global-unset-key [f5])
;; set default mode to text mode
(setq default-major-mode 'text-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
