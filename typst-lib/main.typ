#let imp-color = rgb("#02659f")

// #let notes-header(cont) = align(center, strong(text(size: 24pt, cont)))
#let notes-header(cont, pgbreak: false) = [
  #{ if (pgbreak) { pagebreak() } }
  #align(center, strong(text(size: 20pt, cont)))
]
#let notes-sub(cont, pgbreak: false) = [
  #{ if (pgbreak) { pagebreak() } }
  #align(center, text(size: 18pt, fill: imp-color, style: "italic", cont))
]


#let def(termin, definition) = align(center, block(
  inset: 15pt,
  radius: 5pt,
  // stroke: imp-color,
  fill: rgb("#cdfbc4"),
  width: 100%,


  align(left, [_*#text(fill: imp-color, termin)*_ --- #definition]),
))

#let imp-formula(formula) = block(
  inset: 15pt,
  radius: 5pt,
  stroke: imp-color,
  width: 100%,

  formula,
)

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
  // stroke: imp-color,
  fill: rgb("#e9d7ff"),
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

#let fun-fact(cont) = align(left, block(
  inset: 15pt,
  radius: 5pt,
  width: 100%,
  fill: rgb("#adf7e6"),

  cont,
))
#let fun-fact-headered(header, cont) = align(center, block(
  fun-fact(
    [
      #block(text(strong(header), fill: imp-color, style: "italic"))
      #cont
    ],
  ),
))

#let TODO = strong(underline(text("TODO", fill: red, size: 25pt)))

#let pair(a, b) = $chevron #a, #b chevron.r$
#let compl(cont) = $overline(cont)$

#let imp(cont) = strong(text(fill: imp-color, cont))

#let True() = strong(text(fill: rgb("#22a131"), "true"))
#let False() = strong(text(fill: red, "false"))

#let nothing = sym.diameter

#let quasilim = {
  $accent(lim, ~)$
}
#let quasilim-arg(arg, arglim) = {
  $limits(quasilim)_(arg -> arglim)$
}

#let continuum = $frak(c)$

#let vct(x) = $accent(#x, arrow)$
#let altvct(x) = $overline(#x)$

#let smn = $without$

#let const = $"const"$

#let arctg = $op("arctg")$
#let arcctg = $op("arcctg")$

#let lim = $limits(lim)$
