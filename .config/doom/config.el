;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme `doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq browse-url-browser-function `browse-url-generic
      browse-url-generic-program "brave")

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
;;
(use-package pdf-tools
  ;;:defer t
  ;;:commands (pdf-tools-install)
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page)
              ("C-=" . pdf-view-enlarge)
              ("C--" . pdf-view-shrink))
  ;;:init (pdf-tools-install)
  ;;:config (add-to-list `revert-without-query ".pdf")
)

;;(add-hook `pdf-view-mode-hook #`(lambda() (interactive) (display-line-numbers-mode -1)))

;;; SMV mode
(autoload 'smv-mode "smv-mode" "SMV specifications editing mode." t)
(setq auto-mode-alist
      (append  (list '("\\.smv$" . smv-mode) '("\\.ord$" . smv-ord-mode))
	       auto-mode-alist))
(setq completion-ignored-extensions
      (cons ".ord" (cons ".opt" completion-ignored-extensions)))

(after! org-download
      (setq org-download-method 'directory)
      (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
      (setq org-download-image-org-width 600)
      (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
      (setq org-download-link-format-function #'org-download-link-format-function-default))

;;;; Of course, the file smv-mode.el must be in one of the directories in your
;;;; `load-path'. C-h v load-path to see the list, or `cons' your own path:
;;;; (setq load-path (cons "/the/full/path/to-your/dir" load-path))
;;;;
;;;; To turn the font-lock on by default, put in .emacs
 ;;;; (global-font-lock-mode t) ;; if you use gnu-emacs, or
;;;; (setq-default font-lock-auto-fontify t) ;; if you use xemacs.
;;;;
;;;; In GNU emacs faces `font-lock-preprocessor-face' and
;;;; `font-lock-variable-name-face' may not be predefined.
;;;; In this case they are defined automatically when smv-mode.el
;;;; is loaded the first time. You can also define them yourself in .emacs:
;;;;
;;;; ;;; Make faces that are not in gnu-emacs font-lock by default
;;;; (defvar font-lock-preprocessor-face 'font-lock-preprocessor-face)
;;;; (defvar font-lock-variable-name-face 'font-lock-variable-name-face)
;;;; (make-face 'font-lock-preprocessor-face)
;;;; (make-face 'font-lock-variable-name-face)
