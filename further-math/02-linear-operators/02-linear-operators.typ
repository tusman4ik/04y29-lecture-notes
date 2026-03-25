#import "../../typst-lib/main.typ": *

#set text(size: 14pt)

#notes-header([Линейный оператор. Матрица линейного оператора])

#def(
  [Оператор],
  [
    отображение $cal(A) : L_1 -> L_2$, где $L_1, L_2$ --- линейные пространства.

    Обозначения:
    - $cal(A), cal(B), cal(C), dots$ --- операторы
    - $A, B, C, dots$ --- матрицы операторов
  ],
)

#def(
  [Линейный оператор],
  [
    оператор $cal(A): V -> W$ ($V, W$ --- линейные пространства над полем $F$), для которого верны следующие свойства ($x, y in V, alpha in F$):
    - Аддитивность: $cal(A)(x + y) = cal(A)(x) + cal(A)(y)$
    - Однородность: $cal(A)(alpha x) = alpha dot cal(A)(x)$
    Или, что эквивалентно, должно быть верным равенство
    $
      cal(A)(alpha x + beta y) = alpha dot cal(A)(x) + beta dot cal(B)(y)
    $
  ],
)

#fun-fact(
  [С этого момента слово "оператор" должно быть заменено на "линейный оператор" (в голове, документ менять не обязательно)],
)

#def(
  [Линейное преобразование (пр-ва $V$)],
  [
    линейный оператор\ $cal(A): V -> V$
  ],
)

#fun-fact-headered(
  [Примеры ЛО],
  [
    - *Нулевой* ($cal(O): V -> W$) --- $cal(O)(x_V) = altvct(0)_W$
    - *Тождественный* ($cal(I) : V -> V$) --- $cal(I)(x_V) = x_V$
    - *Оператор проецирования (проектор)*:\
      Пусть $V = L_1 plus.o L_2$, тогда если $x in V, x_1 in L_1, x_2 in L_2$, то\ $x = x_1 + x_2$. Тогда _ проектор _ обозначаенный $cal(P)_(L_1)^(parallel L_2)$ будет проецировать $x in V$ на подпространство $L_1$ параллельно подпространству $L_2$. Проектор $cal(P)_(L_1)^(perp L_2)$ будет проецировать $x in V$ на подпространство $L_1$ перпендикулярно $L_2$
    - *Оператор дифференцирования* ($cal(D) : P[x]_n -> P[x]_(n-1)$):\
      Отображение введено как пример (это пространства многочленов степени не выше $n$ и $n-1$ соответственно). Отображение невероятно нетривиально:
      $
        & cal(D)(a_n x^n + a_(n-1)x^(n-1)+dots + a_1 x + a_0) = \
        & a_n n x^(n-1) + a_(n-1)(n-1)x^(n-2) + dots + a_1
      $
    - *Оператор интегрирования* ($cal(S) : C[a, b] -> RR$ --- опять как пример):\
      $C[a, b]$ --- пространство функций, непрерывных на $[a,b]$. Скажем что $forall f(x) in C[a, b]$
      $
        cal(S)(f(x)) = limits(integral)_a^b f(x) dif x
      $
    - *Какой-то матричный* ($cal(A) : M_p -> M_p$):\
      $M_p$ --- пространство квадратных матриц $p times p$. Определим\ $forall X in M_p$ и произвольной (но фиксированной) $A in M_p$
      $
        cal(A)(X) = A dot X
      $
      по свойствам произведения матриц
      $
        & cal(A)(alpha X + beta Y) = A dot (alpha X + beta Y) = A dot alpha X + A dot beta Y = \
        & alpha (A dot X) + beta (A dot Y) = alpha dot cal(A)(X) + beta dot cal(A)(Y)
      $
    - *Оператор поворота* ($R_phi : V -> V$) --- поворачивает пространство на угол $phi$ (что бы это не значило)
  ],
)

