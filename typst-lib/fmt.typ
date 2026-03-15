#import "main.typ": *

#let Ker = $op("Ker")$
#let Im = $op("Im")$
#let sp_def = $op("def")$
#let rank = $op("rank")$


#let span(..cont) = {
  $chevron$
  let args = cont.pos()
  for i in range(args.len() - 1) {
    [#args.at(i), ]
  }
  [#args.last()]
  $chevron.r$
}
