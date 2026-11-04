#import "../../typst-lib/main.typ": *
#import "../../typst-lib/preset.typ": setup

#show: setup

#let cov = $"cov"$


= Случайные величины

== Введение случайной величины

#def(
  [Измеримая (относительно $sigma$-алгебры) функция],
  [
    функция для существующего вероятностного пространства $(Omega, cal(F), P)$, такая что
    $
      xi: Omega -> RR,
    $
    причем
    $
      & forall X in RR quad {omega in Omega | xi(omega) < X} in cal(F) <==> \
      & <==> forall X in RR quad {omega in Omega | xi(omega) in (-oo, X)} in cal(F)  
    $
  ]
)

#def(
  [Случайная величина],
  [
    $cal(F)$-измеримая функция $xi$ на вероятностном пространстве $(Omega, cal(F), P)$, ставящая в соответствие $omega in Omega$ вещественноее число $xi(omega) in RR$
  ]
)

// #fun-fact(
//   [Смысл измеримости],
//   [
//     Если задана случайная величина $xi$, то мы можем задать вероятность попадания случайной величины в интервал $(-oo, X)$ по правилу
//     $
//       P(xi < X) = P(underbracket({omega in Omega | xi(omega) < X}, in cal(F)))
//     $
//     а из содеражния того множества в $cal(F)$ можно явно вычислить его вероятность
//   ]
// )

#def(
  [Борелевская $sigma$-алгебра ($cal(B)(RR)$)],
  [
    наименьшая $sigma$-алгебра, содержащая все открытые интервалы $RR$. Порождается интервалами вида
    $
      (-oo, X), "где" X in RR
    $
  ]
)

#theorem(
  [
    Борелевская $sigma$-алгебра порождается интервалами вида
    $
      (-oo, X), "где" X in RR
    $
  ],
  [
    Докажем включение в обе стороны. По определению $sigma$-алгебры,
    $
      forall X in RR quad (-oo, X) in cal(B)(RR)
    $
    поскольку $(-oo, X) subset RR$ и является открытым интервалом, откуда
    $
      sigma({(-oo, X) | X in RR}) subset.eq cal(B)(RR)
    $
    Докажем включение в обратную сторону. Пусть $cal(F) := sigma({(-oo, X) | X in RR})$, по определнию $sigma$-алгебры для произвольного $a in RR$
    $
      forall n in NN quad (-oo, a + 1/n) in cal(F),
    $
    а также
    $
      underbracket(inter.big_(n=1)^oo (-oo, a + 1/n), = (-oo, a]) in cal(F)
    $
    то есть
    $
      (-oo, a] in cal(F),
    $
    откуда
    $
      compl((-oo, a]) = (a, +oo) in cal(F)
    $
    а значит при проивзольных $a, b in RR$
    $
      cases(
        A = (-oo, a) in cal(F),
        B = (b, +oo) in cal(F)
      ) ==> A inter B in cal(F) <==> (a, b) in cal(F),
    $
    а значит
    $
      forall I in cal(B)(RR) quad I in cal(F) = sigma({(-oo, X) | X in RR})
    $
  ]
)


Итак, $cal(B)(RR)$ порождается интервалами вида $(-oo, X), X in RR$, a как известно из матанализа, вероятностная мера естественным образом продолжается до любого интервала $B=(a in RR, b in RR) in cal(B)(RR)$, а значит мы можем приписать вероятность каждому борелевскому множеству, в результате получаем новое универсальное вероятностное пространство:
$
  (Omega, cal(F), P) -->^xi (RR, cal(B)(RR), P_xi)
$

иногда это называется *индуцированное вероятностное пространство*. С этим пространством обычно работать удобнее, чем с исходным, так как можно уже не учитывать природу и структуру $sigma$-алгебры $cal(F)$.

