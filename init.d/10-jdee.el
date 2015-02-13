(cond ((eq system-type 'windows-nt)
       (progn
	 (setenv "JAVA_HOME" "C:\\Program Files\\Java\\jdk1.8.0_25\\bin")
	 (add-to-list 'load-path "C:\\Users\\edzmbuh\\Apps\\jdee-2.4.1\\lisp")
	 ))
      ((eq system-type `cygwin)
       (progn
	 (setenv "JAVA_HOME" "/cygdrive/c/Program Files/Java/jdk1.8.0_25/bin")
	 (add-to-list 'load-path "/cygdrive/c/Users/edzmbuh/Apps/jdee-2.4.1/lisp")
	 ))
      )

 (autoload 'jde-mode "jde" "JDE mode" t)
  (setq auto-mode-alist
        (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

;;(load "jde")
