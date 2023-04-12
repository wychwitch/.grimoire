;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Blue Ingram Rose"
      user-mail-address "blue@ingramrose.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "FantasqueSansMono NF"  :size 30 )
)
(setq doom-variable-pitch-font (font-spec :family "FantasqueSansMono NF" :size 30))
(setq doom-unicode-font (font-spec :family "DejaVu Sans Mono"))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-homage-white)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(set-selection-coding-system 'utf-16-le)
;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(setq org-superstar-headline-bullets-list '("✿" "❀" "❁" "✻" "✽" "✼" "✾" "✲" "✱")
)
;;("✿" "❀" "◉" "○" "❁" "✽" "✲" "✱" "✻" "✼" "✽" "✾")
;; org ellipsis options, other than the default Go to Node...
;; not supported in common font, but supported in Symbola (my fall-back font) ?, ?, ?
(setq org-ellipsis "⬎")
(setq org-superstar-item-bullet-alist'("◉" "○" "■" "◆" "▲" ))

(after! org
  (custom-set-faces!
    '(org-document-title :height 1.4)
    '(org-level-1 :inherit  outline-1 :weight extra-bold :height 1.2 :foreground "#6190FF")
    '(org-level-2 :inherit outline-2 :height 1.2 :foreground "#7040AA")
    '(org-level-3 :inherit outline-3 :height 1.2 :foreground "#D581CF")
    '(org-level-4 :inherit outline-4 :height 1.2 :foreground "#5BA98C")
    '(org-level-5 :inherit outline-5 :height 1.2 :foreground "#324B81")
    '(org-level-6 :inherit outline-6 :height 1.2 :foreground "#A45673")
    '(org-level-7 :inherit outline-7 :height 1.2 :foreground "#4C4C4C")
    '(org-level-8 :inherit outline-8 :height 1.2 :foreground "#7040AA")
    '(org-level-9 :inherit outline-8 :height 1.2 :foreground "#7040AA")
    ;; Ensure that anything that should be fixed-pitch in org buffers appears that
    ;; way
    '(org-block nil :foreground nil :inherit 'fixed-pitch)
    '(org-code nil   :inherit '(shadow fixed-pitch))
    '(org-table nil   :inherit '(shadow fixed-pitch))
    '(org-verbatim nil :inherit '(shadow fixed-pitch))
    '(org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
    '(org-checkbox nil :inherit 'fixed-pitch))


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

)



(defun my-weebery-is-always-greater ()
  (let* ((banner '(
"⢠⣶⠒⠄⡀⡀⣠⣶⣾⣿⣶⡄⡀⡀⡀⡀⡀⡀⡀⡀⡀⣴⣾⣿⣶⣦⡀⡀⡀⠖⢲⣤"
"⢸⣿⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⡄⡀⡀⡀⡀⡀⡀⡀⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣼⣿"
"⢣⠙⠿⠿⠛⠉⣀⣀⠉⢿⣿⣿⣿⡀⡀⡀⡀⡀⡀⣼⣿⣿⣿⠋⣁⣀⠈⠙⠻⠿⠛⣠"
"⡀⠻⣿⣶⠿⠟⠿⣿⣿⡄⣿⣿⣿⡄⡀⡀⡀⡀⡀⣿⣿⣿⠁⣿⣿⠿⠛⠿⣷⣾⠿⠁"
"⡀⡀⡀⢀⣠⣤⡀⠈⣿⣿⢿⣿⣿⣷⡀⡀⡀⡀⣰⣿⣿⣿⢸⣿⡏⡀⣠⣤⣀⡀⡀⡀"
"⡀⡀⡀⣿⠋⡙⣿⡄⢿⣿⡈⣿⣿⣿⣷⡀⡀⣴⣿⣿⣿⠋⣾⣿⡀⣿⠟⡉⢿⡆⡀⡀"
"⡀⡀⡀⠻⣶⠞⠘⣿⡀⠻⣿⣄⠙⢿⣿⣿⢸⣿⣿⠟⣁⣾⡿⠁⣼⡟⠘⣴⡿⠁⡀⡀"
"⡀⡀⡀⡀⡀⡀⡀⠻⣿⣶⣤⣉⣉⣉⣠⣿⢸⣧⢈⣉⣉⣠⣴⣿⡿⡀⡀⡀⡀⡀⡀⡀"
"⡀⡀⡀⡀⡀⡀⡀⡀⡀⠉⠛⠛⣫⡾⠛⠁⡀⠙⠿⣮⠛⠛⠋⡀⡀⡀⡀⡀⡀⡀⡀⡀"
"⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡠⠛⡀⡀⡀⡀⡀⡀⡀⡀⠙⠦⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀"
"⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀EMACS OF HOPE⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀⡀"
                   ))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("pretty-essay"
               "\\documentclass{pretty-essay}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-latex-classes
             '("pretty-rose-essay"
               "\\documentclass[rose]{pretty-essay}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-latex-classes
             '("pretty-blue-essay"
               "\\documentclass[blue]{pretty-essay}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-latex-classes
             '("pretty-purp-essay"
               "\\documentclass[purp]{pretty-essay}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-latex-classes
             '("mla9"
               "\\documentclass[mla8]{mla-custom}"
               ("\\section{%s}" . "\\section*{%s}")))
(add-to-list 'org-latex-classes
             '("constitution"
               "\\documentclass{constitution}"
               ("\\section{%s}" . "\\article*{%s}")
               ("\\subsection{%s}" . "\\section*{%s}")))

