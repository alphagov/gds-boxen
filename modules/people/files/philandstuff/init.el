(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; disable ui frills
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; better unique buffer names
(require 'uniquify)

(setq inhibit-startup-message t
      uniquify-buffer-name-style 'forward
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(defconst important-packages
  '(
    clojure-mode
    exec-path-from-shell
    ido-ubiquitous
    magit
    markdown-mode
    nrepl
    org
    paredit
    puppet-mode
    smex)
  "packages to ensure are always present on startup")

(require 'cl-lib)
(when (cl-notevery 'package-installed-p important-packages)
  (package-refresh-contents)
  (dolist (pkg important-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; enable ido
(require 'ido)
(ido-mode t)
(ido-ubiquitous t)

;; enable ido for M-x
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; set up various mode hooks
;; *.pp -> puppet-mode
;; *.cljs -> clojure-mode
;; clojure-mode -> paredit
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.pp$" . puppet-mode))
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)

;; set up path
(exec-path-from-shell-initialize)
