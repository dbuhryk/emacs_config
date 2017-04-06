;;(require 'epa-file)
;;(epa-file-enable)

(setq message-send-mail-function 'message-send-mail-with-sendmail)

(setq mail-host-address "gmail.com")
(setq user-full-name "Dmitry Bugrik")
(setq user-mail-address "dmitry.bugrik@gmail.com")
(setq mail-default-reply-to "dmitry.bugrik@gmail.com")

(cond ((eq system-type 'windows-nt)
       (progn
	 ))
      ((eq system-type `cygwin)
       (progn
	 ))
      )

(setenv "PATH" (concat (getenv "PATH") ";" "C:\\Users\\edzmbuh\\Apps\\cygwin\\bin"  ))
(setq sendmail-program "C:\\Users\\edzmbuh\\Apps\\cygwin\\usr\\sbin\\msmtp.exe")
(setq imap-ssl-program "C:\\Users\\edzmbuh\\Apps\\cygwin\\bin\\openssl.exe s_client -ssl3 -quiet -connect %s:%p")
(setq message-sendmail-extra-arguments '("-C" "C:\\Users\\edzmbuh\\.emacs.d\\msmtprc.txt" "-a" "dmitry.bugrik@gmail.com"))

(load-library "nnimap")


(add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port 993)
                      (nnimap-authinfo-file "C:\\Users\\edzmbuh\\.emacs.d\\authinfo.txt")
                      (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "dmitry.bugrik@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


