#import "../../typst-lib/main.typ": *
#import "../../typst-lib/preset.typ": setup

#show: setup


= Базовые идеи теории вероятности

== Введение в теорию вероятности

#def(
  [множество элементарных исходов],
  [
    непустое множество $Omega$. Его элементы $omega in Omega$ называются *элементарными исходами*
  ]
)

#def(
  [Событие (пространства элементарных исходов $Omega$)],
  [
    элемент заранее выбранного непустого семейства подмножеств $Omega$ (позже станет ясно почему не просто подмножество)
  ]
)

Собственно, в том числе для более простого определения события придумали следующее определение.

#def(
  [$sigma$-алгебра (на $Omega$)],
  [
    подмножество булеана $Omega$:
    $
      cal(F) subset.eq 2^Omega,
    $
    такое что:
    + $Omega in cal(F)$
    + $A in cal(F) ==> compl(A) in cal(F)$
    + $(forall A_1, A_2, dots in cal(F))(limits(union.big)_(i=1)^oo A_i in cal(F))$
  ]
)

#fun-fact(
  [Следствия из аксиом $sigma$-алгебры],
  [
    + $nothing in cal(F)$ (прямо следует из 1 и 2 аксиом)
    + Если $A_1, A_2, dots in cal(F)$, то и их пересечение лежит в $cal(F)$:
      $
        & A_i in cal(F) ==> compl(A_i) in cal(F) ==> union.big_(i=1)^oo compl(A_i) in cal(F) ==> compl(union.big_(i=1)^oo compl(A_i)) in cal(F) ==> inter.big_(i=1)^oo A_i in cal(F)
      $
  ]
)

Теперь событие --- просто элемент $sigma$-алгебры (на самом деле, в ней лежат только измеримые события, но зачем нам другие?)

Пара $(Omega, cal(F))$ называется *измеримым пространством*.

#def(
  [Вероятностная мера (на измеримом пространстве $(Omega, cal(F))$)],
  [
    функция
    $
      P : cal(F) -> [0, 1] subset RR,
    $
    обладающая следующими свойствами:
    + $(forall A in cal(F))(P(A) >= 0)$ --- _ неотрицательность _
    + $P(Omega) = 1$ --- _ нормировка _
    + _ Счетная ($sigma$-) аддитивность: _
      $
        (forall A_1, A_2, dots | i != j => A_i inter A_j = nothing)(P(limits(union.big)_(i=1)^oo A_i) = limits(sum)_(i=1)^oo P(A_i))
      $
    Эти свойства называются аксиомами Колмогорова
  ]
)

Итак, самое важное определение раздела:

#def(
  [Вероятностное пространство],
  [
    тройка $(Omega, cal(F), P)$, где
    - $Omega$ --- множество элементарных исходов
    - $cal(F)$ --- $sigma$-алгебра на $Omega$
    - $P$ --- вероятностная мера на $(Omega, cal(F))$
  ]
)

#pagebreak()

== Некоторые свойства вероятностной меры

#theorem(
  name: [Вероятность невозможного события],
  [
    $
      P(nothing) = 0
    $
  ],
  [
    В любой $sigma$-алгебре можно рассмотреть семейство событий $Omega, nothing$, по аксиоме нормировки $P(Omega) = 1$, по аксиоме счетной аддитивности:
    $
      P(Omega) = P(Omega) + P(nothing) <==> P(nothing) = 0
    $
  ]
)

#theorem(
  name: [Веротяность противоположного события],
  [
    $
      P(compl(A)) = 1 - P(A)
    $
  ],
  [
    Поскольку $A inter compl(A) = nothing$, а $A union compl(A) = Omega$, можно воспользоваться аксиомой счетной аддитивности
    $
      P(Omega) = P(A) + P(compl(A)) = 1 ==> P(compl(A)) = 1 - P(A)
    $
  ]
)

#theorem(
  name: [Монотонность вероятности],
  [
    Если $A, B in cal(F)$, то
    $
      A subset.eq B ==> P(A) <= P(B)
    $
  ],
  [
    $
      B = A union.sq (B smn A) ==> P(B) = P(A) + underbracket(P(B smn A), >= 0) >= P(A)
    $
  ]
)

\ \
#theorem(
  name: [Вероятность суммы событий],
  [
    $
      P(A union B) = P(A) + P(B) - P(A inter B)
    $
  ],
  [
    Просто цепочка рассуждений:
    $
      & A union B = A union.sq (B smn A) ==> P(A union B) = P(A) + P(B smn A) quad & (1) \
      & B = (B smn A) union.sq (A inter B) ==> P(B) = P(B smn A) + P(A inter B) quad &(2)
    $
    из (2) получим $P(B smn A) = P(B) - P(A inter B)$, подставим в (1):
    $
      P(A union B) = P(A) + P(B) - P(A inter B)
    $
  ]
)

