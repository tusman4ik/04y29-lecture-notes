#import "../../typst-lib/main.typ": *

#set text(size: 12pt)

#notes-header([Числовые ряды])

#def(
  [Числовой ряд],
  [
    сумма вида
    $
      a_1 + a_2 + dots = limits(sum)_(k=1)^oo a_k
    $
    здесь $a_n$, как правило, выражается какой-то функцией:
    $
      a_n = f(n)
    $
  ],
)

#def(
  [Частичная сумма],
  [
    сумма конечного числа членов числового ряда:
    $
      S_n = a_1 + a_2 + dots + a_n = sum_(k=1)^n a_k
    $
  ],
)

#def(
  [Сходимость числовых рядов],
  [
    числовой ряд скходится, если существует конечный предел последовательности частичных сумм:
    $
      (exists S in RR)(lim_(n->oo){S_n} = S)
    $
    В таком случае $S$ называется _*суммой ряда*_.

    Если такой предел бесконечен или не существует, то такой ряд называется _*расходящимся*_
  ],
)

#fun-fact(
  [
    По какой-то невиданной причине (вероятно, для удобства) было введено определение "остатка чисел ряда". Есть сомнения что такое понятие существует, но если расписать ряд через $n$-ную частичную сумму:
    $
      sum_(k=1)^n a_k = S_n + sum_(k=n+1)^oo a_k
    $
    то последний член и будет остатком чисел ряда:
    $
      R_n = sum_(k=n+1)^oo a_k
    $
  ],
)

#theorem(
  [
    Если числовой ряд сходится, ${R_n} -->_(n->oo) 0$
  ],
  [
    По определению сходимости ряда
    $
      lim {S_n} = S, quad S in RR
    $
    #TODO
  ],
)


#notes-sub([Примеры сходящихся и расходящихся числовых рядов], pgbreak: true)

+ $a_n = 0$:\
  Здесь $S_n = 0 ==> lim {S_n} = 0==>$ ряд сходится к 0
+ $a_n = 1$:\
  $S_n = n ==> lim {S_n} = +oo==>$ ряд расходится
+ $a_n = (-1)^n$:\
  $S_(2m) = 0, "но" S_(2m+1)=-1 ==>$ можно выделить 2 подпоследовательности с разными пределами, то есть $lim{S_n}$ не существует $==>$ ряд расходится
+ *Геометрический ряд:* $a_n = b dot q^(n-1)$ ($q, b in RR$). Рассмотрим частичную сумму:
  $
    S_n = limits(sum)_(k=1)^oo a_n = b + b q + b q^2 + dots + b q^(n-1)
  $
  преобразуем:
  $
    & S_n = b dot (1 + q + q^2 + dots + q^(n-1)) = (b dot (1-q^n))/(1-q) "(придется поверить)" = \
    & = b/(1-q) - (b q^n)/(1-q)
  $
  Рассмотрим разные $q$:
  - $abs(q) < 1 ==> q^n -->_(n->oo) 0$, откуда #block(width: 100%, $ display(lim{S_n} = b/(1-q)) = S $)
    то есть, ряд сходится к $display(b/(1-q))$

  - $abs(q) > 1 ==> q^n -->_(n->oo) plus.minus oo$, а значит
    $
      lim {S_n} = plus.minus oo
    $
    то есть, ряд расходится
  - $abs(q) = 1$ получается домноженный на константу ряд 1 или 2, то есть, ряд снова расходится