#notes-sub([Матрица линейного оператора], pgbreak: true)
Рассмотрим $cal(A) : V -> W$, где
- ${e_i}_(i=1)^n$ --- базис $V$

- ${u_i}_(i=1)^m$ --- базис $W$
Пусть $A$ --- матрица ЛО $cal(A)$. Воздействуем оператором $cal(A)$ на каждый вектор из базиса $V$:
$
  & cal(A)(e_1) = alpha_11 u_1 + alpha_12 u_2 + dots + alpha_(1m) u_m \
  & cal(A)(e_2) = alpha_21 u_1 + alpha_22 u_2 + dots + alpha_(2m) u_m \
  & dots \
  & cal(A)(e_n) = alpha_(n 1) u_1 + alpha_(n 2) u_2 + dots + alpha_(n m) u_m \
$
Рассмотрим теперь матрицу:
$
  A = mat(
    alpha_11, alpha_21, dots.c, alpha_(n 1);
    alpha_12, alpha_22, dots.c, alpha_(n 2);
    dots;
    alpha_(1 m), alpha_(2 m), dots.c, alpha_(n m)
  )
$
это матрица перехода $A_(e -> u)$ (из базиса $e$ в базис $u$)

#def(
  [Матрица перехода],
  [
    матрицей перехода из базиса $e$ в базис $u$ ($A_(e -> u) "или" A_e^u$) называется матрица, столбцы которой являются координатами базисных векторов $e_i$ в базисе $u$
  ],
)

#fun-fact-headered(
  [Свойства матрицы ЛО],
  [
    - $(forall cal(A) : V -> V)(forall x in V)(forall alpha in F)$
      + $(cal(A)(x))_e = A_e x$
      + Матрица единичного (нулевого) оператора --- единичная (нулевая) матрица
      + Матрица суммы ЛО равна сумме матриц этих операторов
      + $alpha cal(A) = alpha dot A x$
      + $cal(A compose B)(x) = (A dot B) x$
      + Пусть матрицы перехода между базисами обозначены $P_(e -> u), P_(u -> e)$, тогда $ A_u = P_(u -> e) dot A_e dot P_(e -> u) ==> P_(e -> u) A_u = A_e dot P_(e->u) $
      + Определитель и ранг не зависят от базиса
  ],
)

#theorem(
  [Задание ЛО равносильно заданию его матрицы в фиксированной паре базисов],
  [
    TBD
  ],
)

#def(
  [Оператор поворота],
  [
    любой вектор в $RR^2$ можно задать как пару $(r, phi)$, где $x = (r cos phi, r sin phi)$. Чтобы повернуть его на угол $theta$ достаточно _ слева _ умножить этот вектор на матрицу
    $
      R_theta =
      mat(
        cos theta, -sin theta;
        sin theta, cos theta
      )
    $
    Посчитав, можно проверить что
    $
      R_theta dot vec(x_1, x_2) = mat(
        cos theta, -sin theta;
        sin theta, cos theta
      ) dot vec(r cos phi, r sin phi) = vec(r cos(phi + theta), r sin (phi + theta))
    $
  ],
)

#notes-sub([Ядро и образ оператора], pgbreak: true)
#def(
  [Ядро],
  [
    для оператора $cal(A) : V -> W$ ядром будет называться множество $ker cal(A) subset.eq V$:
    $
      ker cal(A) = {x in V | cal(A)(x) = altvct(0)_W}
    $
  ],
)
#def(
  [Образ],
  [
    для оператора $cal(A) : V -> W$ образом будет называться $op("Im") cal(A) subset.eq W$:
    $
      op("Im") cal(A) = {y in W | exists x in V : cal(A)(x) = y}
    $
  ],
)

#theorem(
  [
    Если есть линейный оператор $cal(A) : V -> W$, то
    + $ker cal(A)$ --- подпространство $V$
    + $op("Im") cal(A)$ --- подпространство $W$
  ],
  [
    сам-но (что же она имела в виду?)
  ],
)

