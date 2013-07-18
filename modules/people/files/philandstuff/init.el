(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
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
  '(ido-ubiquitous magit org paredit puppet-mode smex)
  "packages to ensure are always present on startup")

(require 'cl-lib)
(when (cl-notevery 'package-installed-p important-packages)
  (package-refresh-contents)
  (dolist (pkg important-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; enable ido
(require 'ido)
(ido-mode t)
(ido-ubiquitous t)

;; enable ido for M-x
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)


