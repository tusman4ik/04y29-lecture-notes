# Алгебраические операции

###  Определения

> [!Info]
> **Алгебраической операцией**, определенной на множестве $M$, называется такое соответствие, в силу которого $\forall (a, b), a \in M, b \in M: \exists! c \in M$ 

#### Свойства алгебраических операций

| Свойство                            | Определение                                                 |
| ----------------------------------- | ----------------------------------------------------------- |
| Ассоциативность                     | $(A \circ B) \circ C = A \circ (B \circ C)$                 |
| Коммутативность                     | $A \circ B = B \circ A$                                     |
| Дистрибутивность                    | $A \times (B \circ C) = (A \times B) \circ (A \times C)$    |
| Существование нейтрального элемента | $\exists N \in M: \forall A \in M: A \circ N = A$           |
| Существование обратного элемента    | $\forall A \in M: \exists A^{-1} \in M: A \circ A^{-1} = N$ |

---
# Алгебраические структуры

> [!Info]
> **Алгебраическая структура** — непустое множество $M$ с введёнными на нем алгебраическими операциями.

## Группы

> [!Info]
> **Группа** — непустое множество $G$ с заданной на нём бинарной операцией $*$ , которая удовлетворяет следующим условиям:
> - Ассоциативность
> - Существование нейтрального элемента
> - Существование обратного элемента
>   
> Эти три условия называются *аксиомами группы*.
> Группа является базовой алгебраической структурой, входящей в состав других более сложных (таких как кольца, поля, векторные пространства и проч.)

> [!Info]
> Группа, для которой выполняется условие коммутативности, называется **перестановочной** или **абелевой**.

 Простейший пример группы — это множество целых чисел $\mathbb{Z}$, которое является абелевой группой по сложению.
 
---
# Кольца

> [!Info]
> **Кольцо** — непустое множество $S$ с заданными на нём бинарными операциями $+$ и  $\times$, которые удовлетворяют следующим условиям:
> - $S$ — абелева группа по сложению
> - Дистрибутивность умножения отн-но сложения

### Классификация колец

| Название                               | Условие                                                            |
| -------------------------------------- | ------------------------------------------------------------------ |
| Коммутативное кольцо                   | Коммутативность умножения                                          |
| Ассоциативное кольцо                   | Ассоциативность умножения                                          |
| Кольцо без делителей нуля              | $\forall a, b \in S: a\times b = 0 \implies a = 0 \vee b = 0$      |
| Кольцо с единицей                      | Существование нейтрального элемента относительно умножения         |
| Область целостности (целостное кольцо) | Ассоциативное коммутативное кольцо с единицей и без делителей нуля |
Простейший пример кольца — это множество целых чисел $\mathbb{Z}$, которое является областью целостности. 

---

# Поля

> [!Info]
> **Поле** — непустое множество $F$, на котором заданы две бинарные операции: $+$ и $*$, которые удовлетворяют следующим условиям:
> - Коммутативность сложения
> - Ассоциативность сложения
> - Существование нейтрального элемента относительно сложения
> - Существование обратного элемента относительно сложения
> - Коммутативность умножения
> - Ассоциативность умножения
> - Существование нейтрального элемента относительно сложения
> - Существование обратного элемента относительно сложения
> - Дистрибутивность умножения относительно сложения
>   
> Эти девять условий называются *аксиомами поля*.
> Нетрудно также заметить, что поле — это кольцо, являющееся абелевой группой по умножению.

Простейший пример поля — это множество вещественных чисел $\mathbb{Q}$.

---

# Сравнительная характеристика алгебраических структур

<table style="width: 100%;table-layout: fixed;">
  <tr>
    <th></th>
    <th colspan = "4" style="text-align: center">Сложение</th>
    <th colspan = "4" style="text-align: center">Умножение</th>
    <th></th>
  </tr>
  <tr>
    <th></th>
    <th style="text-align: center">Ассоц.</th>
    <th style="text-align: center">Коммут.</th>
    <th style="text-align: center">Нейтр.</th>
    <th style="text-align: center">Обр.</th>
    <th style="text-align: center">Ассоц.</th>
    <th style="text-align: center">Коммут.</th>
    <th style="text-align: center">Нейтр.</th>
    <th style="text-align: center">Обр.</th>
    <th style="text-align: center">Дистриб.</th>
  </tr>
  <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Группа
      </div>
    </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Абелева группа
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
    <td style="text-align: center; vertical-align: middle;"> — </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Кольцо
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Ассоц. кольцо
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: cente; vertical-align: middle;r"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Коммут. кольцо
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Кольцо с единицей
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Область целостности
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✕ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
  </tr>
   <tr>
    <td style="width: 50px; height: 200px; padding: 0; vertical-align: bottom;">
      <div style="
        transform: rotate(-90deg); /* Поворот на 180°, чтобы текст был сверху вниз */
        text-align: center;
        white-space: nowrap;
      ">
        Поле
      </div>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
    <td style="text-align: center; vertical-align: middle;"> ✓ </td>
  </tr>
</table>


---