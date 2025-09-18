#import "@preview/showybox:2.0.4": showybox

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: blue,
    stroke: 1pt + blue,
  )[
    #align(center + horizon)[
      #smallcaps()[#text(
        font: "Montserrat",
        size: 10pt,
        weight: "bold",
        fill: white,
      )[= #body]]
    ]
  ]
]

#let question(qno, body) = [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: blue.lighten(90%),
    ),
    title-style: (
      color: white,
      weight: "bold",
      align: left,
      boxed-style: (
        radius: 4pt,
      ),
    ),
    title: [
      #smallcaps()[#text(size: 8pt, weight: "semibold", font: "Montserrat")[
        == Question #qno
      ]]
    ],
  )[
    #text(font: "Montserrat", size: 10pt)[
      #body
    ]
    #v(1mm)
  ]
]

#let solution(content) = [
  #block(
    inset: 12pt,
    radius: 5pt,
    width: 100%,
    stroke: (thickness: 1.3pt, dash: "dashed", paint: blue),
    // fill: blue.lighten(90%),
  )[
    #text(
      weight: "bold",
      size: 9pt,
      fill: blue,
      font: "Montserrat",
    )[#smallcaps()[Solution]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

#let output(content) = [
  #block(inset: 5pt, radius: 5pt, width: 100%)[
    #text(
      weight: "bold",
      size: 9pt,
      fill: blue,
      font: "Montserrat",
    )[#smallcaps()[Output]] \
    #v(-2mm)
    #text(size: 10pt)[#content]
  ]
]

