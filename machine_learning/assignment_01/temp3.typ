#import "@preview/tasteful-pairings:0.1.0": *
#import "@preview/showybox:2.0.4": *

#let starting_ques_no = state("qno", 1)
#let starting_ques_no = state("qno", 1)
#let toc() = [
  #show outline.entry: set text(font: "Uni Neue-Trial", size: 8pt) 
  #show outline.entry: it => [
    #box(width: 100%, fill: red.lighten(70%), inset: 12pt, radius: 4pt)[
      #it.indented(it.prefix(), [
        #grid(
          columns: (300pt, 100% - 300pt),
          align: horizon + left,
          [
            #text(8pt, fill: red, weight: "bold")[#it.body()]
          ],
          [
            #align(right)[
              #text(8pt, fill: red, weight: "bold")[#it.page()]
            ]
          ],
        )
      ])
    ]
    #v(-12pt)
  ]

  // modify outline entry element

  #outline(title: [
    #box(width: 100%, inset: (x: 12pt, y: 16pt), fill: red, radius: 4pt)[
      #align(center)[
        #smallcaps()[#text(font: "Uni Neue-Trial", fill: white)[Table of Contents]]
      ]
    ]
  ])
]

#let title_page(subject_name, assignment_no, author_name) = context [#align(
    horizon + center,
  )[
    #show heading: set text(font: "Uni Neue-Trial")
    #set text(font: "Uni Neue-Trial", size: 8pt)
    #box(fill: red, inset: (x: 15pt, y: 12pt))[
      #text(fill: white)[#smallcaps()[#text(
            weight: "bold",
            size: 24pt,
          )[#subject_name]]]
    ]
    #v(-3.41mm)
    #box(fill: red.lighten(70%), inset: (x: 15pt, y: 12pt))[
      #smallcaps()[#text(weight: "bold", size: 18pt)[Assignment #assignment_no]]
    ]

    #text(size: 12pt)[by #text(weight: "bold", fill: red)[#author_name]]
  ]
]

#let title(title-text) = context [
  #show heading: set text(font: "Uni Neue-Trial")
  #set text(font: "Uni Neue-Trial", size: 8pt)
  #let main = box(fill: red, height: 20pt, inset: (x: 6pt), radius: (
    top-left: 4pt,
    bottom-left: 4pt,
  ))[
    #align(center + horizon)[
      #smallcaps()[#text(fill: white, weight: "bold", size: 8pt)[
          = #text(8pt)[#title-text]
        ]]
    ]
  ]

  #let main-width = measure(main).width

  #box()[
    #main
    #box(
      fill: red.lighten(70%),
      height: 20pt,
      width: (98.8% - main-width),
      inset: (x: 10pt),
      radius: (
        top-right: 4pt,
        bottom-right: 4pt,
      ),
    )[ ]
  ]
]

#let question(body) = context [
  #show heading: set text(font: "Montserrat")
  #set text(font: "Montserrat", size: 8pt)
  #box(fill: red.lighten(70%), inset: 10pt, radius: 4pt, width: 100%)[
    #v(-3.5mm)
    #h(-3.5mm)
    #box(fill: red, inset: (y: 7pt, x: 8pt), radius: (
      bottom-right: 4pt,
      top-left: 4pt,
    ))[
      #text(fill: white, size: 7pt, weight: "bold")[
        #smallcaps()[== Question #starting_ques_no.get()]
      ]
    ]
    #v(-1mm)
    #text(8pt)[#body]
  ]
  #starting_ques_no.update(starting_ques_no.get() + 1)
]

#let solution(sol) = [
  #show heading: set text(font: "Uni Neue-Trial")
  #set text(font: "Uni Neue-Trial", size: 8pt)
  #v(-1mm)
  #text(fill: red)[#smallcaps()[*Solution*]] \
  #text()[#sol]
]