+ (Вроде) гармонический ряд:
  $
    a_n = 1/n
  $
  Составим вспомогательный ряд, каждый член которого небольше члена исходного ряда:
  $
    1 + 1/2 + 1/4 + 1/4 + 1/8 + 1/8 + 1/8 + 1/8 + underbracket(1/16 + dots + 1/16, 8 "штук") + dots
  $
  Найдем соответствующие вспомогательные суммы:
  $
    & S'_1 = 1 \
    & S'_2 = 3/2 \
    & S'_4 = 3/2 + 2 dot 1/4 = 2 \
    & S'_8 = S_4 + 1/2 = 5/2 \
    & S'_16 = 3 \
  $
  по определению вспомогательного ряда, его суммы будут сколь угодно большими, откуда
  $
    lim {S'_n} = +oo
  $
  а теперь маленькое замечание:
  $
    S_n >= S'_n
  $
  а значит
  $
    lim{S_n} >= lim{S'_n} ==> S_n -> +oo
  $
  то есть, такой ряд расходится

#pagebreak()

#theorem(
  name: [Критерий Коши сходимости ряда],
  [
    Ряд сходится $<==>$ выполнено условие
    $
      (forall epsilon > 0)(exists N in NN)(forall n > N)(forall p in NN)(abs(a_(n+1) + a_(n+2) + dots + a_(n+p)) < epsilon)
    $
  ],
  [
    - ($arrow.double.l$). Заметим, что
    $
      a_(n+1) + a_(n+2) + dots + a_(n+p) = S_p - S_n
    $
    то есть
    $
      abs(S_p -S_n) < epsilon
    $
    а значит, последовательность ${S_n}$ фундаметальна, откуда $lim {S_n} = S in RR$, ряд сходится по определению
    - ($=>$). Предположим, что ряд сходится, но второе условие не выполняется, тогда
    $
      (exists e > 0)(forall N in NN)(exists n > N)(exists p in NN)(abs(S_p - S_n) > epsilon)
    $
    то есть, критерий Коши (для фундаментальных последовательностей) не выполняется, а значит ${S_n}$ не имеет конечного предела $==>$ ряд расходится по определению
  ],
)



#notes-sub([Дискретная производная или конечная разность], pgbreak: true)

По определению производной
$
  f'(x) = limits(lim)_(h->0) (f(x + h) - f(x))/h
$

#fun-fact-headered(
  [
    Конечная разность
  ],
  [
    Пусть последовательность задается как
    $
      a_k = f(k), quad k in NN
    $
    тогда конечная разность для такой функции будет равна
    $
      Delta f(x) = f(x + 1) - f(x)
    $
    Так например рассмотрим конечные разности для некоторых функций:
    $
      & Delta 1 = 1- 1 = 0 quad(=f') \
      & Delta x = x+1 - x = 1 quad (=f') \
      & Delta x^2 = (x + 1)^2 - x^2 = 2x + 1 quad (!= f')
    $
    до какого-то момента даже совпадало с производными (эх, только до $f(x) = x$)
  ],
)

#def(
  [Убывающая факториальная степень],
  [
    для $m in NN$, по сути просто обозначение:
    $
      x^underline(m) = x dot (x-1) dot (x-2) dot dots dot (x-m + 1)
    $
  ],
)

#theorem(
  [
    Для конечной разности и факториальной последовательности верно, что
    $
      Delta (x^underline(m)) = m dot x^underline(m-1)
    $
  ],
  [
    Распишем по определению:
    $
      & Delta (x^underline(m)) = (x + 1)(x)(x - 1) dots (x-m+2) - x(x-1)dots(x-m+1) = \
      & = x(x-1)dots(x-m + 2)(x+1 - x + m - 1) = m dot x(x-1)dots(x-m + 2) = \
      & = m dot x^underline(m-1)
    $
  ],
)

#def(
  [
    ХАЗЕ
  ],
  [
    снова обозначение ($m in NN$):
    $
      x^underline(-m) = 1/(x(x+1)dots(x+m-1))
    $
  ],
)

#theor-state(
  [Также имеет место аналогичное утверждение $ Delta (x^underline(-m)) = -m dot x^underline(-m+1) $],
)

#fun-fact-headered(
  [Свойства дискретной производной],
  [
    + $Delta (c dot f(x)) = c dot Delta f(x) quad (c in RR)$
    + $Delta (f(x) + g(x)) = Delta f(x) + Delta g(x)$
    + $Delta (f(x) dot g(x)) = Delta (f(x)) dot g(x) + f(x) dot Delta (g(x))$ (доказать в качестве упраженения)

  ],
)

Итак, к конечному суммированию. Рассмотрим сумму
$
  S = limits(sum)_(x=1)^n Delta f(x) = (f(2) - f(1)) + (f(3) - f(2)) + dots + (f(n+1) - f(n))
$
легко заметить, что это телескопическая сумма, а значит
$
  S = f(n+1) - f(1) = lr(f(x)|^(n+1)_1)
$

#theorem(
  name: [Дискретная формула Ньютона-Лейбница],
  [
    $
      limits(sum)_(x=a)^(b-1) Delta f(x) = f(x)lr(|)^b_a
    $
  ],
  [
    Как-то потом
  ],
)

#fun-fact-headered(
  [Обозначение Д. Кнута],
  [
    $ display(limits(sum)_a^(b-1) = underbracket((sum)_a^b, "блять да как")) $
  ],
)

#notes-sub([Некоторые дикретные производные и первообразные], pgbreak: true)

+ $f(x) = 2^x$:\
  $Delta 2^x = 2^(x+1) - 2^x = 2^x ==> display(sum) 2^x = 2^x + C$

+ $f(x) = a^x quad (a!= 1)$:\
  $Delta a^x = a^(x+1) - a^x = a^x (a-1) ==> display(sum)a^x = display(a^x/(a-1)) + C$

