(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

(defvar temporary-file-directory (expand-file-name "~/.emacs.d/backup/"))

(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq autosave-list-file-prefix
          temporary-file-directory)
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Load and configure SLIME
  (add-to-list 'load-path "/home/proland/projects/slime")
  (require 'slime)
  (eval-after-load 'slime '(setq slime-protocol-version 'ignore))
  (slime-setup '(slime-repl))
 
  ;; Load a major mode for editing Clojure code.
  (add-to-list 'load-path "/home/proland/projects/clojure-mode")
  (require 'clojure-mode)
  (require 'clojure-test-mode) ;; requires slime