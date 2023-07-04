(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(setq straight-use-package-by-default t)

(straight-use-package '(use-package))

(use-package pdf-tools
  :config  (pdf-tools-install))
(use-package org-noter
	     :straight (:type git :local-repo "~/emacs/org-noter"
			      :no-build t
			      :no-install t
			      :branch "feature/org-roam-integration")
	     :after pdf-tools)




;; set this to the root of your org-roam directory
(setq org-roam-root-path "/tmp/org-roam")
(setq org-directory "/tmp/org-roam")

(use-package org-roam
  :custom
  (org-roam-directory (file-truename org-roam-root-path))
  (org-roam-db-location (file-truename (concat org-roam-root-path "/org-roam.db")))
  :config
  (org-roam-db-autosync-mode))

(setq org-noter-create-session-from-document-hook
      '(org-noter--create-session-from-document-file-supporting-org-roam))

(require 'org-roam)
(require 'org-noter)
