#import "../lib.typ": *


#let tm-block-name(n, quest) = block(
  text(
    [*#n. #quest*],
    size: 18pt,
    fill: imp-color,
  ),
)


#let hw-task-num(n, header) = block(
  [
    #text(
      size: 20pt,
      fill: imp-color,
      [
        *№#n. #header*
      ],
    )
  ],
)

#let get-bit(n, bit) = {
  for i in range(bit) {
    n = int(n / 2)
  }

  return n - (int(n / 2) * 2)
}

#let inv(x) = {
  if (x == 1) { return 0 }
  return 1
}

#let bruteforce-sat(variables, headers, functions) = table(
  align: center,
  columns: { variables.len() + headers.len() + 1 },
  ..for var in variables {
    (var,)
  },
  ..for h in headers {
    (h,)
  },
  strong($therefore$),
  ..for n in range(calc.pow(2, variables.len())) {
    let values = ()
    for i in range(variables.len(), 0, step: -1) {
      let x = get-bit(n, i - 1)
      values.push(x)
      ([#x],)
    }

    let results = ()
    let is-valid = true
    for func in functions {
      let res = func(values)
      results.push(res)
      ([#res],)
      if (res == 0) { is-valid = false }
    }

    if (is-valid) { (strong(text(fill: rgb("#008a09"), [1])),) } else { (strong(text(fill: red, [0])),) }
  }
)

#let semantic-proof(variables, headers, functions, result, result-func) = table(
  align: center,
  columns: { variables.len() + headers.len() + 2 },
  ..for var in variables {
    (var,)
  },
  ..for h in headers {
    (h,)
  },
  strong(result),
  strong($therefore$),
  ..for n in range(calc.pow(2, variables.len())) {
    let values = ()
    for i in range(variables.len(), 0, step: -1) {
      let x = get-bit(n, i - 1)
      values.push(x)
      ([#x],)
    }

    let results = ()
    let is-valid = true
    for func in functions {
      let res = func(values)
      results.push(res)
      ([#res],)
      if (res == 0) { is-valid = false }
    }

    let target = result-func(values)

    if (not is-valid) { (strong($-$), strong($-$)) } else {
      (strong([#target]),)
      if (target == 0) { (strong(text(fill: red, [0])),) } else { (strong(text(fill: rgb("#008a09"), [1])),) }
    }
  }
)


#let truth-table(variables, headers, functions) = table(
  align: center,
  columns: { variables.len() + headers.len() },
  ..for var in variables {
    (var,)
  },
  ..for h in headers {
    (h,)
  },
  ..for n in range(calc.pow(2, variables.len())) {
    let values = ()
    for i in range(variables.len(), 0, step: -1) {
      let x = get-bit(n, i - 1)
      values.push(x)
      ([#x],)
    }

    for func in functions {
      ([#func(values)],)
    }
  }
)



#let fitch-row-num-cell(row) = table.cell(
  stroke: (top: none, bottom: none, left: none, right: 1pt),
  align: horizon,
  [#row],
)
#let table-recursion(cur: 0, target: 0, bot-stroke: none, cont: ()) = table(
  stroke: (top: none, left: none, right: none, bottom: bot-stroke),
  inset: (top: 0pt, bottom: 0pt),
  columns: 2,
  ..if (cur == target) { (table.cell(cont.at(0), stroke: (left: 1pt)), cont.at(1)) } else {
    (table-recursion(cur: cur + 1, target: target, bot-stroke: bot-stroke, cont: cont), "")
  },
)
#let fitch-line(depth: 0, row: 1, formula: $$, rule: "", underline: false) = (
  fitch-row-num-cell(row),
  ..if (depth != 0) {
    (table-recursion(cur: 1, target: depth, bot-stroke: if underline { 1pt } else { none }, cont: (formula, rule)), "")
  } else {
    (formula, rule)
  },
)


#let relphi = $op(phi)$


#let fitch-proof(lines) = table(
  stroke: none,
  inset: (top: 0pt, bottom: 0pt),
  columns: 3,
  [],
)
