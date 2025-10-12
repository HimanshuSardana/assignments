

#let paper(
  title,
  authors,
  abstract,
  doc,
) = {
  import "@preview/numbly:0.1.0": numbly
  set page(columns: 2, margin: 50pt)
  set par(justify: true)
  set heading(
    numbering: numbly(
      "{1:I.}",
      "{2:A.}",
    ),
  )
  show heading.where(level: 1): it => [
    #align(center)[
      #text(size: 12pt, weight: "regular")[
        #smallcaps()[
          #counter(heading).display()
          #it.body
        ]
      ]
    ]
  ]

  show heading.where(level: 2): it => [
    #align(left)[
      #text(size: 10pt, weight: "regular")[
        #emph()[
          #counter(heading).display()
          #it.body
        ]
      ]
    ]
    #v(-1mm)
  ]

  set text(size: 10pt, bottom-edge: 0pt)

  place(top + center, float: true, scope: "parent")[
    #set par(justify: false)
    #align(center)[
      #text(size: 22pt, weight: "semibold")[
        #title
      ]
    ]
    #grid(
      columns: (1fr, 1fr),
      row-gutter: 16pt,
      ..authors.map(author => [
        #align(center)[
          #author.at("name") \
          #emph()[#author.at("department")]
          #author.at("institute")
          #author.at("location") \
          #text(fill: blue.darken(20%))[
            #underline()[#author.at("email")]
          ]
        ]
      ])
    )

  ]
  text(weight: "semibold")[#emph()[*Abstract*]
    *$dash.em$*
    #abstract
  ]


  doc
}
