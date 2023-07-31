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

(setq org-roam-root-path "/tmp/org-roam")
(setq org-directory "/tmp/org-roam")


(use-package org-noter
  ;;:config
  ;; set this to the root of your org-roam directory
  ;;(org-noter-enable-org-roam-integration)
  :after (org org-roam pdf-tools)
  :straight (:type git :local-repo "~/workspace/org-noter"
                   :files ("*.el" "modules/*.el")
                   :no-build t
                   :branch "feature/org-roam-integration"
                   :no-install t)
  ;; (:repo "org-noter/org-noter"
  ;;        :host github
  ;;        :type git
  ;;        :branch "feature/org-roam-integration"
  ;;        :files ("*.el" "modules/*.el"))
  )

(use-package org-roam
  :custom
  (org-roam-directory (file-truename org-roam-root-path))
  (org-roam-db-location (file-truename (concat org-roam-root-path "/org-roam.db")))
  :config
  (org-roam-db-autosync-mode))
