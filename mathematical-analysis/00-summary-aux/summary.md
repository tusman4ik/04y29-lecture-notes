##### Содержание
1. Несколько важных лемм
	1. Неравенство Бернулли
	2. Лемма о вложенных отрезках
	3. Лемма о конечном покрытии
	4. Лемма о предельной точке
2. Замечательные пределы
	1. Первый замечательный предел и его производные
	2. Второй замечательный предел и его производные
	3. Замечательные эквивалентности

---

# Несколько важных лемм

> **Неравенство Бернулли**
> 
> $$(1 + \alpha)^n \leq 1 + n\alpha ~~~~~~~~~~~~~~ \alpha \geq -1, n \in \mathbb{N} $$
> **Доказательство**
> 
> Докажем по индукции.
> 
> **База**. При $n = 1$ имеем $$(1 + \alpha)^1 = 1 + \alpha = 1 + 1 \times \alpha,$$
> то есть утверждение, очевидно, выполняется.
> 
> **Переход**. Пусть утверждение верно для $n = k$. Покажем, что в таком случае оно верно и для $n = k + 1$.
> По предположению, $$(1 + \alpha)^{k+1} = (1 + \alpha)^k \times (1 + \alpha) \geq (1 + k\alpha)(1 + \alpha) = 1 + (k + 1)\alpha + k\alpha^2 > 1 + (k + 1)\alpha,$$
> что и требовалось доказать.

> **Лемма о вложенных отрезках**
> 
> #TODO

> **Лемма о конечном покрытии**
> 
> #TODO 

> **Лемма о предельной точке**
> 
> #TODO

---
# Замечательные пределы

## Первый замечательный предел

> **Первый замечательный предел**
> 
> $$\lim\limits_{x \to 0} \frac{\sin x}{x} = 1$$
> **Доказательство**
> 
> Поскольку нас интересует поведение функции в некоторой окрестности точки $0$, положим $x \in \left(\frac{-\pi}{2}, \frac{\pi}{2} \right)$. Заметим также, что и синус, и линейная функция нечётны — это значит, что их отношение чётно — и положим $x \in \left( 0, \frac{\pi}{2} \right)$.
> 
> Построим тригонометрическую окружность:
> ![[Drawing 2025-11-18 16.37.53.excalidraw.png|400]]
>Отметим на ней точку $x$ и соответствующую точку $\sin x$. Если теперь отметить противоположные точки $-x$ и $-\sin x$, то можно заметить следующее: расстояние между $x$ и $-x$ — это длина некоторой дуги, а расстояние между $\sin x$ и $-\sin x$ — длина хорды, стягивающей эту дугу. Зная, что длина такой хорды не превосходит длины дуги, имеем $$|\sin x - (- \sin x)| \leq |x - (-x)| \iff |2\sin x| \leq |2x| \iff |\sin x| \leq |x| $$
>Поскольку на выбранном интервале $\sin x > 0, x > 0$, имеем $\sin x \leq x$, то есть $$\frac{\sin x}{x} \leq 1  $$
>
>Проведём ось тангенсов:
>![[Drawing 2025-11-21 14.41.41.excalidraw.png|400]]
>Заметим, что круговой сегмент $OAx$ целиком содержится в треугольнике $OAB$.
>Площадь этого сегмента составит $\frac{x}{2\pi} \times \pi = \frac{x}{2}$.
>Площадь треугольника $OAB$ составит $\frac{1 \times \text{tg}~x}{2} = \frac{\text{tg}~x}{2}$, откуда имеем $$\frac{x}{2} \leq \frac{\text{tg}~x}{2} \iff x \leq \text{tg}~x \iff \cos x \leq \frac{\sin x}{x}$$
>В итоге имеем $$\cos x \leq \frac{\sin x}{x} \leq 1, $$
>откуда, по теореме о двух милиционерах, $\frac{\sin x}{x} \to 0$ при $x \to 0$.

### Следствия

