#import "../typst-lib/main.typ": *
#import "../typst-lib/dmt.typ": *

#set text(size: 12pt)

// ======================================================================

#notes-header([Комбинаторика])

#def(
  [Разбитое (partioned) множество],
  [
    говорят, что множество $S$ разбито на части $S_1, S_2, dots, S_k$, если
    $
      S = union.sq.big_(i=1)^k S_i
    $
  ],
)