+ $f(x) = H_x$ (гармонические числа):\
  $Delta H_x = H_(x+1) - H_x = display(1/(x+1)) ==> display(sum 1/(x+1)) = H_x + C$

+ Числа Фибоначи:\
  $Delta F_x = F_(x+1) - F_x = F_(x-1) ==> display(sum F_x) = F_(x+1) + C$

#notes-sub([Дискретная формула Тейлора], pgbreak: true)
В чем задача? Очень хочется считать суммы вида
$
  limits(sum)_(x=a)^(b-1) x^m
$
Для простых советских функции верно, что
$
  f(x) approx limits(sum)_(k=0)^n (f^((k))(0))/k! x^k
$
Но это всё лирика, теперь к делу. Формула без доказательства:
$
  f(n) = limits(sum)_(k=0)^n ((Delta^k f)(0))/k! n^underline(k)
$
А для полиномов
$
  P_m (n) = limits(sum)_(k=0)^m ((Delta^k P_m) (0))/k! n^underline(k) quad "здесь до" m, "т.к. дальше" Delta^k = 0
$

Пример.\
$f(n) = n^2$

+ $f(0) = 0 quad (Delta^0 f)(0) = 0$

+ $f(1) = 1 quad (Delta^1 f)(0) = f(1) - f(0) = 1$

+ $f(2) = 4 quad (Delta^2 f)(0) = dots = 3$

+ $f(3) = 9 quad (Delta^3 f)(0) = dots = 0$

Итого:
$
  & f(n) = ((Delta^0 f)(0))/0! n^underline(0) + ((Delta^1 f)(0))/1! n^underline(1) + ((Delta^2 f)(0))/2! n^underline(2) = \
  & = 0 +n^underline(1) + n^underline(2) = n + n(n-1) = n + n^2 - n = n^2
$

Удобный способ записи конечных разностей
#table(
  columns: 5,
  inset: 10pt,
  align: center + horizon,
  $n$, $Delta^0f=f$, $Delta^1 f$, $Delta^2 f$, $Delta^3 f$,
  $0$, $f(0)$, $f(1) - f(0)$, $f(2) - f(1)$, $f(3) - f(2)$,
  $1$, $f(1)$, $f(2) - f(1)$, $f(3) - f(1)$, $f(4)- f(2)$,
  $dots$, $f(dots)$, $dots$, $dots$, $dots$,
  $n$, $f(n)$, $-$, $-$, $-$,
)

#fun-fact-headered(
  [Сумма кубов],
  [
    #table(
      columns: 5,
      inset: 10pt,
      align: center + horizon,
      $n$, $n^3$, $Delta^1 f$, $Delta^2 f$, $Delta^3 f$,
      $0$, $0$, $1$, $6$, $6$,
      $1$, $1$, $7$, $12$, $6$,
      $2$, $8$, $19$, $18$, $-$,
      $3$, $27$, $37$, $-$, $-$,
      $4$, $64$, $-$, $-$, $-$,
    )
    блаблабла
  ],
)

#theorem(
  name: [Теорема Абеля],
  [
    Дискретное суммирование по частям:
    $
      sum u(x) Delta v(x) = u(x) dot v(x) - sum Delta u(x) dot v(x + 1)
    $
  ],
  [],
)


#notes-header([Функциональные последовательности и ряды], pgbreak: true)

// Пусть на множестве $X subset RR$ определена последовательность ${f_n(x)}_(n in NN)$

#def(
  [
    Поточечная сходимость
  ],
  [
    последовательность ${f_n (x)}_(n in NN)$ поточечно сходится к $f(x)$ на $X$, если
    $
      (forall x_0 in X)(forall epsilon > 0)(exists N(epsilon, x_0) in NN)(forall n > N(epsilon, x_0))(abs(f_n (x_0) - f(x_0)) < epsilon)
    $
    ну а если по-человечески, в каждой точке области определения последовательность функций сходится к $f(x)$
  ],
)

#def(
  [Равномерная сходимость (по Коши)],
  [
    последовательность ${f_n (x)}_(n in NN)$ равномерно сходится к $f(x)$ на $X$, если
    $
      (forall epsilon > 0)(exists N(epsilon) in NN)(forall x_0 in X)(abs(f_n (x) - f(x)) < epsilon)
    $
    Обозначение:
    $
      f_n (x) arrows_(n->oo) f(x)
    $
    (я бы еще $n->oo$ опускал... хаха я же буду)
  ],
)

Очевидно, второе определение сильнее (из него очень сильно следует первое), да и удобнее --- для всех $x_0 in X$ номер $N$ зависит только от $epsilon$, а значит един для всего $X$

