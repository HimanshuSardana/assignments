#set text(font: "Montserrat", size: 8pt)
#let question(body) = [
  #box(width: 100%, inset: 10pt, radius: 4pt, stroke: 0.6pt)[
    #smallcaps()[#text(weight: "bold")[Question]] \
    #body
  ]
]

#let solution(body) = [
  #box(width: 100%, inset: 6pt, radius: 4pt, stroke: 0.0pt)[
    #smallcaps()[#text(weight: "bold")[Solution]] \
    #body
  ]
]
