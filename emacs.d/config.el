(line-number-mode 1)
  (column-number-mode 1)
  
; (add-hook 'find-file-hook (lambda () (linum-mode 1)))
(global-linum-mode 1)
; (setq-default global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(setq-default word-wrap t)
(global-visual-line-mode t)

;(tool-bar-mode -1)
;(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t) ;; no startup message

(setq display-time-24hr-format t)
(display-time-mode 1)

(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")
			    ))
(electric-pair-mode t)

(setq make-backup-file nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;(setq ring-bell-function 'ignore)

(when window-system (global-prettify-symbols-mode t) )

(when window-system (global-hl-line-mode t))
; (global-hl-line-mode t)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(global-set-key  (kbd "<M-s-return>") 'ansi-term)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((bookmarks . 5)
			  (recents . 5)))
  (setq dashboard-banner-logo-title "OLÁ PAULO!"))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

(use-package diminish
  :ensure t
  :init
  (diminish 'beacon-mode)
  (diminish 'which-key-mode)
  (diminish 'rainbow-mode)
  )

(use-package dmenu
  :ensure t
  :bind
("s-SPC" . 'dmenu)
  )

(use-package symon
  :ensure t
  :bind
  ("s-h" . symon-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(require 'org)
(use-package cdlatex
:ensure t
:init)
; (use-package auctex
; :ensure t
; :init)

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -output-directory %o %f"
	"pdflatex -interaction nonstopmode -output-directory %o %f"))

(require 'ox-latex)
;(load "org-exp")
;(load "org-latex")

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(add-to-list 'org-latex-classes
             '("elsarticle"
               "\\documentclass[preprint,authoryear,review,12pt]{elsarticle}"
               ("\\section{%s}"       . "\\section*{%s}")
               ("\\subsection{%s}"    . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}"     . "\\paragraph*{%s}")
               ("\\subparagraph{%s}"  . "\\subparagraph*{%s}") ) )

(add-to-list 'org-latex-classes
             '("myreport"
               "\\documentclass[a4paper,11pt]{report}"
               ;; ("\\part{%s}"       . "\\part*{%s}")
               ("\\chapter{%s}"       . "\\chapter*{%s}")
               ("\\section{%s}"       . "\\section*{%s}")
               ("\\subsection{%s}"    . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}"     . "\\paragraph*{%s}")
               ("\\subparagraph{%s}"  . "\\subparagraph*{%s}") ) )

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(use-package org-ref
  :ensure t
  :init)

(setq org-src-window-setup 'current-window)

(add-to-list 'org-structure-template-alist
	     '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init 
  ;:init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-x b") 'ibuffer)

(use-package avy
    :ensure t
    :bind
    ("M-s" . avy-goto-char))

; (use-package helm-R)

  (use-package ess
    :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (R          . t)
   (matlab     . t)
   (octave     . t)
   (latex      . t)
   (dot        . t)
   (org        . t)
   (perl       . t)
   (python     . t)
   (calc       . t)
   ; (sh         . t)
;  (sqlite     . t)
   (gnuplot    . t)
   (emacs-lisp . t)))

;  (org-babel-do-load-languages
;   'org-babel-load-languages
;   '((emacs-lisp . t)
;     (ruby . t)
;     (dot . t)
;     (gnuplot . t)))

(setq org-confirm-babel-evaluate nil)

(setf org-babel-default-header-args:org '((:exports . "code")))

;; Keep the region active when shifting
; (evil-map visual "<" "<gv")
; (evil-map visual ">" ">gv")

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1))

(require 'ox-md)
(require 'ox-beamer)

(setq TeX-parse-self t)
(setq Tex-PDF-mode t)

(add-hook 'org-mode-hook
	  '(lambda ()
	     (delete '("\\.pdf\\'" . default) org-file-apps)
	     (add-to-list 'org-file-apps '("\\.pdf\\'" . "evince %s"))))

(setenv "BROWSER" "chromium-browser")
  ;(setenv "BROWSER" "firefox")

;  (defun config-visit ()
;    (interactive)
;    (find-file "~/.emacs.d/config.org"))
;  (global-set-key (kbd "C-c e") 'config-visit)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(setq ess-use-company 'script-only)
(define-key company-active-map (kbd "M-h" ) 'company-show-doc-buffer)

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-current-symbol "")
  (add-hook 'prog-mode-hook 'linum-relative-mode)  )
