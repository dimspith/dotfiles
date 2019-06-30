;;  ____   _    ____ _  __    _    ____ _____ ____  
;; |  _ \ / \  / ___| |/ /   / \  / ___| ____/ ___| 
;; | |_) / _ \| |   | ' /   / _ \| |  _|  _| \___ \ 
;; |  __/ ___ \ |___| . \  / ___ \ |_| | |___ ___) |
;; |_| /_/   \_\____|_|\_\/_/   \_\____|_____|____/ 

(package-initialize)

;; Add MELPA to package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode'hook 'interactive-haskell-m1ode)
(add-hook 'haskell-mode-hook 'yas-minor-mode)
;;  ____  _____ _____ _____ ___ _   _  ____ ____  
;; / ___|| ____|_   _|_   _|_ _| \ | |/ ___/ ___| 
;; \___ \|  _|   | |   | |  | ||  \| | |  _\___ \ 
;;  ___) | |___  | |   | |  | || |\  | |_| |___) |
;; |____/|_____| |_|   |_| |___|_| \_|\____|____/ 

;; Disable emacs starup screen
(setq inhibit-startup-screen t)

;; Disable menubar and toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Set the default fonts
(set-default-font "FuraCode NF 14")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (haskell-mode haskell-emacs-base haskell-emacs ample-theme monokai-alt-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