#theorem(
  name: [Критерий равномерной сходимости через $sup$],
  [
    Обозначим $ rho_n = sup_(x in XX) abs(f_n(x) f(x)) $ тогда
    $
      f_n (x) arrows f(x) <==> rho_n -> 0
    $
  ],
  [
    а без доказательства (оно очевидное)
  ],
)

#theorem(
  name: [Критерий Коши равномерной сходимости],
  [
    Следующие выражения эквивалентны:
    - $f_n (x) arrows f(x)$

    - $(forall epsilon > 0)(exists N(epsilon) in NN)(forall n > N(epsilon))(forall p in NN)(forall x in X)(abs(f_(n + p) (x) - f_n (x)) < epsilon)$
  ],
  [
    - ($=>$). Воспользуемся неравнеством треугольника:
      #block(
        width: 100%,
        $
          cases(
            display(abs(f_(n + p) (x) - f(x)) < epsilon / 2),
            display(abs(f (x) - f_n (x)) < epsilon/2),
          )
        $,
      )
      (определение равномерной сходимости), откуда
      $
        abs(f_(n + p) - f_n) <= abs(f_(n + p) (x) - f(x)) + abs(f (x) - f_n (x)) < epsilon/2 dot 2 = epsilon
      $
    - ($arrow.double.l$). Пусть $x = x_0$. По предположению
      $
        abs(f_(n + p) (x_0) - f_n (x_0)) < epsilon/2
      $
      а значит, $f_n -> A = f(x_0)$ (обозначим в каждой точке такой предел как $f(x_0)$). Функция $f(x)$ (составленная из $f(x_0)$) --- поточечный предел ${f_n (x)}$, покажем, что ${f_n (x)}$ равномерно сходится к $f(x)$. В предыдущем неравенстве устремим $p$ к бесконечноти, то есть $n + p -> oo ==> f_(n + p) (x) -> f(x)$:
      $
        lim abs(f_(n + p) (x) - f_n (x)) = abs(f(x) - f_n (x)) <= epsilon/2 < epsilon
      $
  ],
)

#notes-sub([Функциональные ряды], pgbreak: true)
#def(
  [Функциональный ряд],
  [
    пусть на $X$ задана функциональная последовательность ${u_k (x)}$, тогда функциональным рядом называется следующая сумма:
    $
      limits(sum)_(k=1)^oo u_k (x) = u_1 (x) + u_2 (x) + dots
    $
  ],
)

#def(
  [Частная сумма],
  [конечная часть числового ряда _*(определение самодельное, предлагайте правки)*_: $ S_n (x) = limits(sum)_(k=1)^n u_k (x) $],
)

#def(
  [Поточечная сходимость (ряда)],
  [
    ряд сходится на $X$ поточечно, если соответствующие частные суммы сходятся на $X$ поточечено:
    $
      S_n (x) -> S(x)
    $
  ],
)

#def(
  [Равномерная сходимость (ряда)],
  [
    ряд сходится на $X$ равномерно, если соответствующие частные суммы сходятся на $X$ равномерно:
    $
      S_n (x) arrows S(x)
    $
  ],
)

#fun-fact(
  [
    Применив критерий Коши к частным суммам, можно доказать их сходимость, а значит и _ сходимость сооттветствующего функционального ряда._ Также можно его немного переформулировать:
    $
      abs(underbracket(S_(n + p) (x) - S_n, "часть суммы")) < epsilon
    $
    откуда
    $
      abs(limits(sum)_(k=n+1)^(n + p) u_k (x)) < epsilon
    $
    или
    $
      abs(limits(sum)_(k=n+1)^(n + p) u_k (x)) -> 0 "при произвольных" p, epsilon, "начиная с некоторого" n
    $
  ],
)

#notes-sub([Признаки равномерной сходимости функциональных рядов], pgbreak: true)

#theorem(
  name: [Признак сходимости Вейерштрасса],
  [
    Если $exists {a_k}$, такая что
    $
      cases(
        (forall x in X)(abs(u_k (x)) < a_k),
        display(limits(sum)_(k=1)^n a_k) "сходится"
      )
    $
    то
    $
      limits(sum)_(k=1)^n u_k (x) "сходится"
    $
  ],
  [
    Применим критерий Коши для числового ряда:
    $
      abs(a_(n + 1) + a_(n+2) + dots + a_(n + p)) = a_(n + 1) + a_(n+2) + dots + a_(n + p) < epsilon
    $
    а теперь неравенство треугольника
    $
      abs(u_(n + 1) (x) + u_(n+2) (x) + dots + u_(n + p) (x)) <= abs(u_(n + 1) (x)) + abs(u_(n + 2) (x)) + dots + abs(u_(n + p) (x))
    $
    и оценку из условия
    $
      abs(u_(n + 1) (x)) + abs(u_(n + 2) (x)) + dots + abs(u_(n + p) (x)) < a_(n + 1) + a_(n+2) + dots + a_(n + p) < epsilon
    $
    откуда
    $
      abs(u_(n + 1) (x) + u_(n+2) (x) + dots + u_(n + p) (x)) < epsilon
    $
    а по критерию Коши для функциональных рядов, отсюда следует, что
    $
      limits(sum)_(k=1)^n u_k (x) "сходится"
    $
  ],
)