#theorem(
  name: [Непрерывность вероятностной меры],
  [
    Если $A_1 subset.eq A_2 subset.eq dots$ и $union.big A_i = A$, то
    $
      lim_(n->oo) P(A_n) = P(A)
    $
  ],
  [
    Положим $B_1 := A_1$ и $B_k = A_k smn A_(k-1)$, тогда
    $
      A_N = union.big.sq_(i=1)^N B_i quad "(несложно доказать по индукции)"
    $
    и
    $
      A = union.big.sq_(i=1)^oo B_i
    $
    запишем
    $
      P(A_N) = sum_(i=1)^N P(B_N),
    $
    перейдем к пределу по $N -> oo$:
    $
      P(A) = sum_(i=1)^oo P(B_n) <==> P(A) = lim_(n->oo) P(A_n)
    $
  ]
)


// TODO: доказать ФВИ
// #theorem(
//   name: [Формула фключений и исключений],
//   [
//     $
//       P(union.big_(i=1)^n A_i) = sum_(I subset.eq {1, dots n}) (-1)^(abs(I) + 1) dot P(inter.big_(i in I) A_i)
//     $
//     упрощенный вид:
//     $
//       P(union.big_(i=1)^n A_i) = & sum_(i=1)^n P(A_i) \
//       & - sum_(i < j <= n) P(A_i inter A_j) \
//       & + sum_(i < j < k <= n) P(A_i inter A_j inter A_k) \
//       & - quad dots.c
//     $
//   ],
//   [
//     Докажем с помощью математической индукции:
//     - *База:* $n = 1$: $P(A_1) = (-1)^(1 + 1) dot P(A_1) = P(A_1)$
//     - *Переход:* пусть верно для $n = k$, докажем для $n = k+1$. Пусть
//       $
//         B = union.big_(i=1)^k A_i
//       $
//       по теореме выше
//       $
//         P(A_(k+1) union B) = P(A_(k+1)) + P(B) - P(A_(k+1) inter B)
//       $
//   ]
// )


#pagebreak()

== Дискретное вероятностное пространство и классическая Вероятность

#def(
  [Дискретное вероятностное пространство],
  [
    вероятностное пространство называется дискретным, если $Omega$ --- счетно (или конечно) и $cal(F) = 2^Omega$ (то есть все события измеримы)
  ]
)

В дискретном веротяностном пространстве для $omega in Omega$ определим

$
  p_omega = P({omega}),
$

здесь $p_omega$ --- вероятность элементарного исхода $omega$

Из аксиом следует $p_omega >= 0$ и $sum p_omega = 1$ (очевидно)

Для любого $A in cal(F)$ ($<==> A subset.eq Omega$) очевидно, что
$
  P(A) = sum_(omega in A) p_omega
$

Отсюда можно сделать вывод, что дискретное вероятностное пространство однозначно определяется набором чисел ${p_omega}_(omega in Omega)$, которые удовлетворяют условиям нормировки и неотрицательности.

// === Классическая вероятность

Если ввести ограничения (считать, что все события равновероятны)
$ abs(Omega) = n in NN #h(2em) "и" #h(2em) p_omega_1 = dots = p_omega_n = p $
получим
$
  sum_(i=1)^n p_omega_i = n p = 1 ==> p = 1/n
$

То есть
$
  P(A) = sum_(omega in A) p_omega = p dot sum_(omega in A) 1 = p dot abs(A) = abs(A)/n = abs(A)/abs(Omega)
$

Мы вывели формулу классической вероятности:

$
  P(A) = abs(A)/abs(Omega) = m/n
$

#pagebreak()

== Геометрическое вероятностное пространство и геометрическая вероятность

Пусть теперь $Omega$ --- измеримое подмножество $RR^n$:
$
  Omega subset RR^n #h(2em) 0 < lambda_n (Omega) < oo,
$
где $lambda_n$ --- $n$-мерная мера Лебега.

Определим $cal(F) := {A subset.eq Omega : A "измеримо по Лебегу"}$ и
$
  P(A) = (lambda_n (A))/(lambda_n (Omega)).
$

Проверим аксиомы Колмогорова:
+ Неотрицательность --- очевидно
+ Нормировка --- очевидно
+ Счетная аддитивность --- следует из счетной аддитивности меры Лебега