> **Следствие 1**
> 
> $$\lim\limits_{x \to 0} \frac{1 - \cos x}{x^2} = \frac 1 2 $$
> **Доказательство**
> 
> $$\lim\limits_{x \to 0} \frac{1 - \cos x}{x^2} = \lim\limits_{x \to 0} \frac{2\sin^2\left(\frac x 2\right)}{4\left(\frac x 2 \right)^2} = \lim\limits_{x \to 0} \left(\frac 1 2 \times \frac{\sin^2\left(\frac x 2 \right)}{\left(\frac x 2 \right)^2} \right) = \frac 1 2$$

> **Следствие 2**
> 
> $$\lim\limits_{x \to 0}\frac{\text{tg}~x}{x} = 1 $$
> **Доказательство**
> 
> $$\lim\limits_{x \to 0} \frac{\text{tg}~x}{x} = \lim\limits_{x \to 0} \left(\frac{\sin x}{x} \times \frac{1}{\cos x} \right) = 1 $$


---
## Второй замечательный предел

> **Лемма 1**
> 
> Последовательность $a_n = \left(1 + \frac 1 n \right)^n$ имеет предел.
> 
> **Доказательство**
> 
> Разложением по формуле бинома Ньютона приводим выражение к следующему виду: $$\begin{gathered} \left( 1 + \frac 1 n \right)^n = \sum\limits_{k = 0}^n C_n^k \left(\frac{1}{n}\right)^k = \sum\limits_{k = 0}^n\frac{n \times (n - 1) \times \dots \times (n - (k - 1))}{k! \times n^k} = \\ \\ = \sum\limits_{k = 0}^n \frac{1 \times \left(1 - \frac{1}{n} \right) \times \dots \times \left(1 - \frac{k - 1}{n} \right)}{k!} \end{gathered}$$
> Заметим, что с увеличением $n$:
> 1. множители в числителе каждого из слагаемых увеличиваются, причем знаменатель остаётся незименным — это значит, что слагаемые увеличиваются;
> 2. число слагаемых увеличивается,
> 
> то есть значение $n$-го члена последовательности увеличивается, а значит, что она монотонно возрастает.
> 
> Заметим также, что значение числителя каждого из слагаемых не превышает $1$, то есть 
> $$\left(1 + \frac 1 n \right)^n \leq \sum\limits_{k = 0}^n \frac{1}{k!} $$
> При помощи индукции нетрудно показать, что для натуральных $k$ всегда выполнено $k! \geq 2^{k-1}$. Тогда имеем $$\left(1 + \frac 1 n \right)^n \leq \sum\limits_{k = 0}^n \frac{1}{k!} \leq 1 + \sum_{k = 1}^n \frac{1}{2^{k-1}} \leq 3, $$
> то есть последовательность $\{a_n\}$ ограничена. Поскольку ранее мы показали, что она монотонно возрастает, то, по теореме Вейерштрасса, она имеет конечный предел, что и требовалось доказать.

> [!info] Определение
> 
> Предел последовательности $a_n = \{\left(1 + \frac 1 n \right)^n\}$ называется **неперовым числом** или **числом Эйлера** (числом $e$).

> **Второй замечательный предел**
> 
> $$\lim\limits_{x \to \infty}\left(1 + \frac 1 x \right)^x = e$$
> **Доказательство**
> 
> Положим $n \leq x \leq n + 1$. Тогда имеем $$\left(1 + \frac 1 {n + 1} \right)^{n} \leq \left(1 + \frac 1 x \right)^x \leq  \left(1 + \frac 1 n \right)^{n + 1} $$
> Заметим, что $$\begin{gathered} \lim\limits_{n \to \infty} \left(1 + \frac 1 {n + 1} \right)^n = \lim_{n \to \infty} \left(\frac{\left(1 + \frac{1}{n + 1}\right)^{n + 1}}{1 + \frac{1}{n + 1}} \right) = \frac{\lim\limits_{n \to \infty} \left(1 + \frac{1}{n + 1}\right)^{n + 1}}{\lim\limits_{n \to \infty}\left(1 + \frac{1}{n + 1}\right)} = \frac e 1 = e \\ \\ \lim\limits_{n \to \infty} \left(1 + \frac{1}{n}\right)^{n + 1} = \lim\limits_{n \to \infty}\left(\left(1 + \frac{1}{n}\right)^n \times  \left(1 + \frac 1 n\right)\right) = \lim\limits_{n \to \infty} \left(1 + \frac 1 n \right)^n \lim\limits_{n \to \infty}\left(1 + \frac 1 n \right) = e \times 1 = e \end{gathered}$$
> Таким образом, $$e \leq \lim\limits_{x \to \infty}\left(1 + \frac 1 x\right)^x \leq e, $$
> откуда, по теореме о двух милицонерах, $\lim\limits_{x \to \infty}\left(1 + \frac 1 x \right)^x = e$, что и требовалось доказать.

