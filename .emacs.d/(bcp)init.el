;;  ____   _    ____ _  __    _    ____ _____ ____  
;; |  _ \ / \  / ___| |/ /   / \  / ___| ____/ ___| 
;; | |_) / _ \| |   | ' /   / _ \| |  _|  _| \___ \ 
;; |  __/ ___ \ |___| . \  / ___ \ |_| | |___ ___) |
;; |_| /_/   \_\____|_|\_\/_/   \_\____|_____|____/ 

;; Initialize package.el
(require 'package)

;; Initialize the package archives
(setq package-archives
	  '(("gnu" . "https://elpa.gnu.org/packages/")
		("melpa" . "https://melpa.org/packages/")
	   ))

(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("gnu" . 10)
        ("melpa" . 0)))

(package-initialize)

;; All packages to install
(setq my-packages
      '(haskell-mode
		intero
		autopair
		smart-tab
		aggressive-indent
		magit
		smex
		telephone-line
		darktooth-theme
		solarized-theme
		madhat2r-theme
		laguna-theme
		))

;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; C/C++ e.t.c mode
(require 'cc-mode)
;; Haskell Mode
(require 'haskell-mode)
;; Intero for Haskell
(require 'intero)
;; Ido mode for M-x
(require 'smex)
;; Org bullets mode
(require 'org-bullets)
;; Telephone-line modeline
(require 'telephone-line)
;; Auto parentheses pairs
(require 'autopair)

(when (not package-archive-contents)
    (ignore-errors (package-refresh-contents)))

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

;;Global autopairs
(autopair-global-mode 1)

;; Disable all scrollbars
(scroll-bar-mode -1)

;; Set the default fonts
(set-frame-font "Anonymous Pro 14")

;; Better Minibuffer completions
(ido-mode 1)
(global-smart-tab-mode 1)
(global-set-key (kbd "M-x") 'smex)

;; Basic c programming tab and indentation
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;disable backup
(setq backup-inhibited t)

;; Enable Telephone line
(telephone-line-mode 1)

;;                       Hooks
;; Haskell
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'aggressive-indent-mode)
;;(add-hook 'haskell-mode'hook 'interactive-haskell-m1ode)
;;(add-hook 'haskell-mode-hook 'yas-minor-mode)

;; C
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'aggressive-indent-mode)

;;Org-mode
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Enable intero on all haskell-mode buffers
(intero-global-mode 1)

;; _              _     _           _ _                 
;;| | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___ 
;;| |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
;;|   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
;;|_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
;;          |___/                             |___/     

;; Alternative buffer view
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Easier window navigation
(global-set-key (kbd "M-o") 'other-window)

;; Org Mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; Scroll half page instead off full page
(require 'view)
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

;;                _                  _         
;;  ___ _   _ ___| |_ ___  _ __ ___ (_)_______ 
;; / __| | | / __| __/ _ \| '_ ` _ \| |_  / _ \
;;| (__| |_| \__ \ || (_) | | | | | | |/ /  __/
;; \___|\__,_|___/\__\___/|_| |_| |_|_/___\___|
                                             
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(confirm-kill-emacs (quote y-or-n-p))
 '(custom-enabled-themes (quote (darktooth)))
 '(custom-safe-themes
   (quote
	("e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "0fdd9258f9bf92772bf3d7839dee12161a48225f58b91035de33abb5e3a11a73" "155a5de9192c2f6d53efcc9c554892a0d87d87f99ad8cc14b330f4f4be204445" "88049c35e4a6cedd4437ff6b093230b687d8a1fb65408ef17bfcf9b7338734f6" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "1cfc3c062790a8d6f9ce677c50cf671609f45c32695778873b4a7619f1e749b5" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "ab9456aaeab81ba46a815c00930345ada223e1e7c7ab839659b382b52437b9ea" "9954ed41d89d2dcf601c8e7499b6bb2778180bfcaeb7cdfc648078b8e05348c6" "955426466aa729d7d32483d3b2408cf474a1332550ad364848d1dfe9eecc8a16" "fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092" "80365dd15f97396bdc38490390c23337063c8965c4556b8f50937e63b5e9a65c" "a28d89cf398c60dade1b0a7e3dce9d4691c236c05a050b7e6ba808bfce2622e1" "a6e3dec0d16222cc5747743c87ef7da79186f7282e2ec4ff74c7f08ed7fe28d2" "256bd513a9875cd855077162cdfee8d75b0ad7e18fe8b8cbc10412561fbef892" "4e10cdf7d030fb41061cf57c74f6ddfc19db8d4af6c8e0723dc77f9922543a3d" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default)))
 '(fci-rule-color "#555556")
 '(hl-todo-keyword-faces
   (quote
	(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f"))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#525254"))
 '(objed-cursor-color "#e74c3c")
 '(package-selected-packages
   (quote
	(smex magit flycheck-clang-analyzer evil darktooth-theme ##
 smart-tab doom-themes intero gruvbox-theme haskell-mode
 haskell-emacs-base haskell-emacs monokai-alt-theme)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#1d2021")))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(vc-annotate-background "#1c1e1f") '(vc-annotate-color-map
   (list
	(cons 20 "#b6e63e")
	(cons 40 "#c4db4e")
	(cons 60 "#d3d15f")
	(cons 80 "#e2c770")
	(cons 100 "#ebb755")
	(cons 120 "#f3a73a")
	(cons 140 "#fd971f")
	(cons 160 "#fc723b")
	(cons 180 "#fb4d57")
	(cons 200 "#fb2874")
	(cons 220 "#f43461")
	(cons 240 "#ed404e")
	(cons 260 "#e74c3c")
	(cons 280 "#c14d41")
	(cons 300 "#9c4f48")
	(cons 320 "#77504e")
	(cons 340 "#555556")
	(cons 360 "#555556")))
 '(vc-annotate-very-old-color nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(isearch ((t (:background "#427B58" :foreground "#FDF4C1" :underline nil)))))
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; === MISC ===

;; Darktooth Bar
;;(darktooth-modeline)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2b303b" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#c0c5ce"])
 '(ansi-term-color-vector
   [unspecified "#2b303b" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#c0c5ce"] t)
 '(compilation-message-face (quote default))
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (darktooth)))
 '(custom-safe-themes
   (quote
	("58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "862a0ccc73c12df4df325427f9285fa6a5bbba593a77257f43b01c84269f51b0" "811305a92d92091fce0c0a95f5bc6424229d11c12d166d34ca44aaa883a477e6" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "2678a2e497221ab077592fe1516ef9a3587f1a1aac41355982464f50ea0ef295" "eb7be1648009af366d83f855191057bdc09348a2d9353db31da03b1cdec50cc5" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "3fa65d60abd566321f93d1354f91dedae8ab795bb688a421c69e2e0f7fa3c9bc" "36c86cb6c648b9a15d849026c90bd6a4ae76e4d482f7bcd138dedd4707ff26a5" "9129c2759b8ba8e8396fe92535449de3e7ba61fd34569a488dd64e80f5041c9f" "f8067b7d0dbffb29a79e0843797efabdf5e1cf326639874d8b407e9b034136a4" "f8fb7488faa7a70aee20b63560c36b3773bd0e4c56230a97297ad54ff8263930" "97965ccdac20cae22c5658c282544892959dc541af3e9ef8857dbf22eb70e82b" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" "6bc387a588201caf31151205e4e468f382ecc0b888bac98b2b525006f7cb3307" "170bb47b35baa3d2439f0fd26b49f4278e9a8decf611aa33a0dad1397620ddc3" "fa2af0c40576f3bde32290d7f4e7aa865eb6bf7ebe31eb9e37c32aa6f4ae8d10" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "e6a9337674f6c967311b939bb4f81aefb65a96908c3749f4dd8d4500f6d79242" "91375c6dc506913ac7488f655b5afe934f343a0b223021c349105d37748c6696" "1d3863142a1325c1d038905c82b9aaf83f7594bb6158b52ad32ed23d3a97490a" "7a1190ad27c73888f8d16142457f59026b01fa654f353c17f997d83565c0fc65" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "986e7e8e428decd5df9e8548a3f3b42afc8176ce6171e69658ae083f3c06211c" "5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "f6f5d5adce1f9a764855c9730e4c3ef3f90357313c1cae29e7c191ba1026bc15" "4f77827c989554f290a8f98a123ea020550864fa43776ca219d9cc76f7c42a94" "85e6bb2425cbfeed2f2b367246ad11a62fb0f6d525c157038a0d0eaaabc1bfee" "80930c775cef2a97f2305bae6737a1c736079fdcc62a6fdf7b55de669fbbcd13" "350dc341799fbbb81e59d1e6fff2b2c8772d7000e352a5c070aa4317127eee94" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "250268d5c0b4877cc2b7c439687f8145a2c85a48981f7070a72c7f47a2d2dc13" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "f984e2f9765a69f7394527b44eaa28052ff3664a505f9ec9c60c088ca4e9fc0b" "7c0495f3973b9f79251205995ccccca41262b41a86553f81efe71c0dc3a50f43" "31e9b1ab4e6ccb742b3b5395287760a0adbfc8a7b86c2eda4555c8080a9338d9" "04790c9929eacf32d508b84d34e80ad2ee233f13f17767190531b8b350b9ef22" "d2bd16a8bcf295dce0b70e1d2b5c17bb34cb28224a86ee770d56e6c22a565013" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "117e47d2e046347044fb07de21c1b2759562c23d24db95f21b3e8ff0f3386876" "4bf5c18667c48f2979ead0f0bdaaa12c2b52014a6abaa38558a207a65caeb8ad" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "4feee83c4fbbe8b827650d0f9af4ba7da903a5d117d849a3ccee88262805f40d" "a0bfb4d94ef0a0893a9b19628403c5ac4847c981c8942a50fde0f273df47424a" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "f66abed5139c808607639e5a5a3b5b50b9db91febeae06f11484a15a92bde442" "8543b328ed10bc7c16a8a35c523699befac0de00753824d7e90148bca583f986" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "08e0ba7881c93bc4ecb393df5de4c696ee820d586872ab5d42bb26834c9770eb" "bc4c89a7b91cfbd3e28b2a8e9e6750079a985237b960384f158515d32c7f0490" "8c1dd3d6fdfb2bee6b8f05d13d167f200befe1712d0abfdc47bb6d3b706c3434" "6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "ecfd522bd04e43c16e58bd8af7991bc9583b8e56286ea0959a428b3d7991bbd8" "59ba50f24540958f33699a5247255d10f34dd812f3975837e3eddccdc4caa32e" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "3be1f5387122b935a26e02795196bc90860c57a62940f768f138b02383d9a257" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "44961a9303c92926740fc4121829c32abca38ba3a91897a4eab2aa3b7634bed4" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "4b2679eac1095b60c2065187d713c39fbba27039d75c9c928a1f3b5d824a3b18" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "043c8375cad0cf1d5c42f5d85cbed601075caf09594da04a74712510e9437d2b" "6271fc9740379f8e2722f1510d481c1df1fcc43e48fa6641a5c19e954c21cc8f" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "6daa09c8c2c68de3ff1b83694115231faa7e650fdbb668bc76275f0f2ce2a437" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "ed4c48eb91d07c2e447b445e2491ef17e9b326d43a60022297fd56af4749e772" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "fb44ced1e15903449772b750c081e6b8f687732147aa43cfa2e7d9a38820744b" "46720e46428c490e7b2ddeafc2112c5a796c8cf4af71bd6b758d5c19316aff06" "8e51e44e5b079b2862335fcc5ff0f1e761dc595c7ccdb8398094fb8e088b2d50" "c2efd2e2e96b052dd91940b100d86885337a37be1245167642451cf6da5b924a" "65f35d1e0d0858947f854dc898bfd830e832189d5555e875705a939836b53054" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "819d24b9aba8fcb446aecfb59f87d1817a6d3eb07de7fdec67743ef32194438b" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "88049c35e4a6cedd4437ff6b093230b687d8a1fb65408ef17bfcf9b7338734f6" "43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "a22f40b63f9bc0a69ebc8ba4fbc6b452a4e3f84b80590ba0a92b4ff599e53ad0" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "427fa665823299f8258d8e27c80a1481edbb8f5463a6fb2665261e9076626710" "cb477d192ee6456dc2eb5ca5a0b7bd16bdb26514be8f8512b937291317c7b166" "b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "0fdd9258f9bf92772bf3d7839dee12161a48225f58b91035de33abb5e3a11a73" "155a5de9192c2f6d53efcc9c554892a0d87d87f99ad8cc14b330f4f4be204445" default)))
 '(fci-rule-color "#dedede")
 '(global-display-line-numbers-mode nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
	(solarized-color-blend it "#002b36" 0.25)
	(quote
	 ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
	(("#073642" . 0)
	 ("#546E00" . 20)
	 ("#00736F" . 30)
	 ("#00629D" . 50)
	 ("#7B6000" . 60)
	 ("#8B2C02" . 70)
	 ("#93115C" . 85)
	 ("#073642" . 100))))
 '(hl-bg-colors
   (quote
	("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
	("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(hl-sexp-background-color "#efebe9")
 '(hl-todo-keyword-faces
   (quote
	(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f"))))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#81a2be"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(line-spacing 0.2)
 '(linum-format " %5i ")
 '(nrepl-message-colors
   (quote
	("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(objed-cursor-color "#cc6666")
 '(org-agenda-files (quote ("~/Documents/Nextcloud/Notes/TODO.org")))
 '(package-selected-packages
   (quote
	(autopair paredit aggressive-indent markdown-mode gh-md laguna-theme madhat2r-theme solarized-theme org-bullets spacemacs-theme smex smart-tab magit intero haskell-emacs-base goto-chg darktooth-theme)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(telephone-line-mode t)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
	(cons 20 "#b5bd68")
	(cons 40 "#c8c06c")
	(cons 60 "#dcc370")
	(cons 80 "#f0c674")
	(cons 100 "#eab56d")
	(cons 120 "#e3a366")
	(cons 140 "#de935f")
	(cons 160 "#d79e84")
	(cons 180 "#d0a9a9")
	(cons 200 "#c9b4cf")
	(cons 220 "#ca9aac")
	(cons 240 "#cb8089")
	(cons 260 "#cc6666")
	(cons 280 "#af6363")
	(cons 300 "#936060")
	(cons 320 "#765d5d")
	(cons 340 "#5c5e5e")
	(cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
	(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(put 'scroll-left 'disabled nil)