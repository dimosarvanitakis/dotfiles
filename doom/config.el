;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

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
;;(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Gloabal Settings;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Dimokritos Arvanitakis"
      user-mail-address "dim98arva@gmail.com")

(setq doom-font (font-spec :family "VictorMono Nerd Font Mono" :size 22 :weight 'semi-light)
      doom-big-font (font-spec :family "VictorMono Nerd Font Mono" :size 24 :weight 'semi-light))

;; We can add bold and italic text
(after! doom-themes
        (setq doom-themes-enable-bold t
              doom-themes-enable-italic t))

;; Make comments italic.
;;(custom-set-faces!
;;  '(font-lock-comment-face :slant italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Auto save
(setq auto-save-default t
      make-backup-files t)

;; Editor config
(setq editorconfig-mode t)

;; Minimap
(setq minimap-window-location 'right)

;; Modeline
(setq doom-modeline-height 35
      doom-modeline--battery-status t
      doom-modeline-indent-info t
      doom-modeline-github t)

;; Vterm
(setq shell-file-name "/bin/fish"
      vterm-kill-buffer-on-exit t
      vterm-max-scrollback 5000)

(setq projectile-project-search-path '("/mnt/DATA/Projects/"
                                       "/home/dimos/Projects/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;LSPs;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C / C++
;; LSP - clangd
(setq lsp-clients-clangd-args '("-j=3"
                               "--clang-tidy"
                               "--background-index"
                               "--completion-style=detailed"
                               "--header-insertion=never"
                               "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(setq lsp-headerline-breadcrumb-enable nil
      lsp-modeline-code-actions-segments '(count icon name)
      lsp-ui-sideline-enable nil
      lsp-ui-doc-enable t
      lsp-ui-doc-show-with-cursor nil
      lsp-ui-doc-show-with-mouse t)

;; Eglot - clangd
;;(set-eglot-client! 'cc-mode '("clangd"
;;                               "-j=3"
;;                               "--clang-tidy"
;;                               "--background-index"
;;                               "--completion-style=detailed"
;;                               "--header-insertion=never"
;;                               "--header-insertion-decorators=0"))

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

;; Rust
(setq lsp-rust-server 'rust-analyzer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;TreeSitter;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; enable tree sitter
(global-tree-sitter-mode)

;; supported languages
(tree-sitter-require 'c)
(tree-sitter-require 'cpp)
(tree-sitter-require 'javascript)
(tree-sitter-require 'typescript)
(tree-sitter-require 'json)
(tree-sitter-require 'python)
(tree-sitter-require 'html)
(tree-sitter-require 'rust)

;; enable highlight mode
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Keymaps;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(evil-set-leader nil (kbd "SPC"))

;; General
(define-key evil-insert-state-map (kbd "M-/") 'comment-or-uncomment-region)
(define-key evil-normal-state-map (kbd "M-/") 'comment-or-uncomment-region)

;; Multiedit
(map! :leader
      (:prefix ("d" . "multiedit")
       :desc "Match Next" "n" #'evil-multiedit-match-and-next
       :desc "Match All" "a" #'evil-multiedit-match-all))

;; Code
(map! :leader
      (:prefix ("c" . "code")
       :desc "Align" "l" #'align
       :desc "Undo" "u" #'undo-fu-only-undo
       :desc "Redo" "z" #'undo-fu-only-redo
       :desc "Go to line" "g" #'goto-line
       :desc "Debug Code" "d" #'gud-gdb))

;; Minimap
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle minimap" "m" #'minimap-mode))

;; Registers
(map! :leader
      (:prefix ("r" . "register")
       :desc "Copy to register" "c" #'copy-to-register
       :desc "Insert from register" "i" #'insert-register
       :desc "List registers" "l" #'list-registers))

;; Buffer
(map! :leader
      (:prefix ("b" . "buffer")
       :desc "Find and replace" "f" #'replace-regexp))
