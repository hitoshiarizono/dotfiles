
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))


(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))


(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(setq skk-jisyo-code 'utf-8-unix)
(setq skk-kutouten-type 'en)


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(column-number-mode t)
(line-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq default-fill-column 80)
(setq auto-fill-mode t)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))



(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-solarized-dark)))