(setq TeX-engine 'xetex)

(setq org-journal-file-type 'monthly)
(setq yas-snippet-dirs
      '("~/.doom.d/snippets"                 ;; personal snippets
        ))
(ispell-change-dictionary "english" t)

(setq org-hide-leading-stars t)

(require 'ox-extra)

(ox-extras-activate '(ignore-headlines))

(setq bibtex-completion-bibliography '("C:\\Git\\_writings\\essays\\ENGL 112 Fall 2023.bib"))

(add-to-list 'exec-path "C:\\msys64\\usr\\share\\bash-completion\\completions")
(setq ispell-program-name "aspell")
    (setq ispell-personal-dictionary "C:/Users/lumin/.doom.d/.ispell")
(require 'ispell)

(map! :leader
      (:prefix-map ("e" . "export")
       :desc "Export to pdf (through latex)" "p" #'org-latex-export-to-pdf
       :desc "Export to latex" "l" #'org-latex-export-to-latex
       ))
(map! :leader
      (:prefix-map ("o" . "open")
       (:prefix-map ("o" . "obsidian")
      :desc "jump to file" "j" #'obsidian-jump
       )
       )
      )
(map! :leader
      (:prefix-map ("r" . "ring")
       (:prefix ("p" . "paste")
        :desc "consult-yank-pop" "p" #'counsel-yank-pop)))
(use-package org-rainbow-tags
  :ensure t
  :custom
  (org-rainbow-tags-hash-start-index 10)
  (org-rainbow-tags-extra-face-attributes
   ;; Default is '(:weight 'bold)
   '(:inverse-video t :box t :weight 'bold))
  :hook
  (org-mode . org-rainbow-tags-mode))


(use-package obsidian
  :ensure t
  :demand t
  :config
  (obsidian-specify-path "~/obsidian")
  (global-obsidian-mode t)
  :custom
  ;; This directory will be used for `obsidian-capture' if set.
  (obsidian-inbox-directory "_inbox")
  :bind (:map obsidian-mode-map
  ;; Replace C-c C-o with Obsidian.el's implementation. It's ok to use another key binding.
  ("C-c C-o" . obsidian-follow-link-at-point)
  ;; Jump to backlinks
  ("C-c C-b" . obsidian-backlink-jump)
  ;; If you prefer you can use `obsidian-insert-link'
  ("C-c C-l" . obsidian-insert-wikilink)))

 (setq lsp-rust-server 'rust-analyzer)
(add-to-list 'exec-path
             (expand-file-name "C:\\Users\\lumin\\.rustup\\toolchains\\stable-x86_64-pc-windows-msvc\\bin"))
(setq calendar-week-start-day 1)