#def(
  [Дефект оператора],
  [
    дефектом оператора $cal(A) : V -> W$ называется размерность его ядра:
    $
      op("def") cal(A) = dim (ker cal(A))
    $
  ],
)
#def(
  [Ранг оператора],
  [
    рангом оператора $cal(A) : V -> W$ называется размерность его образа:
    $
      op("rank") cal(A) = dim (op("Im") cal(A))
    $
  ],
)

#theorem(
  [
    Если $V$ конечномерно и определен оператор $cal(A) : V -> W$, то $ dim V = op("rank") cal(A) + op("def") cal(A) $
  ],
  [
    Пусть $dim V = n, op("def") cal(A) = k$, $e = {e_1, e_2, dots, e_k}$ --- базис $ker cal(A)$. Дополним $e$ до базиса $V$:
    $
      e = {e_1, e_2, dots, e_k, e_(k+1), dots, e_n}
    $
    Докажем, что ${cal(A)(e_i) | i in [k+1, n]}$ --- базис $op("Im") cal(A)$.

    Пусть $y in W, y = cal(A)(x)$, разложим $x$ по базису $e$:
    $
      x = limits(sum)_(i = 1)^n x_i e_i
    $
    тогда
    $
      & y = cal(A)(limits(sum)_(i = 1)^n x_i e_i) = limits(sum)_(i= 1)^n cal(A)(x_i e_i) = \
      & limits(sum)_(i= 1)^n cal(A)(x_i) dot cal(A)(e_i) = limits(sum)_(i= 1)^n y_i cal(A)(e_i) = \
      & limits(sum)_(i = 1)^k y_i underbracket(cal(A)(e_i), 0 "(ядро)") + limits(sum)_(i = k + 1)^n y_i cal(A)(e_i) = \
      & altvct(0) + limits(sum)_(i = k + 1)^n y_i cal(A)(e_i) = limits(sum)_(i = k + 1)^n y_i cal(A)(e_i)
    $

    Докажем, что система векторов ${cal(A)(e_(k + 1)), dots, cal(A)(e_n)}$ ЛНЗ:

    Пусть
    $
      & y_(k + 1) cal(A)(e_(k + 1)) + y_(k + 2) cal(A)(e_(k + 2)) + dots + y_n cal(A)(e_(n)) = 0 \
      & cal(A)(y_(k + 1) e_(k + 1) + y_(k + 2) e_(k + 2) + dots + y_n e_n) = 0
    $
    тогда
    $
      v = y_(k + 1) e_(k + 1) + y_(k + 2) e_(k + 2) + dots + y_n e_n in ker cal(A)
    $
    разложим $v$ по $e$:
    $
      v = v_1 e_1 + v_2 e_2 + dots + v_k e_k
    $
    вычтем из первого определения второе:
    $
      underbracket(v_1 e_1 + v_2 e_2 + dots + v_k e_k, = v) - underbracket((y_(k + 1) e_(k + 1) + y_(k + 2) e_(k + 2) + dots + y_n e_n), =v) = 0
    $
    а из линейной независимости базиса $V$ имеем
    $
      v_1 = v_2 = dots =v_k = y_(k+1)=y_(k + 2) = dots= y_n = 0
    $
    а значит исходная система векторов так же ЛНЗ, то есть $ op("rank") cal(A) = dim(op("Im") cal(A)) = n - k $
    откуда следует, что
    $
      n = k + (n - k)<==> dim V = op("rank") cal(A) + op("def") cal(A)
    $
  ],
)


#theorem(
  [
    Пусть задан оператор $cal(A) : V -> W$, $x = (x_1, x_2, dots, x_n)^T in V$ и его образ $y = (y_1, y_2, dots, y_m)^T in W$, тогда
    $
      y = A_(e -> u) x
    $
  ],
  [
    Разложим $x$ и $y$ по базису
    $
      & x = limits(sum)_(i = 1)^n x_i e_i \
      & y = limits(sum)_(i = 1)^m y_i u_i
    $
    Рассмотрим
    $
      & y = cal(A)(x) = cal(A)(limits(sum)_(i = 1)^n x_i e_i) = limits(sum)_(i = 1)^n cal(A)(x_i e_i) = \
      & limits(sum)_(i = 1)^n cal(A)(x_i) dot cal(A)(e_i) = limits(sum)_(i = 1)^n cal(A)(x_i) dot (limits(sum)_(j = 1)^m a_(i j)u_i)
    $
  ],
)



