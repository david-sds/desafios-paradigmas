
(defvar estado-final (list 0 0 "dir" 3 3))
(defvar estado-inicial (list 3 3 "esq" 0 0))

(defun is-solucao (estado-atual)
    (equal estado-final estado-atual)
)

(defun estados-possiveis (estado-atual)
  (let 
    (
      (missi-esq (nth 0 estado-atual))
      (cani-esq (nth 1 estado-atual))
      (pos-barco (nth 2 estado-atual))
      (missi-dir (nth 3 estado-atual))
      (cani-dir (nth 4 estado-atual))
      (pos-states '())
    )
    (progn
      (if (equal pos-barco "esq")
        (progn ;mover direita
          (if (> missi-esq 0)
            (setq pos-states
              (cons (list (- missi-esq 1) cani-esq "dir" (+ missi-dir 1) cani-dir) pos-states)
            )
          )
          (if (> missi-esq 1)
            (setq pos-states
              (cons (list (- missi-esq 2) cani-esq "dir" (+ missi-dir 2) cani-dir) pos-states)
            )
          )
          (if (> cani-esq 0)
            (setq pos-states
              (cons (list missi-esq (- cani-esq 1) "dir" missi-dir (+ cani-dir 1)) pos-states)
            )
          )
          (if (> cani-esq 1)
            (setq pos-states
              (cons (list missi-esq (- cani-esq 2) "dir" missi-dir (+ cani-dir 2)) pos-states)
            )
          )
          (if (and (> missi-esq 0) (> cani-esq 0))
            (setq pos-states
              (cons (list (- missi-esq 1) (- cani-esq 1) "dir" (+ missi-dir 1) (+ cani-dir 1)) pos-states)
            )
          )
        )
        (progn ;mover esquerda
          (if (> missi-dir 0)             
            (setq pos-states
              (cons (list (+ missi-esq 1) cani-esq "esq" (- missi-dir 1) cani-dir) pos-states)
            )
          )
          (if (> missi-dir 1)             
            (setq pos-states
              (cons (list (+ missi-esq 2) cani-esq "esq" (- missi-dir 2) cani-dir) pos-states)
            )
          )
          (if (> cani-dir 0)
            (setq pos-states
              (cons (list missi-esq (+ cani-esq 1) "esq" missi-dir (- cani-dir 1)) pos-states)
            )
          )
          (if (> cani-dir 1)
            (setq pos-states
              (cons (list missi-esq (+ cani-esq 2) "esq" missi-dir (- cani-dir 2)) pos-states)
            )
          )
          (if (and (> missi-dir 0) (> cani-dir 0))
            (setq pos-states
              (cons (list (+ missi-esq 1) (+ cani-esq 1) "esq" (- missi-dir 1) (- missi-dir 1)) pos-states)
            )
          )
        )       
      )
      (return-from estados-possiveis pos-states)
    )
  )
)

(defun is-rango-canibal (estado-atual)
  (let 
    (
      (missi-esq (nth 0 estado-atual))
      (cani-esq (nth 1 estado-atual))
      (missi-dir (nth 3 estado-atual))
      (cani-dir (nth 4 estado-atual))
      (is-rango nil)
    )
    (if (and (< missi-esq cani-esq) (> missi-esq 0))
      (setq is-rango estado-atual)
    )
    (if (and (< missi-dir cani-dir) (> missi-dir 0))
      (setq is-rango estado-atual)
    )
    (return-from is-rango-canibal is-rango)
  )
)

(defun contains-childlist (parentlist childlist)
  (cond 
    ((null parentlist) nil)
    ((equal (car parentlist) childlist) childlist)
    (t (contains-childlist (cdr parentlist) childlist))
  )
)

(defun solver (estado-atual estados-visitados)
    (if (is-solucao estado-atual) 
        (progn
          (setq estados-visitados (cons estado-atual estados-visitados))
          (print estados-visitados)
          (print "ACABOU")
        )
        (if (not (member estado-atual estados-visitados))
            (progn
              (setq estados-visitados (cons estado-atual estados-visitados))
              (let 
                (
                  (possible-states (estados-possiveis estado-atual))
                  (is-happy-state nil)
                  (is-not-visitado nil)
                )
                (progn
                    (dolist (st possible-states)
                      (setq is-happy-state (equal (is-rango-canibal st) nil))
                      (setq is-not-visitado (not (contains-childlist estados-visitados st)))

                      (if (and is-happy-state is-not-visitado)
                        (solver st estados-visitados)
                      )
                    )
                    (progn
                      (setq estados-visitados (cons estado-atual (cdr estados-visitados)))
                    )
                  
                )
              )
            )
        )
    )
)

;; (print (estados-possiveis (list 3 0 "dir" 0 3)))
(solver estado-inicial '())

;TODO QUANDO UM BARCO VAI DE UM LADO PARA O OUTRO PRECISA IR COM UMA PESSOA
