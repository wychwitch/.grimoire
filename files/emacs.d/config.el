(use-package emacs
  :preface
  (defvar ian/indent-width 4) ; change this value to your preferred width
  :config
  (setq frame-title-format '("Yay-Evil") ; Yayyyyy Evil!
        ring-bell-function 'ignore       ; minimize distraction
        frame-resize-pixelwise t
        default-directory "~/")

  (tool-bar-mode -1)
  (menu-bar-mode -1)

  ;; better scrolling experience
  (setq scroll-margin 0
        scroll-conservatively 101 ; > 100
        scroll-preserve-screen-position t
        auto-window-vscroll nil)

  ;; Always use spaces for indentation
  (setq-default indent-tabs-mode nil
                tab-width ian/indent-width)

  ;; Omit default startup screen
  (setq inhibit-startup-screen t))

;; The Emacs default split doesn't seem too intuitive for most users.
(use-package emacs
  :ensure nil
  :preface
  (defun ian/split-and-follow-horizontally ()
    "Split window below."
    (interactive)
    (split-window-below)
    (other-window 1))
  (defun ian/split-and-follow-vertically ()
    "Split window right."
    (interactive)
    (split-window-right)
    (other-window 1))
  :config
  (global-set-key (kbd "C-x 2") #'ian/split-and-follow-horizontally)
  (global-set-key (kbd "C-x 3") #'ian/split-and-follow-vertically))

(setq evil-want-keybinding nil)
  ;;making sure recentf is working
(run-at-time nil (* 5 60) 'recentf-save-list)
;;Mappings
      (mapc #'define-prefix-command
            '(evil-application-map
              evil-buffer-map
              evil-error-map
              files
              git
              evil-global-leader-map
              evil-insert-map
              evil-jump-map
              evil-option-map
              search
              evil-tab-map))
      (use-package evil
        :defer nil
        :bind
        ( :map evil-motion-state-map
          ("SPC" . evil-global-leader-map)
          ("M-SPC" . evil-global-leader-map)
          :map evil-insert-state-map
          ("M-SPC" . evil-global-leader-map)
         :map evil-global-leader-map
          ("a" . evil-application-map)
          ("b" . evil-buffer-map)
          ("f" . files)
          (":" . execute-extended-command)
          ("g" . git)
          ("i" . evil-insert-map)
          ("j" . evil-jump-map)
          ("o" . evil-option-map)
          ("s" . search)
          ("u" . universal-argument)
          ("w" . evil-window-map)
          :map evil-window-map
          ("o" . miciah/window-toggle-other-windows)
          :map evil-buffer-map
          ("b" . list-buffers)
          ("B" . bury-buffer)
          ("d" . kill-this-buffer)
          ("e" . eval-buffer)
          ("h" . miciah/switch-to-help-buffer)
          ("m" . view-echo-area-messages)
          ("s" . miciah/switch-to-scratch-buffer)
          ("x" . kill-buffer-and-window)
          :map files
          ("a" . write-file)
          ("c" . copy-file)
          ("f" . find-file)
          ("i" . insert-file)
          ("n" . fileloop-continue)
          ("r" . recentf-open-files)
          ("R" . miciah/rename-file-and-buffer)
          ("s" . save-buffer)
          :map evil-jump-map
          ("f" . find-function)
          ("v" . find-variable)
          :map evil-option-map
          ("f" . display-fill-column-indicator-mode)
          ("s" . window-toggle-side-windows)
          ("l" . toggle-truncate-lines)
          ("n" . display-line-numbers-mode)
          ("d" . toggle-debug-on-error)
          ("D" . toggle-debug-on-quit)
          ("T" . miciah/toggle-themes)
          :map evil-replace-state-map
          ("M-SPC" . evil-global-leader-map)
          :map search
          ("c" . evil-ex-nohighlight)
          ("i" . imenu-list-smart-toggle) )
        ;;:custom
        ;; ...
        :config
        (evil-mode 1)
        ;; ...
        )
    (use-package evil-collection
      :after evil
      :custom (evil-collection-key-blacklist '("SPC"))
      :config
      (evil-collection-init)
      (evil-collection-buff-menu-setup)
      (evil-collection-unimpaired-setup)
      ;; ...
      )

(use-package delsel
  :ensure nil
  :config (delete-selection-mode +1))

(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

(use-package simple
  :ensure nil
  :config (column-number-mode +1))

(use-package files
  :ensure nil
  :config
  (setq confirm-kill-processes nil
        create-lockfiles nil ; don't create .# files (crashes 'npm start')
        make-backup-files nil))

(use-package autorevert
  :ensure nil
  :config
  (global-auto-revert-mode +1)
  (setq auto-revert-interval 2
        auto-revert-check-vc-info t
        global-auto-revert-non-file-buffers t
        auto-revert-verbose nil))

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode
  :config
  (setq eldoc-idle-delay 0.4))

;; C, C++, and Java
(use-package cc-vars
  :ensure nil
  :config
  (setq-default c-basic-offset ian/indent-width)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "k&r"))))

;; Python (both v2 and v3)
(use-package python
  :ensure nil
  :config (setq python-indent-offset ian/indent-width))

(use-package mwheel
  :ensure nil
  :config (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
                mouse-wheel-progressive-speed nil))

(use-package paren
  :ensure nil
  :init (setq show-paren-delay 0)
  :config (show-paren-mode +1))

(use-package frame
  :preface
  (defun ian/set-default-font ()
    (interactive)
    (when (member "VictorMono NF" (font-family-list))
      (set-face-attribute 'default nil :family "VictorMono NF"))
    (set-face-attribute 'default nil
                        :height 180
                        :weight 'normal))
  :ensure nil
  :config
  (setq initial-frame-alist '((fullscreen . maximized)))
  (ian/set-default-font))

(use-package ediff
  :ensure nil
  :config
  (setq ediff-window-setup-function #'ediff-setup-windows-plain)
  (setq ediff-split-window-function #'split-window-horizontally))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))

(use-package dired
  :ensure nil
  :config
  (setq delete-by-moving-to-trash t)
  (eval-after-load "dired"
    #'(lambda ()
        (put 'dired-find-alternate-file 'disabled nil)
        (define-key dired-mode-map (kbd "RET") #'dired-find-alternate-file))))

(use-package cus-edit
  :ensure nil
  :config
  (setq custom-file (concat user-emacs-directory "to-be-dumped.el")))

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
(load-theme 'wilmersdorf t) ; an orginal theme created by me.

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo
        dashboard-banner-logo-title "Yay Evil!"
        dashboard-items nil
        dashboard-set-footer nil))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

(use-package evil
  :diminish undo-tree-mode
  :init
  (setq evil-want-C-u-scroll t
        evil-want-keybinding nil
        evil-shift-width ian/indent-width)
  :hook (after-init . evil-mode)
  :preface
  (defun ian/save-and-kill-this-buffer ()
    (interactive)
    (save-buffer)
    (kill-this-buffer))
  :config
  (with-eval-after-load 'evil-maps ; avoid conflict with company tooltip selection
    (define-key evil-insert-state-map (kbd "C-n") nil)
    (define-key evil-insert-state-map (kbd "C-p") nil))
  (evil-ex-define-cmd "q" #'kill-this-buffer)
  (evil-ex-define-cmd "wq" #'ian/save-and-kill-this-buffer))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :diminish
  :config (evil-commentary-mode +1))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))

(use-package ido
  :config
  (ido-mode +1)
  (setq ido-everywhere t
        ido-enable-flex-matching t))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode +1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(use-package ido-completing-read+ :config (ido-ubiquitous-mode +1))

(use-package flx-ido :config (flx-ido-mode +1))

(use-package company
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-frontends '(company-pseudo-tooltip-frontend ; show tooltip even for single candidate
                            company-echo-metadata-frontend))
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package flycheck :config (global-flycheck-mode +1))

(setq org-hide-leading-stars nil)
(setq org-superstar-leading-bullet ?\s)
    (use-package org
      :hook ((org-mode . visual-line-mode)
             (org-mode . org-indent-mode)))

    (use-package org-superstar :hook (org-mode . org-superstar-mode))
  (require 'org-superstar)
  ;;(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
  (setq org-superstar-headline-bullets-list '("✿" "❀" "❁" "✻" "✽" "✼" "✾" "✲" "✱")
  )
  ;;("✿" "❀" "◉" "○" "❁" "✽" "✲" "✱" "✻" "✼" "✽" "✾")
  ;; org ellipsis options, other than the default Go to Node...
  ;; not supported in common font, but supported in Symbola (my fall-back font) ?, ?, ?
  (setq org-ellipsis " 󰘕 ")
  (setq org-superstar-item-bullet-alist'("◉" "○" "■" "◆" "▲" ))

(defface w-text '((t ( :foreground "#D1A0EA" :inherit text ) )) "Witch's Text" :group 'org-mode)
  (defvar w-text 'w-text)

  (defface c-text '((t (:foreground "#ec51cd" :inherit text ) )) "Celeste's Text" :group 'org-mode )
  (defvar c-text 'c-text)

  (defface m-text '((t (:foreground "#5459b6" :inherit text ) )) "Magician's Text" :group 'org-mode )
  (defvar m-text 'm-text)

  (defface n-text '((t (:foreground "#6a6273" :inherit text ) )) "Nyx's Text" :group 'org-mode )
  (defvar n-text 'n-text)

  (defface g-text '((t (:foreground "#76e37a" :inherit text ) )) "Gidget's Text" :group 'org-mode )
  (defvar g-text 'g-text)


  (defface g-text '((t (:foreground "#6a6273" :inherit text :weight extra-bold) )) "Gidgit's Text" :group 'org-mode )
  (defvar g-text 'g-text)
  ;;; Add keywords
  (defun add-alter-keywords()
    "adds custom keywords for highlighting text in org-mode."
    (font-lock-add-keywords nil
          '(("^w: .*$" . 'w-text))
          )
     (font-lock-add-keywords nil
          '(("^m: .*$" . 'm-text))
          )
     (font-lock-add-keywords nil
          '(("^c: .*$" . 'c-text))
          )
     (font-lock-add-keywords nil
          '(("^n: .*$" . 'n-text))
          )
(font-lock-add-keywords nil
          '(("^g: .*$" . 'g-text))
          )
     )
  (add-hook 'org-mode-hook 'add-alter-keywords)


(defun display-persona-names()
(use-package ov
  :ensure t)
 (ov-set (ov-regexp "^m:") 'display "<magician>")
 (ov-set (ov-regexp "^w:") 'display "<witch>")
 (ov-set (ov-regexp "^c:") 'display "<celeste>")
 (ov-set (ov-regexp "^n:") 'display "<nyx>")
 (ov-set (ov-regexp "^g:") 'display "<gidget>")

  )
(add-hook 'org-mode-hook 'display-persona-names)
(add-hook 'after-save-hook 'display-persona-names)

(use-package markdown-mode
  :hook (markdown-mode . visual-line-mode))

(use-package web-mode
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css\\'"   . web-mode)
         ("\\.jsx?\\'"  . web-mode)
         ("\\.tsx?\\'"  . web-mode)
         ("\\.json\\'"  . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2) ; HTML
  (setq web-mode-css-indent-offset 2)    ; CSS
  (setq web-mode-code-indent-offset 2)   ; JS/JSX/TS/TSX
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))))

(use-package diminish
  :demand t)

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode +1)
  (setq which-key-idle-delay 0.4
        which-key-idle-secondary-delay 0.4))

(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
            (exec-path-from-shell-initialize)))