#notes-header([Линейные операторы над евклидовыми пространствами], pgbreak: true)

Рассмотрим евклидово пространство над полем $CC$. Скалярное произведение определяется немного иначе (не как для $RR$), необходимо выполнение следующих свойств
+ $(lambda x, y) = lambda (x, y)$
+ $(x, lambda y) = compl(lambda)(x, y)$
+ $(x, y) = compl((y, x))$
+ $(x, x) > 0$

Введем такую операцию для  $CC^n$ или $x=vec(x_1, dots, x_n), y = vec(y_1, dots, y_n)$



#imp-formula(
  [#align(center, "Для таких векторов хорошо подходит") $ (x, y) = x^T compl(y) = limits(sum)_(i=1)^n x_i compl(y)_i $],
)

Несложно заметить, что при таком определении скалярного произведения для матрирцы Грама выполнено следующее свойство
$
  G^T = compl(G)
$

#notes-sub([Сравнение свойств (определений) для евклидовых пространств над $RR$ и $CC$], pgbreak: true)

#align(center, table(
  columns: 3,
  inset: 10pt,
  align: center,
  [#strong($E$)], [#strong($RR^n$)], [#strong($CC^n$)],
  $ (x, y) $, $ limits(sum)_(i=1)^n x_i y_i $, $ limits(sum)_(i=1)^n x_i compl(y)_i $,
  $ norm(x) $, $ limits(sum)_(i=1)^n x_i^2 = sqrt((x, x)) $, $ limits(sum)_(i=1)^n x_i dot compl(x)_i = sqrt((x, x)) $,
  $ phi $, $ arccos ((x, y))/(norm(x) dot norm(y)) $, [Не определен],
  $ x perp y $, $ (x, y) = 0 $, $ (x, y) = 0 $,
  [Матрица Грама], $ G^T = G $, $ G^T = compl(G) $,
))

#notes-sub([Сопряженный линейный оператор], pgbreak: true)

#def(
  [Сопряженный линейный оператор],
  [
    если $cal(A)$ --- ЛО в $E$, то $cal(A)^*$ будет называться сопряженным к нему, если
    $
      (forall x, y in E)((cal(A) x, y) = (x, cal(A)^* y))
    $
  ],
)
#fun-fact-headered(
  [Примеры],
  [
    + Тождественный оператор $cal(I)$ (очевидно почему)
    + Изометрический изоморфизм (оператор, сохраняющий скалярное произведение)
      $
        (x, y) = (cal(A) x, cal(A), y)
      $
      Сопряженным к такому оператору будет обратный --- $cal(A)^(-1)$:
      $
        (underbracket((cal(A)^(-1) cal(A)), =cal(I)) x, cal(A)^(-1)y) = (x, cal(A)^(-1) y)
      $
  ],
)