### Следствия

Второй замечательный предел можно обобщить следующим образом: $$\begin{gathered} \lim\limits_{\alpha(x) \to \infty} \left(1 + \frac{1}{\alpha(x)}\right)^{\alpha(x)} = e \\ \\ \lim\limits_{\beta(x) \to 0} \left(1 + \beta(x) 
\right)^\frac{1}{\beta(x)} = e \end{gathered}$$
Используя это знание, выведем несколько полезных вспомогательных пределов.

> **Следствие 1**
> 
> $$\lim\limits_{x \to 0} \frac{\ln(1 + x)}{x} = 1$$
> **Доказательство**
> 
> $$\lim\limits_{x \to 0} \frac{\ln(1 + x)}{x} = \lim\limits_{x \to 0} \left( \frac 1 x \ln(1 + x) \right) = \lim\limits_{x \to 0} \ln(1 + x)^\frac{1}{x} = \ln\lim\limits_{x \to 0}(1 + x)^\frac{1}{x} = \ln e = 1$$

> **Следствие 2**
> 
> $$\lim\limits_{x \to 0} \frac{e^x - 1}{x} = 1 $$
> 
> **Доказательство**
> $$\lim\limits_{x \to 0} \frac{e^x - 1}{x} = \lim\limits_{y \to 0} \frac{y}{\ln(y + 1)} = \left(\lim\limits_{y \to 0} \frac{\ln(y + 1)}{y}\right)^{-1} = 1 $$

> **Следствие 3**
> 
> $$\lim\limits_{x \to 0} \frac{a^x - 1}{x} = \ln a$$
> **Доказательство**
> 
> $$\lim\limits_{x \to 0} \frac{a^x - 1}{x} = \lim\limits_{x \to 0} \frac{e^{x\ln a} - 1}{x} = \lim\limits_{y \to 0} \frac{y\ln a}{\ln(y + 1)} = \ln a $$

> **Следствие 4**
> 
> $$\lim\limits_{x \to 0} \frac{\log_a(1 + x)}{x} = \frac{1}{\ln a} $$
> **Доказательство**
> 
> $$\lim\limits_{x \to 0} \frac{\log_a(1 + x)}{x} = \lim\limits_{x \to 0} \frac{\frac{\ln (1 + x)}{\ln a}}{x} = \lim\limits_{x \to 0} \frac{\ln(1 + x)}{x\ln a} = \frac{1}{\ln a}$$

> **Следствие 5**
> 
> $$\lim\limits_{x \to 0} \frac{(1 + x)^\alpha - 1}{x} = \alpha, \alpha \in \mathbb{R} $$
> **Доказательство**
> 
> $$\begin{gathered} \lim\limits_{x\to 0}\frac{(1 + x)^\alpha - 1}{x} = \lim\limits_{x \to 0}\frac{e^{\alpha\ln(1 + x)}- 1}{x} = \lim\limits_{x, y \to 0} \frac{y\alpha\ln (x+1)}{x\ln(y + 1)} = \\ \\ = \lim\limits_{x, y \to 0} \left(\frac{y}{\ln(y + 1)} \times \frac{\ln(x + 1)}{x} \times \alpha \right) = \alpha \end{gathered}$$
