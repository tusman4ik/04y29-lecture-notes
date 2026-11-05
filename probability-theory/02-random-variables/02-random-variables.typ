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
  [Дискретное], [Абсолютно непрерывное], [Их смеси]
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
          mu_k = E(xi - E xi)^k = sum_(i=1)^oo p_i dot (X_i - E xi)^k
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

#pagebreak()

== Непрерывные случайные величины

#def(
  [Функция распределения],
  [
    для случайной величины $xi$ функцией распределения будет функция
    $
      F_xi (x) = P(xi <= x)
    $
  ]
)

#def(
  [Непрерывная случайная величина],
  [
    $xi$ называется непрерывной $<==>$ ее функция распределения непрерывна
  ]
)

#theorem(
  [
    Если функция распределения непрерывна, то
    $
      forall a in RR quad P(xi = a) = 0
    $
  ],
  [
    Из непрерывности $F_xi (x)$ и вероятностной меры (снизу):
    $
      P(xi < a) = lim_(n->oo) P(xi <= a - 1/n) = F_xi (a - 0) = F_xi (a)
    $
    отсюда
    $
      P(xi = a) = P(xi <= a) - P(xi < a) = F_xi (a) - F_xi (a) = 0
    $
  ]
)

#pagebreak()

== Абсолютно непрерывные случайные величины

Предыдущий пункт был лирическим отступлением и вообще никому не нужен, поэтому перейдем к следующему.

#def(
  [Абсолютно непрерыная случайная величина],
  [
    величина $xi$, для которой существует измеримая *функция плотности* $f_xi : RR -> [0, + oo]$, такая что
    $
      F_xi (x) = limits(integral)_(-oo)^x f_xi (t) dif t
    $
  ]
)

Из определения $F_xi (x)$ здесь следует ее непрерывность $==>$ абсолютно непрерывная случайная величина всегда является непрерывной (во дела!)

#fun-fact(
  [Свойства функции плотности],
  [
    + *Неотрицательность* --- следует из определения
    + *Нормировка.* Из определения $F_xi (x)$ (как функции распределения в целом), получаем
      $
        lim_(x -> +oo) F_xi (x) = 1,
      $
      а значит
      $
        limits(integral)_(-oo)^(+oo) f_xi (x) dif x = 1
      $
    + *Вероятность попадания в интервал:*
      $
        & P(a <= xi <= b) = F(b) - F(a) + P(xi = a) = F(b) - F(a) = \
        & = limits(integral)_(-oo)^b f_xi (x) dif x - limits(integral)_(-oo)^a f_xi (x) dif x = limits(integral)_a^b f_xi (x) dif x
      $
    + *Связь с функцией распределения:* почти всюду (везде, кроме счетного числа точек) верно, что
    $
      F'_xi (x) = f_xi (x)
    $
  ]
)

#pagebreak()

=== Числовые характеристики абсолютно непрерывной случайной величины

*При существовании соответствующих интегралов (и совпадении определений моментов)*

$
  & E xi = limits(integral)_(-oo)^(+oo) x dot f(x) dif x \
  & D xi = E xi^2 - (E xi)^2 \
  & alpha_k = E xi^k = limits(integral)_(-oo)^(+oo) x^k dot f(x) dif x \
  & mu_k = E (xi - E xi)^k \
$

#pagebreak()

=== Стандартные абсолюно непрерывные распределения

