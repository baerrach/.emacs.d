;; YAML
(autoload 'yaml-mode "yaml-mode")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("jsTestDriver\\.conf$" . yaml-mode))

;; Emacs lisp
(add-to-list 'auto-mode-alist '("Carton$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))

;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . web-mode))
(autoload 'turn-on-css-eldoc "css-eldoc")

;; Restclient
(add-to-list 'auto-mode-alist '("\\.restclient$" . restclient-mode))

;; Cucumber
(autoload 'feature-mode "feature-mode")
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vm$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . web-mode))

;; JSP
(autoload 'crappy-jsp-mode "crappy-jsp-mode")
(add-to-list 'auto-mode-alist '("\\.jsp$" . crappy-jsp-mode))
(add-to-list 'auto-mode-alist '("\\.jspf$" . crappy-jsp-mode))

;; JSX
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; Ruby
(autoload 'rhtml-mode "rhtml-mode")
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))

;; Puppet
(autoload 'puppet-mode "puppet-mode")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Groovy
(autoload 'groovy-mode "groovy-mode")
(add-to-list 'auto-mode-alist '("\\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\\.gradle$" . groovy-mode))

;; Scala
(autoload 'scala-mode "scala-mode2")
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
(autoload 'ensime-scala-mode-hook "ensime")
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Clojure
(autoload 'clojure-mode "clojure-mode")
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljc$" . clojure-mode))

;; SVG
(add-to-list 'auto-mode-alist '("\\.svg$" . image-mode))

;; JavaScript
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.gs$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . json-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))

;; Configuration files
(add-to-list 'auto-mode-alist '("\\.offlineimaprc$" . conf-mode))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; Markdown
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Apache config
(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; AWS ElasticBeanstalk
(add-to-list 'auto-mode-alist '("\\.config$" . yaml-mode))

(provide 'mode-mappings)
