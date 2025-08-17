#import "@preview/showybox:2.0.4": showybox
#let subject_name = "Machine Learning"
#let assignment_no = "1"
#let author_name = "Himanshu Sardana"
#let starting_ques_no = state("qno", 1)

// ====================
// MACROS
// ====================

#let title_page(subject_name, assignment_no, author_name) = [#align(
    horizon + center,
  )[
    #smallcaps()[#text(weight: "bold", size: 24pt)[#subject_name]]
    #v(-5mm)
    #smallcaps()[#text(weight: "bold", size: 18pt)[Assignment #assignment_no]]

    #text(size: 12pt)[by *#author_name*]
  ]
]

#let toc() = [
  #outline(title: [
    #box(width: 100%, inset: (x: 8pt, y: 10pt), fill: blue, radius: 8pt)[
      #align(center)[
        #smallcaps()[#text(fill: white)[*Table of Contents*]]
      ]
    ]
  ])
]

#let title(body) = [
  #box(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    fill: blue.lighten(70%),
    stroke: 1pt + blue.darken(30%),
  )[
    #align(center + horizon)[
      #smallcaps()[#text(size: 12pt, weight: "bold")[= #body]]
    ]
  ]
]

#let question(title, body) = context [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: white,
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
      #smallcaps()[#text(size: 10pt, weight: "bold")[
          == #title
        ]]
    ],
  )[#body
    #v(1mm)
  ]
]
#let theory(title, body) = context [
  #showybox(
    frame: (
      border-color: blue,
      title-color: blue,
      body-color: white,
    ),
    title-style: (
      color: white,
      weight: "bold",
      align: left,
      // boxed-style: (
      //   radius: 4pt,
      // ),
    ),
    title: [#smallcaps()[#title]],
  )[#body]
]

#let solution(sol, output: "") = [
  #grid(columns: (2fr, 1fr))[
    #smallcaps()[*Solution*] \
    #v(-2mm)
    #text()[#sol]
  ][
    #smallcaps()[*Output*] \
    #v(-2mm)
    #text()[#output]
  ]
]
