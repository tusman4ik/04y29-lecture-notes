#let imp-color = rgb("#004871")

#let def(termin, definition) = align(center, block(
  inset: 15pt,
  radius: 5pt,
  stroke: rgb("#0d4d00"),
  width: 100%,


  align(left, [_*#text(fill: imp-color, termin)*_ --- #definition]),
))

#let QED = align(right, block(
  inset: 7pt,
  stroke: imp-color,
  radius: 5pt,
  strong((
    text(
      style: "italic",
      fill: imp-color,
      "QED",
    )
  )),
))
#let qed = align(right, strong(text(style: "italic", fill: imp-color, "QED")))

#let theor-state(name: [Теорема], cont) = block(
  inset: 15pt,
  radius: 5pt,
  // fill: rgb("#e9d7ff"),
  width: 100%,
  stroke: rgb("#b47cf9"),
  [
    #strong(text(name, fill: imp-color))\
    #text(cont, style: "italic")],
)

#let theor-proof(cont) = block(
  stroke: (left: rgb("#b47cf9"), right: none, top: none, bottom: 0pt),
  inset: (left: 15pt),
  width: 100%,
  [
    #strong(text("Доказательство", fill: imp-color))\
    #block(cont, width: 100%)
    #QED
  ],
)

#let theorem(name: [Теорема], state, proof) = block(
  [
    #theor-state(name: name, state)
    #theor-proof(proof)
  ],
)

#let fun-fact-uh(cont) = align(left, block(
  inset: 15pt,
  radius: 5pt,
  width: 100%,
  stroke: imp-color,

  cont,
))
#let fun-fact(header, cont) = align(center, block(
  fun-fact-uh(
    [
      #block(text(strong(header), fill: imp-color, style: "italic"))
      #cont
    ],
  ),
))

#let TODO = strong(underline(text("TODO", fill: rgb("#780600"), size: 20pt)))

#let pair(a, b) = $chevron #a, #b chevron.r$
#let compl(cont) = $overline(cont)$

#let nothing = sym.diameter

#let continuum = $frak(c)$

#let vct(x) = $accent(#x, arrow)$
#let altvct(x) = $overline(#x)$

#let smn = $without$

#let const = $"const"$

#let arctg = $op("arctg")$
#let arcctg = $op("arcctg")$

#let lim = $limits(lim)$