#theor-state(
  name: [Признак сходимости Дирихле],
  [
    Ряд вида
    $
      limits(sum)_(k=1)^oo f_k (x) dot g_k (x)
    $
    сходится, если
    - $(exists M > 0)(forall k in NN)(forall x in X)(abs(f_k (x)) < M)$

    - $g_k$ монотонны

    - $g_k (x) arrows 0 "на" x in X$

  ],
)

#theor-state(
  name: [Признак Абеля],
  [
    потом
  ],
)

#notes-header([Ряды Фурье], pgbreak: true)
#notes-sub([Полезные определения])

#def(
  [Евклидово функциональное пространство],
  [
    пространство функций $E$, определенных на $[a, b]$ с опредленной на нем операцией скалярного произведения
  ],
)

#fun-fact(
  [ПОЧЕМУ ОНА ГДЕ-ТО ПИШЕТ $norm(dot)_2$ (ЗАЧЕМ 2)],
)

#fun-fact(
  $
    (f, g) = limits(integral)_a^b f(x) dot g(x) dif x quad f, g in L_2[a, b] \
    norm(f) = sqrt((f, f))
  $,
)

#theorem(
  name: [Теорема (КБШ)],
  [
    Базовое неравенство
    $
      (f, g) <= norm(f) dot norm(g)
    $
  ],
  [
    Распишем по определению
    $
      limits(integral)_a^b f(x) dot g(x) dif x <= limits(integral)_a^b f(x) dif x dot limits(integral)_a^b g(x) dif x
    $
    при этом для произвольного $phi$ справедливо
    $$$$
  ],
)

#def(
  [Гильбертово пространство],
  [
    полное по норме евклидово пространство (любая фундаментальная последовательность функций сходится)
  ],
)

#def(
  [Ортогональная система функций],
  [
    ${phi_n}_(n=1)^oo$, такая что
    $
      (forall n, m in NN)(n != m ==>(phi_n, phi_m) = 0)
    $
    Если
    $
      (forall n in NN)(norm(phi_n) =1)
    $
    то система называется *ортонормированной*
  ],
)

#notes-sub([Ряды и коэффициенты Фурье], pgbreak: true)

#def(
  [Коэффициенты Фурье],
  [
    для ортогональной системы ${phi_n}$ и функции $f in L_2[a,b]$ значения
    $
      c_n = ((f, phi_n))/norm(phi_n)^2
    $
  ],
)

Попробуем приблизить $f in L_2[a, b]$ суммой $display(limits(sum)_(n=1)^N alpha_n phi_n (x))$, где ${phi_n}$ --- отогональная система, $alpha_n in RR$. Погрешностью приближения назовем квадрат нормы:
$
  delta_N = norm(f - limits(sum)_(n=1)^n alpha_n phi_n (x))^2
$

#theorem(
  name: [Теорема об экстремалных свойствах коэффициентов Фурье],
  [
    $delta_N$ достигает своего минимума $<==> alpha_n = c_n$
  ],
  [
    Обозначим
    $
      S_N (x) = limits(sum)_(n=1)^N alpha_n phi_n (x)
    $
    тогда
    $
      delta_N = (f - S_N, f - S_N) = norm(f)^2 - 2(f, S_N) + (S_N, S_N)
    $
    из ортогональности ${phi_n}$ и свойств скалярного произведения:
    $
      delta_N = norm(f)^2 - 2 limits(sum)_(n=1)^N alpha_n (f, phi_n) + limits(sum)_(n=1)^N alpha^2_n norm(phi_n)^2
    $
    из определения $c_n$:
    $
      c_n = ((f, phi_n))/norm(phi_n)^2 ==> (f, phi_n) = c_n norm(phi_n)^2
    $
    тогда
    $
      delta_N = norm(f)^2 + limits(sum)_(n=1)^N (alpha_n norm(phi_n))^2 - limits(sum)_(n=1)^N 2alpha_n norm(phi_n) dot c_n norm(phi_n) + limits(sum)_(n=1)^N (c_n norm(phi_n))^2 - limits(sum)_(n=1)^N (c_n norm(phi_n))^2
    $
    финт ушами:
    $
      delta_N = underbracket(norm(f)^2 - limits(sum)_(n=1)^N (c^2_n norm(phi_n))^2, = const) + underbracket(limits(sum)_(n=1)^N (alpha_n - c_n)^2 norm(phi_n), min "при" alpha_n=c_n)
    $
  ],
)