#theorem(
  [Для любого оператора $cal(A)$ в конечномерном евклидовом пространстве существует сопряженный оператор $cal(A)^*$],
  [
    Для вектора $x$ рассмотрим его разложение в ОНБ:
    $
      x = x_1 e_1 + x_2 e_2 + dots + x_n e_n
    $
    Пусть матрица ЛО в базисе ${e_i}$ выглядит так
    $
      A = mat(
        a_11, dots.c, a_(1 n);
        dots.v, dots.down, dots.v;
        a_(n 1), dots.c, a_(n n)
      )
    $
    Подействуем линейным оператором на вектор $x$:
    $
      cal(A) x = A dot x = mat(
        a_11, dots.c, a_(1 n);
        dots.v, dots.down, dots.v;
        a_(n 1), dots.c, a_(n n)
      ) dot vec(x_1, dots, x_n) = vec(limits(sum)_(k=1)^n a_(1 k) x_k, dots, limits(sum)_(k=1)^n a_(n k) x_k)
    $
    ДАЛЬШЕ КАКАЯ-ТО НЕАДЕКВАТНАЯ ШЛЯПА Л\*\*\*\*\* ПИСАЛА ПОД ПСИЛОЦИБИНОВЫМИ ГРИБАМИ
  ],
)
#theorem(
  [Если для оператора $cal(A)$ (в $E$) существует сопряженный к нему, то он единственный],
  [
    Пусть $cal(A)^*_1$ и $cal(A)^*_2$ --- сопряженные к $cal(A)$, тогда $forall x ,y in E$
    $
      & (cal(A) x, y) = (x, cal(A)^*_1 y) = (x, cal(A)^*_2 y) \
      & (x, cal(A)^*_1 y) - (x, cal(A)^*_2 y) = 0 \
      & (x, (cal(A)^*_1 - cal(A)^*_2)y) = 0
    $
    а по еще нигде по каким-то причинам не обозначаенном свойству из этого следует, что
    $
      cal(A)^*_1 - cal(A)^*_2 = cal(O) "(нулевой оператор)"
    $
    откуда $cal(A)^*_1 = cal(A)^*_2$
  ],
)

#theor-state(
  name: [Свойства сопряженного оператора],
  [
    Переход от $cal(A)$ к $cal(A)^*$ обладает следующими свойствами:
    + $(cal(A)^*)^* = cal(A)$
    + $(cal(A) + cal(B))^* = cal(A)^* + cal(B)^*$
    + $(lambda cal(A))^* = compl(lambda) dot cal(A)^*$
    + $(cal(A) dot cal(B))^* = cal(B)^* dot cal(A)^*$
  ],
)

#theor-state(
  name: [Утверждение 1],
  [
    Область значений ЛО $cal(A)$ является ядром сопряженного к нему ЛО $cal(A)^*$
  ],
)
#theor-state(
  name: [Утверждение 2],
  [
    Если $(forall x, y in E)((x, cal(A) y) = 0)$, то $cal(A) = cal(O)$
  ],
)


#notes-sub([Самосопряженные операторы], pgbreak: true)
#def(
  [Самосопряженный оператор],
  [ЛО $cal(A)$ называется самосопряженным, если (удивительно) $cal(A)^* = cal(A)$. Обозначается $tilde(cal(A))$],
)
Самые простые примеры самосопряженных ЛО --- $cal(I), cal(O)$ (тождественный и нулевой) $plus.minus$ понятно почему


#theor-state(
  name: [Утверждение 3],
  [
    Оператор $cal(A)$ --- самосопряженный $<==>$ его матрица в каждом ОНБ симметрическая
  ],
)


$dots.c$


#imp(["НЕ БУДЕМ БИТЬ ЗА ОПРЕДЕЛЕНИЯ"])



#notes-sub([Ортогональные операторы], pgbreak: true)

#def(
  [Ортогональный оператор],
  [
    ЛО $cal(A)$ в $E$ называется ортогональным (изометрическим), если $forall x, y in E$ сохраняется их скалярное произвеение:
    $
      (x, y) = (cal(A) x, cal(A) y)
    $
  ],
)
#fun-fact-headered(
  [Свойства ортогональных операторов],
  [
    + Сохраняет норму
    + Сохраняет угол (если он определен)
    + $$
  ],
)

#theor-state(
  name: [Утверждение 14],
  [
    Ортогональный оператор невырожденный
  ],
)

#theor-state(
  name: [Утверждение 15],
  [
    В ОНБ матрица ортогонального оператора ортогональна
  ],
)

#theor-state(
  [
    Ортогональный оператор невырожденный
  ],
)


#imp(["Всё, с операторами у нас всё. Это, конечно, далеко не всё, но..."])