#def(
  [Распределение случайной величины $xi$],
  [
    функция $P(B), B in cal(B)(RR)$ (выше было обозначение $P_xi$), показывающая соответствие между точками на вещественной прямой и вероятностями случайной величиной попасть в них
  ]
)

#fun-fact([Основные типы распределений],
enum(
  numbering: "a)",
  [Дискретное], [Непрерывное], [Их смеси]
))

#pagebreak()

== Дискретная случайная величина (ДСВ)

#def(
  [Дискретная случайная величина],
  [
    случайная величина, принимающая не более, чем счетное число значений. То есть существует конечный или счетный набор чисел $X_1, X_2, dots, X_n, dots$, таких, что
    + $P(xi = X_i) > 0$
    + $display(sum) P(xi = X_i) = 1$ --- иногда называют условием нормировки
  ]
)

Таким образом, дискретная случайная величина задается законом (рядом) распределения. Пусть $P(xi = X_i) = p_i$, тогда зная все $p_i$ мы можем явно задать случайную величину

#fun-fact(
  [Основные числовые характеристики ДСВ],
  [
    #enum(
      numbering: "I.",
      [
        *Математическое ожидание* --- средневзвешенное:
        $
          E xi = sum_(i=1)^oo X_i dot p_i
        $
        Забавный факт: ряд может расходиться (не сходиться абсолютно), в таком случае просто $exists.not E xi$

        Необходима именно *абсолютная сходимость*, поскольку результаты ($X_i$) происходят в произвольном порядке, поэтому от перестановки их метсами результат меняться не должен
      ],
      [
        *Дисперсия* --- среднее квадратическое отклонение но в квадрате :) (общее определение):
        $
          D xi = E(xi -E xi)^2
        $
        если $xi$ --- ДСВ, то
        $
          D xi = sum_(i=1)^oo (X_i - E xi)^2 dot p_i
        $
        при условии, что данное среднее существует, конечно

        Дисперсию удобно вычислять по формуле (докажем позже):
        $
          D xi = E xi^2 - (E xi)^2 = sum_(i=1)^oo X_i^2 dot p_i - (E xi)^2
        $

        Смысл дисперсии --- квадрат среднего разброса (рассеивание) случайной величины относительно математического ожидания
      ],
      [
        *Среднее квадратическое отклонение (СКО):*
        $
          sigma_xi = sqrt(D xi)
        $
      ],
      [
        *Начальный момент.* Начальным моментом $xi$ порядка $k in NN$ называется число
        $
          alpha_k = E(xi^k) = sum_(i=1)^oo p_i dot X_i^k
        $
        при условии, что такой ряд сходится абсолютно
      ],
      [
        *Центральный момент.* Центральным моментом $xi$ порядка $k$ называется число
        $
          mu_k = E(xi - E xi)^2 = sum_(i=1)^oo p_i dot (X_i - E xi)^2
        $
        опять же при условии абсолютной сходимости этого ряда
      ]
    )
  ]
)
*Важное замечание:* насколько я помню, на курсе было просто понятие момента (без деления) и под $k$-ым моментом подразумевалось именно $alpha_k$, но обозначалось $mu_k$, было бы полезно кому-то это прояснить :)

#pagebreak()

=== Свойства математического ожидания и дисперсии

