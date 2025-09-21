**Пререквизиты**:
- Поле комплексных чисел
- Алгебраическая запись комплексного числа
---
### Деление комплексных чисел в алгебраической форме

Для нахождения частного двух комплексных чисел мы должны умножить оба из них на комплексно сопряжённое к делителю:
$$\frac{z_1}{z_2} = \frac{(a_1+b_1i)(a_2 - b_2i)}{(a_2+b_2i)(a_2-b_2i)} = \frac{a_1a_2-a_1b_2i+a_2b_1i+b_1b_2}{a_2^2+b_2^2} = \frac{a_1a_2+b_1b_2}{a_2^2+b_2^2}+\frac{a_2b_1-a_1b_2}{a_2^2+b_2^2}i$$

---

# Геометрическая интерпретация комплексных чисел

Представим комплексное число $z = a + bi$ в виде точки с координатами $(a, b)$ в декартовой системе координат:

![[Drawing 2025-09-17 11.39.12.excalidraw.png|600]]
Двумерное пространство, в котором существует это число, называется *комплексной плоскостью*.
Здесь:
- $OX$ — действительная ось
- $OY$ — мнимая ось
- $Oz$ — радиус-вектор комплексного числа $z$
- $r = \sqrt{a^2 + b^2}$ — модуль комплексного числа
- $-\pi \leq \varphi \leq \pi$ — главное значение аргумента комплексного числа. 
  $\varphi = \text{arctg}\frac{b}{a}$ для $I$ и $IV$ четвертей; для $II$ четверти  $\varphi = \pi +\text{arctg}\frac{b}{a}$, для $III$ четверти $\varphi = -\pi + \text{arctg}\frac{b}{a}$.
- $\varphi + 2\pi k$ — аргумент комплексного числа

> [!Info]
> Представление *ненулевого* комплексного числа в виде $z = r(\cos\varphi + i \sin\varphi)$ называется его **тригонометрической формой**.

### Операции с комплексными числами в тригонометрической форме

- ==Умножение==: $$\begin{gathered} 
  z_1 \times z_2 = r_1(\cos \varphi_1 + i\sin\varphi_1) \times r_2(\cos\varphi_2 + i\sin\varphi_2) = \\ \\
  = r_1r_2(\cos\varphi_1\cos\varphi_2 + i\cos\varphi_1\sin\varphi_2 + i\sin\varphi_1\cos\varphi_2-\sin\varphi_1\sin\varphi_2) = \\ \\
  = r_1r_2(\cos\varphi_1\cos\varphi_2 - \sin\varphi_1\sin\varphi_2 + i (\cos\varphi_1\sin\varphi_2 + \sin\varphi_1\cos\varphi_2)) = \\ \\
  = r_1r_2(\cos(\varphi_1 + \varphi_2) + i\sin(\varphi_1 + \varphi_2)
 \end{gathered}$$
- ==Деление==: $$\begin{gathered} 
  \frac{r_1(\cos\varphi_1 + i\sin\varphi_1)r_2(\cos\varphi_2 - i\sin\varphi_2)}{r_2(\cos\varphi_2 + i\sin\varphi_2)r_2(\cos\varphi_2-i\sin\varphi_2)} = \\
  \\
= \frac{r_1r_2(\cos\varphi_1\cos\varphi_2 - i\cos\varphi_1\sin\varphi_2 + i\sin\varphi_1\cos\varphi_2 + \sin\varphi_1\sin\varphi_2)}{r_2^2(\cos\varphi_2^2 -i\cos\varphi_2\sin\varphi_2 + i\cos\varphi_2\sin\varphi_2 + \sin\varphi_2^2)} = \\ 
\\
= \frac{r_1r_2(\cos\varphi_1\cos\varphi_2 + \sin\varphi_1\sin\varphi_2 + i(\sin\varphi_1\cos\varphi_2 - \sin\varphi_2\cos\varphi_1))}{r_2^2} = \\
\\
= \frac{r_1}{r_2} (\cos(\varphi_1 - \varphi_2) + i\sin(\varphi_1 - \varphi_2)) 
  \end{gathered}$$
- ==Возведение в степень== (формула Муавра): $$(r(\cos\varphi + i\sin\varphi))^n = r^n(\cos n\varphi + i\sin n\varphi)$$
  Докажем корректность формулы по индукции.
  
  **База**: $(r(\cos\varphi + i\sin\varphi))^0 = r^0(\cos0 + i\sin0) = 1$
  **Переход**: пусть $\forall n \leq k: (r(\cos\varphi + i\sin\varphi))^n = r^n(\cos n\varphi + i\sin n\varphi)$. Покажем, что это выполняется для $n=k+1$:
  $$\begin{gathered}(r(\cos\varphi + i\sin\varphi))^{k+1} = r^k(\cos n\varphi + i\sin n\varphi)\times r(\cos\varphi + i\sin\varphi) = \\ \\= r^kr(\cos(k\varphi+\varphi)+i\sin(k\varphi+\varphi)) = r^{k+1}(\cos((k+1)\varphi) + i\sin((k+1)\varphi),\end{gathered}$$
  что и требовалось доказать.
  
  
- ==Корень n-ной степени==: пусть $r'(\cos\varphi' + i\sin\varphi') = \sqrt[n]{z}$, тогда: $$\begin{gathered} (r')^n(\cos n\varphi' + i\sin n\varphi') = r(\cos(\varphi + 2\pi k) + i\sin(\varphi + 2\pi k)), k \in \mathbb{Z} \end{gathered}$$
  Выразим $r'$ и $\varphi'$: $$\begin{gathered} (r')^n = r \implies r = \sqrt[n]{r} \\ \\ n\varphi' = \varphi+2\pi k \implies \varphi' = \frac{\varphi + 2\pi k}{n},\end{gathered}$$
  отсюда $$\sqrt[n]{z} = \sqrt[n]{r}(\cos\frac{\varphi + 2\pi k}{n} + i\sin\frac{\varphi + 2\pi k}{n}) $$
  Из этой формулы видно, что: 
	- корни любой натуральной степени существуют для любого ненулевого комплексного числа 
	- у корня $n$-ной степени ровно $n$ различных значений, причём в геометрическом смысле они являются вершинами правильного $n$-угольника, вписанного в окружность радиусом $\sqrt[n]{r}$.

---

# Показательная форма 

> [!Info]
> Представление *ненулевого* комплексного числа в виде $z = r e^{i\varphi}$ называется его **показательной формой**.

Показательная форма получается из тригонометрической путём применения *формулы Эйлера*: $e^{i\varphi} = \cos\varphi+i\sin\varphi$.

### Операции с комплексными числами в показательной форме:

- ==Умножение==: $$z_1 \times z_2 = r_1r_2e^{i(\varphi_1+\varphi_2)}$$
- ==Деление==: $$\frac{z_1}{z_2} = \frac{r_1}{r_2}e^{i(\varphi_1-\varphi_2)}$$
- ==Возведение в степень==: $$z^n = r^ne^{in\varphi}$$
- ==Корень n-ной степени==: $$\sqrt[n]{z} = \sqrt[n]{r}e^{i\frac{\varphi+2 \pi k}{n}}, k \in \mathbb{Z}$$
---