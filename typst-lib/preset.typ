#import "main.typ": *

#let setup(body) = (
[

#set text(size: 12pt)

#show link: it => {
  strong(text(fill: imp-color, it))
}

#show heading: it => {
  block(below: 20pt, align(center, text(fill: imp-color, it)))
}

#show heading.where(level: 1): it => {
  align(center, text(fill: imp-color, size: 20pt, it))
}
#show heading.where(level: 2): it => {
  align(center, text(fill: imp-color, size: 18pt, it))
}
#show heading.where(level: 3): it => {
  align(center, text(fill: imp-color, size: 16pt, it))
}



#body
]
)
