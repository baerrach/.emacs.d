;;; How to create keyboard macros
;; start-kbd-macro
;; end-kbd-macro
;; name-last-kbd-macro
;; insert-kbd-macro

(fset 'graphql-convert-variable-definition-to-argument
      [?\M-i ?\M-f ?\C-  ?\C-e backspace ?\C-  ?\M-b ?\M-w ?\M-i ?\C-y ?: ?  ?\M-x ?e ?n ?d ?\C-n])

(fset 'maven-gav-to-shortgav
   (kmacro-lambda-form [?\C-  ?\M-f ?\C-f ?\C-w ?\C-e ?\C-  ?\M-b ?\C-b ?\C-b ?\C-w ?\C-d ?: ?\M-d ?\C-d ?\C-e ?\C-  ?\M-b ?\C-b ?\C-b ?\C-w ?: ?\C-d ?\M-d ?\C-d ?\C-e ?\C-  ?\M-b ?\C-b ?\C-b ?\C-w ?\M-x ?e ?n ?d] 0 "%d"))

(provide 'setup-macros)