#enum(
  [
    Для *вырожденного распределения* ($xi = C = const$) $ E xi = C quad D xi = 0 $
  ],
  [
    *Свойство сдвига:*
    $
      E (xi + C) = E xi + C quad D(xi + C) = D xi
    $
  ],
  [
    *Свойство растяжения*
    $
      E(C xi) = C dot E xi quad D(C xi) = C^2 dot D xi
    $
  ],
  [
    *Свойство суммы* ($xi$ и $eta$ --- ДСВ $==> xi + eta$ тоже ДСВ)
    $
      E(xi + eta) = E xi + E eta
    $
    как посчитать $E(xi + eta)$:
    $
      & E(xi + eta) = sum_(i, j) (X_i + Y_j) dot P(xi = X_i, eta = Y_j) = \
      & = sum_i X_i dot sum_j P(xi = X_i, eta = Y_j) + sum_j Y_j dot sum_i P(xi = X_i, eta = Y_j) = \
      & = sum_i X_i dot P(xi = X_i) + sum_j Y_j dot P(eta = Y_j) = E xi + E eta
    $
  ],
  [
    *Свойство произведения.* ДСВ независимы $<==>$\ $<==> (forall X_i, Y_j in RR)(P(xi = X_i, eta = Y_j) = P(xi = X_i) dot P(eta - Y_j))$. Для независимых $xi, eta$ докажем
    $
      E(xi dot eta) = E xi dot E eta
    $
    По аналогии с суммой:
    $
      & E(xi dot eta) = sum_(i, j) X_i dot Y_j dot P(xi = X_i, eta = Y_j) = \
      & = sum_i X_i dot sum_j Y_j dot P(xi = X_i, eta = Y_j) = \
      & = sum_i X_i dot sum_j Y_j dot P(xi = X_i) dot P(eta = Y_j) = \
      & = sum_i X_i dot P(xi = X_i) dot sum_j Y_j dot P(eta = Y_j) = \
      & = sum_i X_i dot P(xi = X_i) dot E eta = E eta dot sum_i X_i dot P(xi = X_i) = \
      & = E xi dot E eta
    $
  ],
  [
    *Свойство для вычисления дисперсии:*
    $
      D xi = E xi^2 - (E xi)^2 = sum_(i=1)^oo X_i ^ 2 dot p_i - (E xi)^2
    $
    Распишем по определению:
    $
      & D xi = E(xi - E xi)^2 = E(xi^2 - 2xi dot E xi + (E xi)^2) = \
      & = E xi^2 - 2 E xi dot E xi + E(E xi^2) = E xi^2 - 2 (E xi)^2  + (E xi)^2 = \
      & = E xi^2 - (E xi)^2 = sum_(i=1)^oo X_i ^ 2 dot p_i - (E xi)^2
    $
  ],
  [
    *Дисперсия суммы.* Введем понятие ковариации (она билинейная форма):
    $
      cov(xi, eta) = E(xi eta) - E xi dot E eta
    $
    Распишем по свойству 6:
    $
      & D (xi + eta) = E(xi + eta)^2 - (E xi + E eta)^2 = \
      & = E(xi^2 + 2 xi eta + eta^2) - ((E xi)^2 + 2 dot E xi dot E eta + (E eta)^2) = \
      & = E xi^2 + 2 dot E (xi eta) + E eta^2 - (E xi)^2 - 2 dot E xi dot E eta - (E eta)^2 = \
      & = underbracket(E xi^2 - (E xi)^2, = D xi) + underbracket(E eta^2 - (E eta)^2, = D eta) + 2 dot underbracket((E (xi eta) - E xi dot E eta), = cov(xi, eta)) = \
      & = D xi + D eta + 2 cov(xi, eta)
    $
  ],
  [
    Общая формула:
    $
      D(sum xi_i) = sum D xi_i + 2 sum_(i<j) cov(xi_i, xi_j)
    $
  ]
)

#pagebreak()

=== Стандартные дискретные распределения

