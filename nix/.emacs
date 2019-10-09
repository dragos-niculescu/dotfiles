    ;;; This file, which must be called '.emacs' and must reside in your
    ;;; home directory, is automatically read in by GNU Emacs as it is
    ;;; invoked. If you want to understand what is going on here, try
    ;;; using the excellent help facility built into the editor.

    ;;; These are just suggestions for an init file.  Feel free to remove or 
    ;;; add as you wish.  Note that a number of suggestions are commented out.

    ;;; PLEASE check to see what is in your .emacs file before replacing
    ;;; it with this.  Some commands write out info into your .emacs file
    ;;; and you will lose this if you copy this file over it.

    ;;; Just some randoms.
    ;(put 'eval-expression 'disabled nil) ; don't disable this
    ;(setq inhibit-startup-message t)     ; don't show me the startup message

    ;;; This line was probably in a .emacs file that emacs created for
    ;;; you.  I'm putting it in here since you might have overwritten your
    ;;; old .emacs file.  If you set it up to not suspend emacs set the
    ;;; last value to "t" (instead of "nil").
    ;(put 'suspend-emacs 'disabled nil)

    ;;; Make the mode line a little more useful.
    ;(setq-default mode-line-buffer-identification '("Buffer: %b"))
    ;(setq-default mode-line-format
    ;;	      '("%[" mode-line-buffer-identification
    ;	        "%* " global-mode-string "(" mode-name
    ;	        minor-mode-alist "%n" mode-line-process ") File: %f [%p]%]"))
    ;
    ;;; If you want this instead of "lisp-buffers" (which is on C-x C-b now),
    ;;; uncomment the next line.
    ;(define-key ctl-x-map "\C-b" 'buffer-menu)
    ;(define-key ctl-x-map "\C-e" 'fi:lisp-eval-last-sexp) ;;C-x C-e
    ;(define-key ctl-x-map "p" '(other-window -1)) ;; C-x C-p


    ;;; Run rmail on C-x r.  (instead of find-file-read-only).
    ;(define-key ctl-x-map "r" 'rmail)

    ;;; Change the behaviour of "reply" in Rmail to reply to the sender
    ;;; and all other recipients, instead of only repling to the sender.
    ;(add-hook 'rmail-mode-hook
    ;          '(lambda ()
    ;            (define-key rmail-mode-map "r" 'rmail-reply)))

    ;;; When in Text mode, want to be in Auto-Fill mode.
    ;;;
    ;(defun my-auto-fill-mode nil (auto-fill-mode 1))
    ;(add-hook 'text-mode-hook 'my-auto-fill-mode)
    ;(add-hook 'mail-mode-hook 'my-auto-fill-mode)

    ;;; If auto-mode-alist can't determine what mode the latest file
    ;;; needs, the default should be text-mode...
    ;;; Ie., uncomment this is you want the default to be text mode 
    ;;; instead of fundamental.
    ;(setq-default major-mode 'text-mode)

    ;;; When in C-mode, want all bells and whistles...
    ;(setq c-auto-newline t)

    ;;; Want all mail to Bcc to yourself.  The second line says don't Cc to 
    ;;; yourself (since you are already Bcc'ing yourself).
    ;(setq mail-self-blind t)
    ;(setq rmail-dont-reply-to-names (getenv "USER"))
    ;Include a CC in any news messages.
    ;(setq vnews-self t)

    ;;; Exchange behaviour of ESC and TAB in the minibuffer.
    ;;; Uncomment if you want.
    ;(define-key minibuffer-local-completion-map "\t" 'ESC-prefix)
    ;(define-key minibuffer-local-completion-map "\e" 'minibuffer-complete)
    ;(define-key minibuffer-local-must-match-map "\t" 'ESC-prefix)
    ;(define-key minibuffer-local-must-match-map "\e" 'minibuffer-complete)

    ;;; In emacs19, turn off menus and scroll bars.
    ;;; Uncomment if you want.
    ;(if (string-match "^19" emacs-version)
    ;  (progn
    ;    (menu-bar-mode -1)
    ;    (scroll-bar-mode -1)))

    ;;; Display time and load averages on the mode line.  (Used with the setting
    ;;; of the mode line above.)  Do this last in case display-time fails.
    ;(load "time" t t)
    ;(condition-case error
    ;    (display-time)
    ;  (error (message "Error from \"display-time\" %s, Ignoring."
    ;		  (prin1-to-string (cdr error)))))

    ;;; /usr/local/gnuemacs/lisp/default.el is loaded after this file so you
    ;;; should look there to make sure you aren't doing something twice.


    (global-set-key [\M-right] 'forward-sexp)
    (global-set-key [\M-left] 'backward-sexp)

    (global-set-key [ESC-s] 'fi:lisp-eval-last-sexp)

    (global-set-key (quote [S-f8]) (quote compile))

    (global-set-key [f8] (quote compile))

    (global-set-key [\C-right] 'forward-sexp)
    (global-set-key [\C-left] 'backward-sexp)
    ;(global-set-key [C-j] 'goto-line)
    (define-key global-map "\C-j" 'goto-line)
    (global-set-key "\C-h" 'delete-backward-char)
    (define-key global-map "\C-h" 'backward-delete-char)





    ;(if (not (null (getenv "DISPLAY")))
    ;    (progn
                        ;     (set-border-width 2)
    ;      (set-background-color "black")
                        
          (set-border-color "yellow")
          (set-cursor-color "yellow")
          (set-foreground-color "cornsilk3") 
    (set-background-color "black")
                        ;(set-mouse-color  "#f0600f")
          (set-mouse-color "DeepSkyBlue")
          (set-border-color "yellow")
    ;; (set-default-font "10x20")
     (set-default-font "Monospace-11")
    ;; (set-default-font "7x14bold")
    ;; (set-default-font "-*-fixed-bold-*-*-*-14-*-*-*-*-*-*-*")
    ;; (set-default-font "-*-lucidatypewriter-*-*-*-*-14-*-*-*-*-*-*-*")
    ;;(set-default-font "-bitstream-bitstream vera sans mono-medium-r-normal-*-*-110-100-100-m-0-ascii-0")
    ;;	   (x-set-font "k14")
    ;;	   (x-set-bell t)
    ;      )
      (display-time)
     ; )




    ;(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))


    ;(setq tex-mode-hook
    ;      '(lambda ()
    ;	 (modify-syntax-entry ?\\ "w")
    ;	 (setq tex-dvi-view-command "xdvi *");	
    ;	 (setq tex-dvi-print-command "/usr/local/bin/dvips")
    ;	 (setq tex-command "/usr/local/bin/latex")
    ;	 (setq latex-run-command "/usr/local/bin/latex")))
    ;
    ;(setq dired-mode-hook
    ;      '(lambda ()
    ;	 (local-set-key [double-down-mouse-1] 'dired-advertised-find-file)))
    ;
    ;(defun c-indent ()
    ;  (interactive)
    ;  (setq c-indent-level 4
    ;	c-continued-statement-offset 2
    ;	c-brace-offset -2
    ;	c-argdecl-indent 5
    ;	c-label-offset -2))
    ;(add-hook 'c-mode-hook 'c-indent)
    ;
    ;;(setq lpr-switches '("-P057"))
    ;
    ;
    ;(setq ispell-program-name "/usr/local/bin/ispell")
    ;
    ;;;(rmail)
    ;(setq auto-save-interval 120)
    ;(setq version-control (quote never))
    ;
    ;(require 'hilit19)
    ;
    ;(autoload 'fi:common-lisp-mode 
    ;  "~lou/531/emacs/new-fi-init.el"
    ;"Franz Inc's common lisp mode " t)
    ;
    ;(autoload 'fi:common-lisp
    ;  "~lou/531/emacs/new-fi-init.el"
    ;;"Franz Inc's common lisp mode " t)

    ;(require 'hilit19)
    ;(require 'paren)        ; highlight the pair of current pointed paren
    ;(transient-mark-mode t) ; highlight blocks
    ;
    ; (setq fi:emacs-to-lisp-transaction-directory  "~/")
    ;


    ; (setq line-number-mode t)
    ;
    ; (cond (window-system
    ;           (setq hilit-mode-enable-list  '(not text-mode)
    ;                 hilit-background-mode   'light
    ;                 hilit-inhibit-hooks     nil
    ;                 hilit-inhibit-rebinding nil)
    ;           (require 'hilit19)))
    ;
    ; (define-key global-map             
    ;   [menu-bar C forward]          
    ;   '("Compile" . compile))
    ;
    ;
    ;    (define-key global-map             
    ;      [menu-bar edit forward]          
    ;      '("Make" . compile))
    ;
    ; 
    ; ; (add-hook 'lisp-mode-hook '(lambda () (font-lock-mode 1)))
    ; ; (add-hook 'C-mode-hook '(lambda () (font-lock-mode 1)))
    ; (delete-selection-mode t)
    ;
    ;  (setenv "ESHELL" "/bin/bash")
    ;
    ;
    ;  (setq mail-archive-file-name (expand-file-name "~/SENTMAIL"))
    ;
    ;
    ;
    ;(put 'downcase-region 'disabled nil)
    ;
    ;(setq minibuffer-max-depth nil)
    ;
    (setq auto-mode-alist
              (cons '("\\.ml[iyl]?$" .  caml-mode) auto-mode-alist))

    (setq auto-mode-alist
              (cons '("\\.m" .  octave-mode) auto-mode-alist))

    ;; you should probably comment the next line or replace ~remy by another path 
    (setq load-path (cons "~dnicules/public_html/ocaml/" load-path))
    (setq load-path (cons "~/bin/" load-path))

    (autoload 'caml-mode "ocaml" (interactive)
      "Major mode for editing Caml code." t)
    (autoload 'camldebug "camldebug" (interactive) "Debug caml mode")



    (global-font-lock-mode 1)
    (custom-set-variables
     ;; custom-set-variables was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(display-time-mode t)
     '(inferior-octave-program "octave-cli")
     '(inhibit-startup-screen t)
     '(org-agenda-files (quote ("~/Dropbox/diverse/org/gcal.org")))
     '(package-selected-packages (quote (magit racer rust-mode auto-complete))))
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cornsilk3" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

    (set-fill-column 100)

     (global-set-key "\C-x\C-b" 'buffer-menu)
    (setq-default buffers-menu-sort-function nil)
    (setq-default buffers-menu-grouping-function nil)

    (add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/color-theme.el")
    ;;(require 'color-theme)
    ;;(eval-after-load "color-theme"
    ;;  '(progn
    ;;     (color-theme-initialize)
    ;;     (color-theme-lawrence)))
    ;;     (color-theme-xp)))
    ;;     (color-theme-dark-blue2)))

    ;;require 'xcscope)
    ;;(setq visible-bell t)
    ;;(setq compilation-window-height 8)                                                                                                                           

    ;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
    (setq inhibit-splash-screen t)
    (transient-mark-mode 1)
    (require 'org)
    (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
    (global-set-key (kbd "C-c c")
           'org-capture)

    (setq org-capture-templates
          '(("a" "Appointment" entry (file  "~/Dropbox/diverse/org/gcal.org" "Appointments")
         "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
        ("n" "Note" entry (file+headline "~/Dropbox/diverse/org/notes.org" "Notes")
         "* Note %?\n%T")
        ("l" "Link" entry (file+headline "~/Dropbox/diverse/org/links.org" "Links")
         "* %? %^L %^g \n%T" :prepend t)
        ("b" "Blog idea" entry (file+headline "~/Dropbox/diverse/org/i.org" "Blog Topics:")
         "* %?\n%T" :prepend t)
        ("t" "To Do Item" entry (file+headline "~/Dropbox/diverse/org/i.org" "To Do Items")
         "* %?\n%T" :prepend t)
        ("j" "Journal" entry (file+datetree "~/Dropbox/diverse/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("s" "Screencast" entry (file "~/Dropbox/diverse/org/screencastnotes.org")
         "* %?\n%i\n")))
     



    (defun command-line-diff (switch)
      (let ((file1 (pop command-line-args-left))
            (file2 (pop command-line-args-left)))
        (ediff file1 file2)))

    (add-to-list 'command-switch-alist '("diff" . command-line-diff))

    (setq gdb-many-windows t)

    (require 'package)
    (add-to-list 'package-archives
                 '("melpa-stable" . "https://melpa.org/packages/"))
    (package-initialize)

    (savehist-mode 1)

    ;; autocomplete package 
    ;; M-x package-install [RET] auto-complete [RET]
    (ac-config-default)
    (setq column-number-mode t)

    (global-set-key (kbd "C-x g") 'magit-status)

