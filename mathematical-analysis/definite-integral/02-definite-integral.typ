#import "../../typst-lib/main.typ": *

#set text(size: 14pt)

#notes-header([Определенный интеграл. Интеграл по Риману])

#def(
  [Разбиение],
  [
    разбиением $tau$ отрезка $[a, b]$ называется множество ${x_i}$, таких что
    $
      a = x_0 < x_1 < x_2 < dots < x_(n-1) < x_n = b
    $
    Каждый $[x_(i-1), x_i]$ называется частичным отрезком. Его длина (ого!) вычисляется по формуле $Delta x_i = x_i - x_(i-1)$
  ],
)
#def(
  [Выборка],
  [
    в разиении ${x_i}$, множество $xi = {xi_i}$, таких что
    $
      xi_i in [x_(i-1), x_i]
    $
  ],
)
#def(
  [Мелкость (ранг, диаметр) разбиения],
  [
    длина наибольшего интервала разбиения:
    $
      lambda(tau) = min_(i = 1)^n Delta x_i
    $
  ],
)

#def(
  [Интегральная сумма Римана],
  [
    для функции $f$ на $[a, b]$ называется число
    $
      delta_tau (f, xi) = limits(sum)_(i = 1)^n f(xi_i) dot Delta x_i
    $
  ],
)

#def(
  [Определенный интеграл Риману],
  [
    (не по-Бакеевски а по-человечески) просто ну предел
    $
      I = limits(integral)_a^b f(x) dif x = limits(lim)_(lambda(tau) -> 0) (limits(sum)_(i = 1)^n f(xi_i) Delta x_i)
    $
    причем *предел должен не меняться от выбора $xi$*

    Если существует такое $I$, функция называется _ интегрируемой _ по Риману
  ],
)

#fun-fact-headered(
  [Замечания],
  [
    + Для константы верно, что
      #block(
        width: 100%,
        $
          limits(integral)_a^b C dif x = C dot (b - a)
        $,
      )
      Доказательство:
      $
        (forall xi)(f(xi_i) = C)
      $
      ну и сумма Римана
      $
        limits(sum)_(i = 1)^n C dot Delta x_i = C dot underbracket(limits(sum)_(i = 1)^n Delta x_i, = b - a) = C dot (b - a)
      $
  ],
)
