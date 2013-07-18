(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; disable ui frills
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

(defconst important-packages
  '(magit org paredit puppet-mode)
  "packages to ensure are always present on startup")

(require 'cl-lib)
(when (cl-notevery 'package-installed-p important-packages)
  (package-refresh-contents)
  (dolist (pkg important-packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