Нами только что была введена геометрическая вероятность и доказана ее корректность

#pagebreak()

== Условная вероятность

#def(
  [Условная вероятность],
  [
    вероятностью наступления $A$, при условии, что наступило событие $B$, называется величина
    $
      P(A|B) = (P(A inter B))/(P(B))
    $
  ]
)

Для запоминания формулы удобно пользоваться *формулой умножения вероятностей:*
$
  P(A inter B) = P(B) dot P(A|B) = P(A) dot P(B|A)
$

#theorem(
  [
    $
      P(A_1 inter A_2 inter dots inter A_n) = P(A_1) dot P(A_2|A_1) dot P(A_3| A_2 A_1) dot dots dot P(A_n|A_(n-1)A_(n-2) dots A_1)
    $
  ],
  [
    В выражении $A_1 inter A_2 inter dots inter A_n$ расставим скобки:
    $
      (dots(((A_1 inter A_2) inter A_3) inter A_4) inter A_5) inter dots ) inter A_n
    $
    (то есть будем вычислять последовательно --- сначала $A_1 inter A_2$, затем $A_1 inter A_2 inter A_3$ и так далее)
    получим
    $
      P(A_1 inter A_2) = P(A_1) dot P(A_2|A_1)
    $
    далее
    $
      P(A_1 inter A_2 inter A_3) = P(A_1 inter A_2) dot P(A_3|A_1 inter A_2) = P(A_1) dot P(A_2|A_1) dot P(A_3|A_1 inter A_2)
    $
    Итак, итеративно применяя формулу умножения вероятностей получим нужный результат:
    $
      & P(A_1 inter A_2 inter dots inter A_n) = \
      & =P(A_1) dot P(A_2|A_1) dot P(A_3| A_2 inter A_1) dot dots dot P(A_n|A_(n-1) inter A_(n-2) inter dots inter A_1)
    $
  ]
)

#fun-fact-uh(
  $
    A "и" B "независимы" <==> P(A inter B) = P(A) dot P(B) <==> P(A|B) = P(A)
  $
)

#pagebreak()
=== Формула полной вероятности

#def(
  [Полная группа событий],
  [разбиение веорятностного пространства $Omega$]
)

#theorem(
  name: [Формула полной вероятности],
  [
    $
      P(A) = sum_(i=1)^n P(H_i) dot P(A|H_i),
    $
    где ${H_i}$ --- полная группа событий
  ],
  [
    Поскольку ${H_i}$ --- полная группа событий, можно утверждать, что при $i != j$\ $H_i inter H_j = nothing$. Значит $A$ можно разбить на *непересекающиеся* куски:
    $
      A = (A inter H_1) union.sq (A inter H_2) union.sq dots union.sq (A inter H_n),
    $
    а раз $H_i$ несовместны, то и $A inter H_i$ несовместны, а значит можно утверждать, что
    $
      P(A) = P(A inter H_1) + P(A inter H_2) + dots + P(A inter H_n).
    $
    По формуле условной вероятности
    $
      P(A|H_i) = (P(A inter H_i))/(P(H_i)) <==> P(A inter H_i) = P(H_i) dot P(A|H_i),
    $
    подставим в предыдущую формулу:
    $
      P(A) = P(H_1) dot P(A|H_1) + P(H_2) dot P(A|H_2) + dots + P(H_n) dot P(A|H_n)
    $
    или
    $
      P(A) = sum_(i=1)^n P(H_i) dot P(A|H_i)
    $
  ]
)

#pagebreak()
=== Формула Байеса

#theorem(
  name: "Формула Байеса",
  [
    $
      P(H_k|A) = (P(H_k) dot P(A|H_k))/(display(limits(sum)_(i=1)^n) P(H_i) dot P(A|H_i)),
    $
    где ${H_i}$ --- полноая группа событий
  ],
  [
    Рассмотрим формулу умножения вероятностей:
    $
      P(A inter H_k) = P(A) dot P(H_k|A) = P(H_k) dot P(A|H_k),
    $
    откуда
    $
      P(H_k|A) = (P(H_k) dot P(A|H_k))/(P(A));
    $
    применим формулу полной вероятности:
    $
      P(A) = sum_(i=1)^n P(H_i) dot P(A|H_i),
    $
    получаем
    $
      P(H_k|A) = (P(H_k) dot P(A|H_k))/(display(limits(sum)_(i=1)^n) P(H_i) dot P(A|H_i))
    $
  ]
)