#enum(
  numbering: "I.",
  [
    *Распределение Бернулли ($B_p$, где $0 < p < 1$ --- параметр)*
    
    $xi in B_p$ --- число успехов в 1 испытании, $p$ ---вероятность успеха

    #align(center,
      table(
      columns: 3,
      inset: 10pt,
      align: horizon + center,
      $xi$, $0$, $1$,
      $P$, $1-p$, $p$
    ))

    $
      E xi = 0 dot (1-p) + 1 dot p = p quad quad quad D xi = 0^2 dot (1-p) + 1^2 dot p - (E xi)^2 = p - p^2 = p(1-p) = p q
    $
  ]
  ,
  [
    *Биномиальное распределение ($B_(n, p)$, где $0 < p < 1, n in NN$ --- параметры)*

    $xi$ --- число успехов при $n$ независимых испытаний ($p$ --- вероятность успеха в каждом)

    $
      xi in B_(n, p) <==> P(xi = k) = C_n^k dot p^k dot q^(n-k), quad "где" q = 1 - p
    $

    #align(center, table(
      columns: 7,
      inset: 10pt,
      align: horizon + center,
      $xi$, $0$, $1$, $dots$, $k$, $dots$, $n$,
      $P$, $q^(n)$, $C_n^1 dot p dot q^(n-1)$, $dots$, $C_n^k dot p^k dot q^(n-k)$, $dots$, $p^n$
    ))

    Заметим, что
    $
      xi = xi_1 + xi_2 + dots + xi_n, quad "где" xi_i - "распределение Бернулли"
    $
    При этом $E xi_i = p, D xi_i = p q$, откуда
    $
      E xi = sum E xi_i = n p quad quad quad D xi = sum D xi_i = n p q "(события независимы)"
    $
  ],
  [
    *Геометрическое распределение ($G_p$, $0 < p < 1$ --- параметр)*

    $xi$ --- номер первого удачного из бесконечного числа экспериментов

    $
      xi in G_p <==> P(xi = k) = q^(k-1) dot p
    $

    #align(center, table(
      columns: 8,
      inset: 10pt,
      align: horizon + center,
      $xi$, $1$, $2$, $3$, $4$, $dots$, $k$, $dots$,
      $P$, $p$, $q p$, $q^2 p$, $q^3 p$, $dots$, $q^(k-1) p$, $dots$
    ))

    $
      & E xi = sum_(k=1)^oo k dot P(xi = k) = sum_(k=1)^oo k dot q^(k-1) dot p = p dot sum_(k=1)^oo k dot q^(k-1) = p dot sum_(k=1)^oo (q^k)' = \
      & = p dot (sum_(k=1)^oo q^k)' = ["геометрическая прогрессия"] = p dot (1/(1-q))' = \
      & = p dot 1/(1-q)^2 = p/p^2 =  1/p
    $

    $
      & E xi^2 = sum_(k=1)^oo k^2 dot q^(k-1) dot p = sum_(k=1)^oo (k dot (k-1) + k) dot q^(k-1) dot p = \
      & = sum_(k=1)^oo k dot (k-1) dot q^(k-1) dot p + underbracket(sum_(k=1)^oo k dot q^(k-1) dot p, = E xi = 1/p) = p q dot sum_(k=1)^oo k dot (k-1) dot q^(k-2) + 1/p = \
      & = p q dot sum_(k=1)^oo (q^(k-2))'' + E xi = dots
    $
  ],
  [
    *Распределение Пуассона ($Pi_lambda$, $0 < lambda < 1$)*

    $
      xi in Pi_lambda <==> P(xi = k) = lambda^k/k! dot e^(-lambda), quad "где" k in NN union {0}
    $
    Проверим аксиомы Колмогорова:
    + Неотрицательность --- очевидно
    + Нормировка:
      $
        sum_(k=0)^oo P(xi = k) = sum_(k=0)^oo lambda^k/k! dot e^(-lambda) = e^(-lambda) dot sum_(k=0)^oo lambda^k/k! = e^(-lambda) dot e^lambda = 1
      $
    + $sigma$-аддитивность --- очевидно
    Посчитаем характеристики
    $
      & E xi = sum_(k=0)^oo k dot P(xi = k) = 0 + sum_(k=1)^oo k dot P(xi = k) = \
      & = sum_(k=1)^oo k dot lambda^k/k! dot e^(-lambda) = lambda dot e^(-lambda) dot sum_(k=1)^oo lambda^(k-1)/(k-1)! = \
      & = lambda dot e^(-lambda) dot sum_(k = 0)^oo lambda^k/k! = lambda dot e^(-lambda) dot e^lambda = lambda
    $
    Теперь $E xi^2$:
    $
      & E xi^2 = sum_(k=0)^oo k^2 dot P(xi = k) = 0 + sum_(k=1)^oo k^2 dot P(xi = k) = \
      & = sum_(k=1)^oo k^2 dot lambda^k/k! dot e^(-lambda) = lambda dot e^(-lambda) dot sum_(k=1)^oo k dot lambda^(k-1)/(k-1)! = \
      & = lambda dot e^(-lambda) dot sum_(k=1)^oo (k-1 + 1) dot lambda^(k-1)/(k-1)! = \
      & = lambda dot e ^(-lambda) dot (sum_(k=0)^oo k dot lambda^k/k! + sum_(k=0)^oo lambda^k/k!) = \
      & = underbracket(lambda dot e^(-lambda) dot sum_(k=0)^oo lambda^k/k!, =lambda) + lambda dot e^(-lambda) dot sum_(k=0)^oo k dot lambda^k/k! = lambda + lambda dot underbracket(sum_(k=0)^oo k dot lambda^k/k! dot e^(-lambda), = E xi = lambda) = lambda + lambda^2
    $
    то есть
    $
      D xi = E xi^2 - (E xi)^2 = lambda + lambda^2 - lambda^2 = lambda
    $
  ],
  [
    *Гипергеометрическое распределение*

    Построение (в урне $N$ шаров):
    #align(
      center,
      table(
        columns: 2,
        inset: 20pt,
        align: horizon + center,
        [$K$ белых],
        [$N - K$ черных]
      )
    )
    $xi$ --- число белых шаров среди $n$ вытащенных:
    $
      P(xi = k) = (C_K^k dot C_(N-K)^(n-k))/C_N^n
    $

    $xi = xi_1 + xi_2 + dots + xi_n$, где $xi_i$ --- $i$-й шар белый, посчитаем кое-что:
    $
      P(xi_i = 1) = (K dot A_(N-1)^(n-1))/A_N^n = K/N
    $
    то есть вероятность не зависит от номера шара $==> xi_i$ --- распределение Бернулли
    $
      E xi_i = K/N quad D xi_i = K/N dot (1 - K/N)
    $
    Теперь
    $
      E xi = sum E xi_i = n/N dot K
    $
    и
    $
      & D xi = sum D xi_i + 2 sum_(i < j) cov(xi_i, xi_j) = K dot n/(N) dot (1 - K/N) + sum_(i < j) cov(xi_i, xi_j) \
    $
    причем
    $
      xi_i dot xi_j = 1 <==> xi_i = xi_j = 1 ==> P(xi_i dot xi_j = 1) = (K dot (K-1) dot A_(N-2)^(n-2))/A_N^n = (K(K-1))/(N(N-1))
    $
    откуда
    $
      cov(xi_i, xi_j) = (K(K-1))/(N(N-1)) dot K^2/N^2 = -(K(N-K))/(N^2(N-1))
    $
    то есть
    $
      & D xi = n dot K/N dot (1 - K/N) - 2 dot (n(n-1))/2 dot (K(N-K))/(N^2(N-1)) = \
      & = n dot K/N dot (1 - K/N) - n dot (n-1) dot (K(N-K))/(N^2(N-1)) = n dot K/N dot (1 - K/N) dot (1 - (n-1)/(N-1))
    $
  ]
)

#fun-fact-uh(
  [На лекции так же была затронута #link("https://ru.wikipedia.org/wiki/Задача_о_разорении_игрока", "задача о разорении игрока"), возможно стоит посмотреть что это и разобраться там я хз (ссылка кликабельная должна быть, если что в исходниках можно найти либо просто загуглить и на википедию залезть)]
)
