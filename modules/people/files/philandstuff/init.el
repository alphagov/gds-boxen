(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; disable ui frills
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))


;;TODO: don't refresh packages on every startup
(package-refresh-contents)

(defconst important-packages
  '(magit paredit puppet-mode)
  "packages to ensure are always present on startup")

(dolist (pkg important-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))