#theorem(
  name: [Неравенство Бесселя],
  [
    $
      norm(f)^2 >= limits(sum)_(n=1)^N c^2_n norm(phi_n)^2
    $
  ],
  [
    следует из определения $delta_N$ и преобразований в доказательстве прошлой теоремы:
    $
      delta_N >=0, quad delta_N = norm(f)^2 - limits(sum)_(n=1)^N (c^2_n norm(phi_n))^2
    $
    то есть
    $
      norm(f)^2 - limits(sum)_(n=1)^N (c^2_n norm(phi_n))^2 >= 0
    $
    равносильно
    $
      norm(f)^2 >= limits(sum)_(n=1)^N (c^2_n norm(phi_n))^2
    $
  ],
)

#def(
  [Ряд Фурье],
  [
    рядом Фурье функции $f in L_2[a,b]$ по ортогональной системе ${phi_n}$ называется формальный ряд
    $
      f(x) ~ limits(sum)_(n=1)^oo c_n dot phi_n (x)
    $
    где $c_n$ --- коэффициенты Фурье
  ],
)

#def(
  [Замкнутая ортогональная система],
  [
    ортогональная система ${phi_n}$, в которой
    $
      (forall f in L^2[a, b])(underbracket(norm(f)^2 = limits(sum)_(n=1)^oo c^2_n norm(phi_n)^2, "равенство Парсеваля"))
    $
  ],
)
#def(
  [Полная ортогональная система],
  [
    ортогональная система ${phi_n}$, в которой
    $
      (forall n in NN)((f, phi_n) = 0 ==> norm(f) = 0 #h(0.2em) (<==> f ~ 0))
    $
  ],
)

#theorem(
  name: [Теорема Стеклова об эквивалентности замкнутости и полноты системы],
  [
    Система замкнута $<==>$ она полная
  ],
  [
    - ($=>$). Пусть $f$ попарно ортогональна со всеми $phi_n$, тогда для $f$
      #block(
        width: 100%,
        $
          (forall n in NN)(c_n = 0)
        $,
      )
      подставим в равенство Парсеваля, конец:
      $
        norm(f) = limits(sum)_(n=1)^oo c^2_n norm(phi_n)^2= limits(sum)_(n=1)^oo 0 dot norm(phi_n)^2 = 0
      $
    - ($arrow.double.l$). Обозначим (по сути $R_N = delta_N$)
      $
        R_N (x) = f(x) - limits(sum)_(n=1)^N c_n phi_n (x)
      $
      уже дважды использовался факт
      $
        norm(delta_N)^2 = norm(R_N)^2 = norm(f)^2 - limits(sum)_(n=1)^N c^2_n norm(phi_n)^2
      $
      если $norm(R_N)^2 -->_(N->oo) A != 0$, то получается, что $f$ ортогональна всем $phi_n$, но система полна, а значит такого быть не может, поэтому
      $
        lim_(N->oo) norm(R_N)^2 = 0
      $
      а значит переходя к пределу получаем то, что нужно
      $
        norm(f)^2 - limits(sum)_(n=1)^oo c^2_n norm(phi_n) = 0 <==> norm(f)^2 = limits(sum)_(n=1)^oo c^2_n norm(phi_n)
      $
  ],
)

// #notes-sub([Ортогонализация Грама-Шмидта], pgbreak: true)
// Работает полностью аналогично ортогонализации базиса

#notes-sub([Поточечная сходимость рядов Фурье], pgbreak: true)
Мы уже знаем, что по норме ряд Фурье сходится к $f$:
$
  lim_(N->oo) norm(f-S_N) = 0
$

Теперь захотелось рассмотреть сходимость в каждой точке.

Почему-то известно, что
$
  & a_0 = 1/pi dot limits(integral)_(-pi)^pi f(x) dif x \
  & a_n = 1/pi dot limits(integral)_(-pi)^pi f(x) dot cos (n x) dif x \
  & b_n = 1/pi dot limits(integral)_(-pi)^pi f(x) dot sin (n x) dif x \
$
в таком случае
$
  f(x) ~ a_0/2 + limits(sum)_(n=1)^oo a_n cos (n x) + b_n sin (n x)
$
и дискретный вариант:
$
  S_N (x) = a_0/2 + limits(sum)_(n=1)^N a_n cos (n x) + b_n sin (n x)
