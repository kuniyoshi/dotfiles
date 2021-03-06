;;;
;;; eval Emacs Lisp by C-x C-e
;;;

;;;;
;;;; Install
;;;;

;; Auto Install
;; wget http://www.emacswiki.org/emacs/download/auto-install.el
;;  (byte-compile-file "auto-install.el")

;;;;
;;;; Configuration to Configuration
;;;;
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Auto Install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)

;;;;
;;;; Convinience Editor
;;;; 

;; Remember Cursor Place
;; 
(setq-default save-place t)
(require 'saveplace)

;;
;; Paren
;; 
(show-paren-mode 1)

;;
;; Expand tab
;;
(setq-default tab-width 4 indent-tabs-mode nil)

;;
;; Back Space
;; 
(global-set-key (kbd "C-h") 'delete-backwad-char)

;;
;; Enable Ctrl-w
;;
(defadvice kill-region
  (around kill-region-or-backward-kill-word (beg end) activate)
  (if (and (called-interactively-p) (not mark-active))
      (backward-kill-word
       (cond ((null current-prefix-arg) 1)
             ((symbolp current-prefix-arg) -1)
             ((listp current-prefix-arg) (car current-prefix-arg))
             (t current-prefix-arg)))
    ad-do-it))

;; 
;; Message of Major Mode
;; 
;(display-time)
(line-number-mode 1)
(column-number-mode 1)

;;
;; Buffer
;;
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

(iswitchb-mode 1)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-regexp nil)
;(setq iswitchb-prompt-newbuffer nil)

;;
;; Shell Highlight
;;
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;
;; Perl
;;
(setq auto-mode-alist (append (list (cons "\\.pl$" 'cperl-mode)
                                    (cons "\\.cgi$" 'cperl-mode)
                                    (cons "\\.pm$" 'cperl-mode)
                                    (cons "\\.t$" 'cperl-mode)
                                    (cons "\\.html$" 'html-mode)
                                    (cons "\\.inc$" 'html-mode)
                                    )
                              auto-mode-alist))
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset -4)
(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 4)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-array-face ((t (:background "color-189" :foreground "color-57" :weight bold))))
 '(cperl-hash-face ((((class color)) (:foreground "#C00" :weight bold))))
 '(flymake-errline ((((class color)) (:underline t))))
 '(flymake-warnline ((((class color)) (:underline t)))))





;; 
;; C-u will repeat 4times.
;;
(defadvice universal-argument-more
 (before stop-by-eight-before-sixteen (arg) activate)
 "Stop by eight before sixteen."
 (let ((num (car arg)))
   (if (> 16 num) (ad-set-arg 0 (list (/ num 2))))))

;;
;; Transrator
;;
;; M-x auto-install-batch text translator
;; M-x text-translatr...
(require 'text-translator)
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)

;;
;; Column highlight
;;
;; M-x auto-install-batch col-hilight
(require 'column-marker)
;(column-highlight-mode 1)
;(column-highlight-column-when-idle 1)
;(col-highlight-set-interval 6)


;;
;; Load Template after Open
;;
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.pl$" "perl-template.pl")

;;
;; Flymake
;;

(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))

;;
;; Erlang OTP
;;
;; https://github.com/erlang/otp/blob/maint/lib/tools/emacs/erlang.el
;(setq erlang-root-dir "/usr/local/otp")
(setq exec-path (cons "/opt/local/bin/erl" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)

;; ;;
;; ;; distel
;; ;;
;; ;; https://github.com/massemanet/distel
;; (add-to-list
;;  'load-path
;;  (car (file-expand-wildcards "/usr/local/share/distel/elisp")))
;; (require 'distel)
;; (distel-setup)
;; (setq auto-mode-alist (append (list (cons "\\.yaws$" 'erlang-mode)) auto-mode-alist))


;;;; Command Help
;;
;; Table
;;
;;; M-x orgtbl-mode
;;; C-x org-metaup
;;
;; Tydi up
;;
;;; M-x align
;;
;; Close to Shell
;;; M-!, M-|
;; M-x hippie-expand
