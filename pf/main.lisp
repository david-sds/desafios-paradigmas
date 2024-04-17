(defvar operacoes
  (list
    (lambda (state)
      (let 
        (
          (missi-esq (nth 0 state))
          (cani-esq (nth 1 state))
          (pos-barco (nth 2 state))
          (missi-dir (nth 3 state))
          (cani-dir (nth 4 state))
        )
      )
    )
  )
)

; estado list label => (missi-esq, cani-esq, pos-barco, missi-dir, cani-dir)
(defvar estado-final (list 0 0 "dir" 3 3))
(defvar estado-inicial (list 3 3 "esq" 0 0))
(defvar cont 0)

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
              (cons (list (- missi-esq 1) (- cani-esq 1) "dir" (+ missi-dir 1) (+ missi-dir 1)) pos-states)
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
              (cons (list (+ missi-dir 1) (+ cani-dir 1) "esq" (- missi-esq 1) (- missi-esq 1)) pos-states)
            )
          )
        )       
      )
    )
  )
)

(defun is-rango-canibal (estado-atual)
  (let 
    (
      (missi-esq (nth 0 estado-atual))
      (cani-esq (nth 1 estado-atual))
      (pos-barco (nth 2 estado-atual))
      (missi-dir (nth 3 estado-atual))
      (cani-dir (nth 4 estado-atual))
      (is-rango nil)
    )
    (if (< missi-esq cani-esq)
      (setq is-rango estado-atual)
    )
    (if (< missi-dir cani-dir)
      (setq is-rango estado-atual)
    )
  )
)

(defun solver (estado-atual estados-visitados)
    (if (is-solucao estado-atual) 
        (print estados-visitados); (cons estado-atual estados-visitados)
        (if (not (member estado-atual estados-visitados))
            (progn
                (print estado-atual)
                (print estados-visitados)
                (print "-")
                (setq cont (+ cont 1))
                (if (= cont 20) (quit))
                (setq estados-visitados (cons estado-atual estados-visitados))
                (let 
                  (
                    (posssible-states (estados-possiveis estado-atual))
                    (is-happy-state nil)
                    (is-not-visitado nil)
                  )
                  (dolist (st posssible-states)
                    (setq is-happy-state (not (equal (is-rango-canibal st) st)))
                    (setq is-not-visitado (not (member st estados-visitados)))
                    (if is-happy-state
                      (if is-not-visitado
                        (solver st estados-visitados)
                      )
                    )
                  )
                )
            )
        )
    )
    nil
)

(solver estado-inicial '())

; QUANDO UM BARCO VAI DE UM LADO PARA O OUTRO PRECISA IR COM UMA PESSOA
