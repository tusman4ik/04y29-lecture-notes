# Свойства $R$

1. Свойства порядка
	   1. $\forall a, b \in R : a = b \vee a < b \vee a > b$
	2. $\forall a, b, c \in R: a < b < c \implies a < c$
	3. $\forall a, b \in R, a < b: \exists c \in R: a < c < b$
2. Свойства сложения
	1. Коммутативность: $\forall a, b \in R: a + b = b + a$
	2. Ассоциативность: $\forall a ,b, c \in R: (a + b) + c = a + (b + c)$
	3. Нейтральный элемент: $\exists 0 \in R: \forall a \in R: a + 0 = a$
	4. Обратный элемент: $\forall A \in R: \exists (-A) \in R: A + (-A) = 0$
	5. $\forall a, b, c \in R, a < b: a + c < b + c$
3. Свойства умножения
	1. Коммутативность: $\forall a, b \in R: a \times b = b \times b$
	2. Ассоциатинвость: $\forall a, b, c \in R: (a \times b) \times c = a \times (b \times c)$
	3. Нейтральный элемент: $\exists 1 \in R: \forall a \in R: a \times 1 = a$
	4. Обратный элемент: $\forall a \in R: \exists a^{-1} \in R: a \times a^{-1} = 1$
	5. Дистрибутивность относительно сложения: $\forall a, b, c \in R: a \times (b + c) = a \times b + a \times c$
	6. $\forall a, b, c \in R, a < b, c > 0: a \times c < b \times c$
4. Архимедово свойство: $\forall c > 0: \exists n \in N: n > c$ 
   Замечание: $\forall \varepsilon > 0, \varepsilon \in R: \exists n \in N: n^{-1} < \varepsilon$

# Непрерывность множества действительных чисел
1. **Лемма о вложенных отрезках**
   Пусть задана последовательность (система) отрезков вида $S_n = [a_n, b_n]$, вложенных друг в друга, то есть $\forall n \in N: S_{n + 1} \subset S_n$. При таком условии  $l_n = b_n - a_n \rightarrow 0$ при  $n \rightarrow \infty$; тогда $\exists! x \in R: \forall S_n: x \in S_n$
2. Пусть $R = A \cup B, A \cap B = \emptyset, A \neq \emptyset, B \neq \emptyset$, причём $\forall a \in A, b \in B: a < b$. Тогда либо в множестве $A$ есть наибольшее число, а в $B$ нет наименьшего: $$\begin{gathered} A = (-\infty, p], B = (p, +\infty) \\ \\ \exists max_A = p\wedge \nexists min_B, \end{gathered}$$
   либо наоборот: $$\begin{gathered} A = (-\infty,p), B = [p, +\infty)  \\ \\ \nexists max_A \wedge \exists min_B = p\end{gathered}$$ Такое разбиение называется *Декиндовым сечением*. Здесь $A$ — нижний класс $R$, $B$ — высший класс $R$.
   
3. Введем ряд определений:
	- Множество $A \subset R$ называется *ограниченным снизу*, если $\exists m \in R: \forall x \in A: x \geq m$. При этом $m$ называется *нижней гранью* множества $A$.
	- Множество $A \subset R$ называется *ограниченным сверху*, если $\exists M \in R: \forall x \in A: x \leq M$. При этом $M$ называется *верхней гранью* множества $A$.
	- Множество $A \subset R$ называется *ограниченным*, если оно одновременно ограничено снизу и сверху.
	- Число $m$ ($M$) называется *точной нижней* (*точной верхней*) гранью множества $A$, если выполнены следующие условия:
		  1. $m$ ($M$) является нижней (верхней) гранью множества $A$
		2. ни одно $x > m$ ($x < M$) не является нижней (верхней) гранью множества $A$	
		   
	  Здесь $m = \text{inf}A$ (от infinum — наименьший), $M = \text{sup}A$ (от supremum — наибольший) 
4. **Свойство непрерывности**: любое числовое множество, ограниченное снизу (сверху), имеет точную нижнюю (верхнюю) грань.

# Операции над несобственными числами

1. $-\infty < +\infty, -\infty < a < +\infty$
2. $+\infty + (+\infty) = +\infty$
   $-\infty + (-\infty) = -\infty$
   $+\infty - (-\infty) = +\infty$
   $-\infty - (+\infty) = -\infty$
3. $+\infty \times (+\infty) = +\infty$
   $-\infty \times (-\infty) = +\infty$
   $+\infty \times (-\infty) = -\infty$
   $-\infty \times (+\infty) = -\infty$
4. $a + (+\infty) = +\infty + a = +\infty$
   $a + (-\infty) = -\infty + a = -\infty$
5. $a \times (+\infty) = +\infty \times a = +\infty$
   $a \times (-\infty) = -\infty \times a = -\infty$
6. $\forall a < 0$
   $a \times (+\infty) = +\infty \times a = -\infty$
   $a \times (-\infty) = -\infty \times a = -\infty$
7. $a + \infty = \infty + a = \infty$
   $\infty \times \infty = \infty$
   $\infty + \infty = \infty$
   $\forall a \neq 0: a \times \infty = \infty \times a =\infty$
8. Следующие операции **не определены**:
   $+\infty + (-\infty)$
   $-\infty + (+\infty)$
   $-\infty -(-\infty)$
   $+\infty-(+\infty)$
   $\infty - \infty$
   $0 \times \infty$
   $0 \times (\pm \infty)$