$
подставим $a_n$ и $b_n$:
$
  S_N (x) = 1/(2pi) dot limits(integral)_(-pi)^pi f(t) dif t + limits(sum)_(n=1)^N (1/pi dot limits(integral)_(-pi)^pi (f(t) dot cos (n t) dif t) dot cos (n x) + 1/pi dot limits(integral)_(-pi)^pi (f(t) dot sin (n t) dif t) dot sin (n x))
$
туда-сюда и получается
$
  S_N (x) = 1/pi dot limits(integral)_(-pi)^pi f(t) dot (1/2 + limits(sum)_(n=1)^N cos (n (t-x))) dif t
$

#def(
  [Ядро Дирихле],
  [
    функция на $[-pi, pi]$:
    $
      D_N (u) = 1/2 + limits(sum)_(n=1)^N cos (n u)
    $
  ],
)
Из хитрого определения ядра Дирихле:
$
  S_N (x) = 1/pi dot limits(integral)_(-pi)^pi f(t) dot D_N (x-t) dif t
$

#theorem(
  [
    Для $u!= 2pi k quad k = 0, 1, 2, dots$ справедливо равенство
    $
      D_N (u) = (sin ((N + 1/2) u))/(2 sin u/2)
    $
  ],
  [
    Просто домножим на знаменатель:
    $
      & 2 sin u/2 dot D_N (u) = sin u/2 + 2 dot limits(sum)_(n=1)^N sin u/2 dot cos (n u) = \
      & sin u/2 + limits(limits(sum))_(n=1)^N sin ((n + 1/2) u) - sin ((n-1/2)u) = \
      & sin u/2 + sin ((N + 1/2) u) - sin u/2 = sin ((N + 1/2) u)
    $
    теперь достаточно обратно поделить:
    $
      D_N (u) = (sin ((N + 1/2) u))/(2 sin u/2)
    $
  ],
)

#fun-fact-headered(
  [Свойства $D_N$],
  [
    + $lim_(u->0) D_N (u) = N + 1/2$
    + Нормировка:
      #block(
        width: 100%,
        $
          1/pi dot limits(integral)_(-pi)^pi D_N (x) dif x = 1
        $,
      )
      проверим:
      $
        & 1/pi dot limits(integral)_(-pi)^pi (1/2 + limits(sum)_(n=1)^N cos (n x))dif x = 1/pi dot limits(integral)_(-pi)^pi 1/2 dif x + limits(sum)_(n=1)^N (underbracket(limits(integral)_(-pi)^pi cos (n x) dif x, =0)) = 1/(2pi) dot 2 pi = 1
      $
    + Четность и $2pi$-периодичность:
      $
        D_N (-u) = D_N (u)
      $
    + Интеграл от модуля ядра на бесконечности ведет себя как $ln N$
  ],
)

#theorem(
  name: [Лемма Римана-Лебега],
  [
    Для $g(t) in R[a, b]$, тогда
    $
      lim_(lambda -> + oo) limits(integral)_a^b g(t) sin (lambda t) dif t = 0
    $
    и
    $
      lim_(lambda -> + oo) limits(integral)_a^b g(t) cos (lambda t) dif t = 0
    $
  ],
  [
    Рассмотрим 3 случая:
    - $g(t) = C$, тогда
    $
      abs(limits(integral)_a^b C dot sin (lambda t) dif t) = lr((abs(C)/lambda abs(-cos (lambda t))) |)_a^b = abs(C)/lambda dot abs(cos (a lambda) - cos (b lambda)) -->_(lambda -> +oo) 0
    $
    - $g(t)$ --- ступенчатая на $[a, b]$, тогда интеграл превращается в конечную сумму интегралов от констант, а значит стремится к $0$ (см. п. 1)
    - Все остальное. Из интегрируемости по Риману следует
      $
        exists phi (t) quad "(ступенчатая)"
      $
      такая, что
      $
        limits(integral)_a^b abs(g(t) - phi(t)) dif t < epsilon/2
      $
      $dots$
  ],
)

#theorem(
  name: [Принцип локализации Римана],
  [
    $f in R[a, b], x_0 in [-pi, pi]$. При $N -> +oo$, $S_N (x_0)$ зависит только от поведения $f(x)$ на сколь угодно малой $delta$ окрестности точки $x_0$
  ],
  [
    Пусть $delta > 0$ и достаточно мало, тогда
    $
      & S_N (x_0) = 1/pi limits(integral)_(-pi)^pi f(t) dot D_N (t - x_0) dif t = \
      & = 1/pi limits(integral)_(-pi)^pi f(u + x_0) dot D_N (u) dif u = \
      & = 1/pi limits(integral)_(-delta)^delta (f(x_0 + u) dot D_N (u)) dif u + underbracket((limits(integral)_(-pi)^(-delta) + limits(integral)_delta^pi)(f(x_0 + u) dot D_N (u) dif u), ->0) =\
    $
    а значит
    $
      lim_(N -> +oo) S_N (x_0) = lim_(N -> +oo) (1/pi limits(integral)_(-delta)^delta (f(x_0 + u) dot D_N (u)) dif u)
    $
  ],
)