#enum(
  numbering: "I.",
  [
    *Равномерное. $U(a, b)$.* Рассмотрим
    $
      f_xi (x) = cases(
        0\, quad & x < a,
        display(1/(b-a))\, quad & a <= x <= b,
        0\, quad & x > b
      )
    $
    Найдем $F_xi$, рассматриваем на $[a, b]$:
    $
      F_xi (x) = limits(integral)_(-oo)^x f_xi (t) dif t = limits(integral)_a^x f_xi (t) dif t = limits(integral)_a^x (dif t)/(b-a) = 1/(b-a) dot limits(integral)_a^x dif t = (x-a)/(b-a),
    $
    откуда
    $
      F_xi (x) = cases(
        0\, quad & x < a,
        display((x - a)/(b-a))\, quad & a <= x <= b,
        0\, quad & x > b
      )
    $
    Теперь матожидание:
    $
      & E xi =  limits(integral)_(-oo)^(+oo) x dot f_xi (x) dif x = limits(integral)_a^b x dot f(x) dif x = 1/(b-a) dot limits(integral)_a^b x dif x = \
      & = 1/(b-a) dot (b^2 - a^2)/2 = ((b-a)dot (b+a))/(2 dot (b-a)) = (a + b)/2
    $
    Второй начальный момент:
    $
      & E xi^2 = limits(integral)_(-oo)^(+oo) x^2 dot f_xi (x) dif x = limits(integral)_a^b x^2 dot f_xi (x) dif x = 1/(b-a) dot limits(integral)_a^b x^2 dif x = \
      & = 1/(b-a) dot (b^3 - a^3)/3 = ((b-a) dot (a^2 + a b + b^2))/(3 dot (b-a)) = (a^2 + a b + b^2)/3
    $
    И дисперсия:
    $
      & D xi = E xi^2 - (E xi)^2 = (a^2 + a b + b ^2)/3 - (a^2 + 2 a b + b^2)/4 = \
      & = (4 a^2 + 4 a b + 4 b ^2 - 3 a^2 - 6 a b - 3 b^2)/12 = (a^2 - 2 a b - b ^2)/12 = \
      & =  (a - b)^2/12 = (b-a)^2/12
    $
  ],
  [
    *Показательное. $E_alpha$.* Распределение с плотностью
    $
      f_xi (x) = cases(
        0\, quad & x < 0,
        alpha dot e^(-alpha x)\, quad & x >= 0
      )
    $
    Рассмотрим $F_xi (x)$ на $[0, +oo]$:
    $
      & F_xi (x) = limits(integral)_(-oo)^x f_xi (t) dif t = limits(integral)_0^x f_xi (t) dif t = limits(integral)_0^x alpha dot e^(-alpha t) dif t = [dif (-alpha t) = -alpha dif t] = \
      & = - limits(integral)_0^x e^(-alpha t) dif (-alpha t) = 1 - e ^(-alpha x)
    $
    Таким образом
    $
      F_xi (x) = cases(
        0\, quad & x < 0,
        1 - e^(-alpha x)\, quad & x >= 0
      )
    $
    Теперь $E xi$:
    $
      E xi = limits(integral)_(-oo)^(+oo) x dot f_xi (x) dif x = limits(integral)_0^(+oo) x dot f_xi (x) dif x = limits(integral)_0^(+oo) alpha x dot e ^(-alpha x) dif x
    $
    Найдем интеграл
    $
      & limits(integral)_0^(+oo) t dot e^(-t) dif t = lim_(b -> +oo) (limits(integral)_0^b t dot e^(-t) dif t) = mat(
        delim: "[",
        u = t, dif u = dif t;
        dif v = e^(-t) dif t, v = - e^(-t)
      ) = \
      & = lim_(b->+oo) (- t dot e^(-t) - limits(integral) - e^(-t) dif t)_0^b = lim_(b -> +oo) (-t dot e^(-t) - e^(-t))_0^b = \
      & = lim_(b->+oo) (1 - b dot e^(-b) - e^(-b)) = 1
    $
    тогда
    $
      E xi = limits(integral)_0^(+oo) alpha x dot e^(-alpha x) dif x = 1/alpha dot underbracket(limits(integral)_0^(+oo) alpha x dot e^(-alpha x) dif (alpha x), =1) = 1/alpha
    $
    Найдем $E xi^2$:
    $
      E xi^2 = limits(integral)_(-oo)^(+oo) x^2 dot f_xi (x) dif x = limits(integral)_0^(+oo) x^2 dot f_xi (x) dif x = limits(integral)_0^(+oo) alpha x^2 dot e^(-alpha x) dif x
    $
    Найдем неопределенный интеграл
    $
      & integral t^2 e^(-t) dif t = mat(
        delim: "[",
        u = t^2, dif u = t dif t;
        dif v = e^(-t) dif t, v = -e^(-t)
      ) = - t^2 e^(-t) + integral 2 t e^(-t) dif t = \
      & = -t^2 e^(-t) - 2t e^(-t) - 2 dot integral -e^(-t) dif t = -t^2 e^(-t) -2t e^(-t) - 2 e^(-t) + C= \
      & = -e^(-t) dot (t^2 + 2t + 2) + C
    $
    Теперь найдем
    $
      limits(integral)_0^b t^2 e^(-t) dif t = - e^(-b) dot (b^2 + 2b + 2) + 2
    $
    и
    $
      & limits(integral)_0^(+oo) t^2 e^(-t) dif t = lim_(b -> +oo) (limits(integral)_0^b t^2 e^(-t) dif t) = lim_(b -> +oo) (2 - e^(-b) dot (b^2 + 2b + 2)) = 2\
    $
    Приведем исходный интеграл к такому виду:
    $
      E xi^2 = limits(integral)_0^(+oo) alpha x^2 dot e^(-alpha x) dif x = 1/alpha^2 dot limits(integral)_0^(+oo) (alpha x)^2 dot e(-alpha x) dif (alpha x) = 2/alpha^2
    $
    откуда
    $
      D xi = E xi^2 - (E xi)^2 = 2/alpha^2 - 1/alpha^2 = 1/alpha^2
    $
  ],
  [
    *Нормальное (гауссовское) распределение. $N(a, sigma^2)$.* Рассмотрим функцию плотности
    $
      f_xi (x) = 1/(sigma sqrt(2 pi)) dot e^(-(x-a)^2/(2sigma^2))
    $
    Здесь нам понадобится во второй раз познакомиться с функцией Гаусса (иногда $phi(x)$ --- плотность нормального распределения, а не функция Гаусса):
    $
      phi(x) = e^(-x^2)
    $
    и интеграллом Пуассона (Гаусса):
    $
      limits(integral)_(-oo)^(+oo) e^(-x^2) dif x
    $
    хочется его посчитать!
    #fun-fact(
      [Вычисление интеграла Пуассона],
      [
        Обозначим
        $
          I = limits(integral)_(-oo)^(+oo) e^(-x^2) dif x
        $
        тогда
        $
          I^2 = (limits(integral)_(-oo)^(+oo) e^(-x^2) dif x) dot (limits(integral)_(-oo)^(+oo) e^(-y^2) dif y)
        $
        Да, переменные неезависимы (если интегралы существуют), запишем как двойной интеграл (имеем право)
        $
          limits(integral)_(-oo)^(+oo) limits(integral)_(-oo)^(+oo) e^(-x^2) dot e^(-y^2) dif y dif x = limits(integral.double)_(RR^2) e^(-(x^2 + y^2)) dif x dif y
        $
        Теперь удобно перейти к полярным координатам:
        $
          cases(
            x = rho cos phi,
            y = rho sin phi
          ) #h(2.5em) abs(J) = rho
        $
        Поскольку исходная область интегрирования $RR^2$, пределы интегрирования максимальны:
        $
          rho in [0, +oo) #h(2.5em) phi in [0, 2pi) #h(2.5em) D = [0, +oo) times [0, 2pi]
        $
        найдем двойной интеграл ($x^2 + y^2 = rho^2$):
        $
          & limits(integral.double)_(D) e^(-rho^2) dot abs(J) dif rho dif phi = limits(integral.double)_(D) rho e^(-rho^2) dif rho dif phi = limits(integral)_0^(2 pi) limits(integral)_0^(+oo) e^(-rho^2) rho dif rho dif phi = \
          & = ["поскольку внутренний интеграл не зависит от" phi ] = \
          & = limits(integral)_0^(2pi) dif phi dot limits(integral)_(0)^(+oo) e^(-rho^2) rho dif rho = [rho dif rho = - 1/2 dif (-rho^2)] = -2pi dot 1/2 dot limits(integral)_0^(+oo) e^(-rho^2) dif (-rho^2) = \
          & = -pi limits(integral)_0^(-oo) e^t dif t = pi dot limits(integral)_(-oo)^0 e^t dif t = (*)
        $
        посчитаем интеграл
        $
          limits(integral)_a^0 e^t dif t = 1 - e^a
        $
        откуда
        $
          limits(integral)_(-oo)^0 e^t dif t = lim_(a -> -oo) (limits(integral)_a^0 e^t dif t) = lim_(a -> -oo) (1 - e^a) = 1
        $
        то есть
        $
          (*) = pi dot 1 = pi
        $
        откуда
        $
          I^2 = pi ==> I = sqrt(pi)
        $
        (поскольку $phi(x)$ неотрицательна на $RR$)
      ]
    )
    Теперь мы знаем значение интеграла Пуассона:
    $
      limits(integral)_(-oo)^(+oo) phi (x) dif x = sqrt(pi)
    $
    Найдем в общем случае $F_xi (x)$ выразить невозможно, поэтому рассмотрим функцию распределения в стандартном нормальном распределении $N(0, 1)$ --- *функцию Лапласа*
    $
      Phi(x) = 1/sqrt(2pi) limits(integral)_(-oo)^x e^(-(t^2)/2) dif t
    $
    в общем случае значение этой функции можно найти через интеграл Пуассона (через аддитивность по пределам интегрирования), но в мире существуют таблицы значений этой функции, поэтому считать ее руками вам почти наверняка не придется.

    Так вот, $F_xi (x)$:
    $
      & F_xi (x) = limits(integral)_(-oo)^(+oo) f_xi (x) dif x = limits(integral)_(-oo)^(oo) 1/(sigma sqrt(2pi)) dot e^(-(x-a)^2/(2 sigma^2)) dif x = \
      & = [t = (x-a)/(sigma) quad dif t = (dif x)/(sigma) ==> dif x = sigma dif t] = \
      & = limits(integral)_(-oo)^(+oo) (sigma)/(sigma sqrt(2 pi)) dot e^(-t^2/2) dif t = 1/sqrt(2pi) dot limits(integral)_(-oo)^(+oo) e^(-t^2/2) dif t = 1/sqrt(2pi) dot Phi(t) = \
      & = 1/sqrt(2pi) dot Phi((x-a)/sigma)
    $

    Теперь матожидание:
    $
      & E xi = limits(integral)_(-oo)^(+oo) x dot f_xi (x) dif x = limits(integral)_(-oo)^(+oo) x dot 1/(sigma sqrt(2pi)) dot e^(-(x-a)^2/(2 sigma^2)) dif x = \
      & = [t = (x-a)/(sqrt(2) sigma) ==> x = sqrt(2) sigma t + a quad dif t = (dif x)/(sqrt(2) sigma) ==> dif x = sqrt(2) sigma dif t] = \
      & = limits(integral)_(-oo)^(+oo) (sqrt(2) sigma t + a) dot (sqrt(2) sigma)/(sigma sqrt(2pi)) dot e^(-t^2) dif t = (sqrt(2) sigma)/sqrt(pi) dot underbracket(limits(integral)_(-oo)^(+oo) t dot e^(-t^2) dif t, I_1) + a/sqrt(pi) dot underbracket(limits(integral)_(-oo)^(+oo) e^(-t^2) dif t, I_2)
    $
    Посчитаем оба интеграла отдельно:
    $
      I_1 = limits(integral)_(-oo)^(+oo) t dot e^(-t^2)
    $
    заметим, что подынтегральная функция нечетна, а промежуток интегрирования симметричный $==> I_1 = 0$.

    Теперь рассмотрим $I_2$ --- это просто интеграл Пуассона $==> I_2 = sqrt(pi)$. Подставим в $E xi$:
    $
      E xi = (sqrt(2) sigma)/sqrt(pi) dot 0 + a/sqrt(pi) dot sqrt(pi) = 0 + a = a
    $

    Теперь посчитаем $E xi^2$:
    $
      & E xi^2 = limits(integral)_(-oo)^(+oo) x^2 dot f_xi (x) = limits(integral)_(-oo)^(+oo) x^2 dot 1/(sigma sqrt(2i)) e^(-(x-a)^2/(2 sigma^2)) dif x = \
      & = [t = (x-a)/(sqrt(2) sigma) ==> x^2 = (sqrt(2)sigma t + a)^2 quad dif t = (dif x)/(sqrt(2) sigma) ==> dif x = sqrt(2) sigma dif t] = \
      & = limits(integral)_(-oo)^(+oo) (sqrt(2) sigma t + a)^2 dot (sqrt(2) sigma)/(sigma sqrt(2pi)) dot e^(-t^2) dif t = limits(integral)_(-oo)^(+oo) (2 sigma^2 t^2 + 2sqrt(2)sigma  a t+ a^2)/(sqrt(pi)) dot e^(-t^2) = \
      & = (2sigma^2)/sqrt(pi) dot underbracket(limits(integral)_(-oo)^(+oo) t^2 dot e^(-t^2) dif t, = I)  + (2 sqrt(2) sigma a)/sqrt(pi) dot underbracket(limits(integral)_(-oo)^(+oo) t dot e^(-t^2) dif t, =0 "(подынтегральная"\ "функция нечетна)") + a^2/sqrt(pi) dot underbracket(limits(integral)_(-oo)^(+oo) e^(-t^2) dif t, =sqrt(pi) "(интеграл"\ "Пуассона)") = \
      & = (2 sigma^2)/sqrt(pi) dot I + (2 sqrt(2) sigma a)/sqrt(pi) dot 0 + a^2/sqrt(pi) dot sqrt(pi) =  (2 sigma^2)/sqrt(pi) dot I + 0 + a^2 =  (2 sigma^2)/sqrt(pi) dot I + a^2
    $
    Посчитаем $I$:
    $
      & I = limits(integral)_(-oo)^(+oo) t^2 dot e^(-t^2) dif t
    $
    Найдем неопределенный интеграл
    $
      & integral t^2 e^(-t^2) dif t = mat(
        delim: "[",
        column-gap: #(0% + 1.5em),
        align: #left,
        u = t, dif u = dif t;
        dif v = t e^(-t^2) dif t, v = -1/2 e^(-t^2)
      ) = \
      & = -t/2 e^(-t^2) + 1/2 integral e^(-t^2) dif t
    $
    Подставим:
    $
      & I = (-t/2 e^(-t^2) + 1/2 integral e^(-t^2) dif t)_(-oo)^(+oo) = (-t/2 e^(-t^2))_(-oo)^(+oo) + 1/2 underbracket(limits(integral)_(-oo)^(+oo) e^(-t^2) dif t, "интеграл"\ "Пуассона") = \
      & = -1/2 dot underbracket((lim_(t -> +oo) t dot e^(-t^2) - lim_(t -> -oo) t dot e^(-t^2)), = (0 - 0) = 0) + sqrt(pi)/2 = sqrt(pi)/2
    $
    И в $E xi^2$:
    $
      E xi^2 = (2 sigma^2)/sqrt(pi) dot I + a^2 = (2 sigma^2)/sqrt(pi) dot sqrt(pi)/2 + a^2 = sigma^2 + a^2
    $
    Теперь дисперсия:
    $
      D xi = E xi^2 - (E xi)^2 = sigma^2 + a^2 - a^2 = sigma^2
    $
  ]
)