#theorem(
  name: [Признак Дини (для поточечной сходимости)],
  [
    Пусть $f(x)$ --- $2pi$-периодичная функция, $x_0 in [-pi, pi]$, тогда ряд Фурье сходится исходному тогда и только тогда, когда сходится интеграл
    $
      limits(integral)_0^delta abs(f(x_0 + u) + f(x_0 - u) - 2S)/u dif u
    $
  ],
  [gegege],
)

#def(
  [Липшицева функция],
  [
    функция назвается Липшицевой порядка $alpha$\ ($0 < alpha <= 1$) в точке $x_0$, если
    $
      (exists L, delta > 0)(forall abs(u) < delta)(abs(f(x_0 + u) - f(x_0)) <= L dot abs(u)^alpha)
    $
  ],
)

#theorem(
  name: [Признак Липшица],
  [
    Пусть $f$ липшицева в точке $x_0$, тогда
    $
      lim_(N-> +oo) S_N (x_0) = f(x_0)
    $
  ],
  [
    Пусть $S = f(x_0)$, проверим признак Дини:
    $
      abs(f(x_0 + u) - f(x_0 - u) - 2S)/u <= abs(f(x_0 + u) - f(x_0))/u + abs(f(x_0 - u) - f(x_0))/u = (*)
    $
    из липшицевости функции:
    $
      (*) <= (L u^alpha)/u + (L u^alpha)/u = 2L u^(alpha-1)
    $
    проинтегрируем:
    $
      limits(integral)_0^delta 2L u^(alpha - 1) dif u = (2L)/alpha dot delta^alpha
    $
    он сходится, а интеграл исходного уравнения не больше, чем полученный, значит сходится и он, то есть ряд Фурье сходится к $f$ (по Дини)
  ],
)

#notes-sub([Сходимость в точках разрыва], pgbreak: true)

#theorem(
  [Пусть $x_0$ --- точка разрыва 1-го рода ($f$) пусть существуют односторонние пределы и производные, тогда $ S_N (x) -->_(N->+oo) (f(x_0 + 0) + f(x_0 - 0))/2 $ ],
  [
    gegege
  ],
)

#fun-fact-headered(
  [Явление (эффект) Гиббса],
  [
    Возле точки разрыва всегда немножко *торчит* (колебания сжимаются к целевой функции на промежутках непрерывности), то есть есть _ неуменьшаемый _ экстремум, который потом обычно "пересекает нужную функцию"
  ],
)

#notes-sub([Связь хороших свойств функций и сходимости соответствующих рядов Фурье], pgbreak: true)

#theorem(
  [Пусть $f$ гладкая настолько, что $ exists f^((m)) (x) quad "и" quad f in C^((m-1)) [-pi, pi] $ тогда
    $
      & a_n = o(1/n^m) \
      & b_n = o(1/n^m)
    $ ],
  [],
)

#pagebreak()

$L_2^CC [a, b]$ --- комплекснозначные функции, интегрируемые на $[a, b]$.

Скалярное произведение в таком пространстве определяется как
$
  (f, g) = limits(integral)_a^b f(x) dot overline(g(x)) dif x
$

#fun-fact-headered(
  [Свойства (f, g)],
  [
    + Кососимметричность:
      #block(
        width: 100%,
        $
          (f, g) = overline((g, f))
        $,
      )
    + Линейность по 1-му аргументу:
      $
        (alpha f + beta h, g) = alpha dot (f, g) + beta dot (h, g)
      $
    + Полулинейность по 2-му аргументу:
      $
        (f, alpha g) = overline(alpha) dot (f, g)
      $
    + Положительноопределнность нормы:
      $
        norm(f)^2 = (f, f) = limits(integral)_a^b f dot overline(f) dif x= limits(integral)_a^b abs(f(x))^2 dif x >= 0
      $
  ],
)

#notes-sub([Комплексные коэффициенты Фурье], pgbreak: true)

#fun-fact(
  [
    $
      c_n = 1/(2pi) limits(integral)_a^b f(x) dot e^(i n x) dif x = ((f, e^(i n x)))/norm(e^(i n x))^2
    $
  ],
)

Ну и еще один фактик

$
  f(x) ~ limits(sum)_(-oo)^(+oo) = c_n dot e^(i n x) = c_0 + limits(sum)_(n=1)^oo (c_n dot e^(i n x) + c(-n) dot e(-i n x))
$

