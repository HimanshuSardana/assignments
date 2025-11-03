#set page(margin: (y: 50pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 2")

// = #text(fill: fuchsia)[Food Delivery System]

#question("1")[
  Draw the level 0, level 1, and level 2 data flow diagrams for a Food Delivery System.
]
#solution()[
  #block(inset: 8pt, stroke: (
    thickness: 1pt,
    dash: "dashed",
    paint: fuchsia,
  ))[#smallcaps()[#text(fill: fuchsia, weight: "bold")[Level 0]]]

  #block(width: 100%, inset: 10pt, radius: 4pt)[
    #align(center)[
      #diagram(
        node((3, 0), shape: "circle", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Food Delivery* \ *System*
          ]
        ],
        edge(
          (0.6, -0.2),
          (2.3, -0.2),
          "->",
          label: [
            #align(left)[
              - Order Updates \
              - Bill
            ]
          ],
          bend: 25deg,
        ),
        edge(
          (2.3, 0.2),
          (0.6, 0.2),
          "->",
          label: [
            Place Order
          ],
          bend: 25deg,
        ),
        node((0, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Customer*
          ]
        ],
        edge(
          (3.7, -0.2),
          (5.4, -0.2),
          "->",
          label: [
            #align(center)[
              Food Order
            ]
          ],
          bend: 25deg,
        ),

        node((6, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Kitchen*
          ]
        ],

        edge(
          (3, 1),
          (3, 1.6),
          "->",
          label: [
            #smallcaps()[
              #align(center)[
                Report
              ]
            ]
          ],
          bend: 25deg,
        ),

        node((3, 2), shape: "rect", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Manager*
          ]
        ],
      )
    ]
  ]

  #box(height: 50%, width: 100%)[
    #align(center + horizon)[
      #box(
        fill: fuchsia.lighten(80%),
        inset: 10pt,
        radius: 4pt,
        stroke: 1pt + fuchsia,
      )[
        #smallcaps()[*Level 1*] & #smallcaps()[*Level 2*] \ Data Flow Diagrams on the next page
      ]
    ]

  ]
  #block(inset: 8pt, stroke: (
    thickness: 1pt,
    dash: "dashed",
    paint: fuchsia,
  ))[#smallcaps()[#text(fill: fuchsia, weight: "bold")[Level 1]]]

  #v(2mm)
  #block(width: 100%, radius: 4pt, inset: 10pt)[
    #align(center)[
      #diagram(
        node((3, 0), shape: "circle", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Order* \ *Processing*
          ]
        ],
        edge(
          (0.6, -0.2),
          (2.5, -0.2),
          "->",
          label: [
            #align(left)[
              - Order \
              - Bill
            ]
          ],
          bend: 25deg,
        ),
        edge(
          (2.5, 0.2),
          (0.6, 0.2),
          "->",
          label: [
            Place Order
          ],
          bend: 25deg,
        ),
        node((0, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Customer*
          ]
        ],
        edge(
          (3.5, -0.2),
          (5.4, -0.2),
          "->",
          label: [
            #align(center)[
              Food Order
            ]
          ],
          bend: 25deg,
        ),

        node((6, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Kitchen*
          ]
        ],

        edge(
          (2.8, 1),
          (2.5, 2.6),
          "->",
          label: [
            #align(center)[
              Inventory Details
            ]
          ],
          bend: -25deg,
        ),

        edge(
          (3.2, 1),
          (3.5, 2.6),
          "->",
          label: [
            #align(center)[
              Order
            ]
          ],
          bend: 25deg,
        ),


        node((2.5, 3), shape: "rect", inset: 8pt)[
          #block(inset: 8pt, stroke: (top: 1pt, bottom: 1pt))[
            #smallcaps()[
              *Inventory*
            ]
          ]
        ],

        node((3.5, 3), shape: "rect", inset: 8pt)[
          #block(stroke: (top: 1pt, bottom: 1pt), inset: 8pt)[
            #smallcaps()[
              *Orders*
            ]
          ]
        ],

        edge(
          (2.5, 3),
          (2.8, 4.3),
          "->",
          bend: -25deg,
          label: [Inventory Details],
        ),

        edge((3.5, 3), (3.3, 4.3), "->", bend: 25deg, label: [Order Details]),

        node((3, 5), shape: "circle", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Generate* \ *Report*
          ]
        ],

        edge(
          (3, 5.7),
          (3, 6.6),
          "->",
          label: [
            #align(center)[
              Report
            ]
          ],
          bend: 25deg,
        ),

        node((3, 7), shape: "rect", stroke: 0.5pt, inset: 8pt)[
          #smallcaps()[
            *Manager*
          ]
        ],
      )
    ]
  ]


  #block(inset: 8pt, stroke: (
    thickness: 1pt,
    dash: "dashed",
    paint: fuchsia,
  ))[#smallcaps()[#text(fill: fuchsia, weight: "bold")[Level 2]]]
  #v(2mm)
  #align(center)[
    #diagram(
      node((3, 0), shape: "circle", stroke: 0.5pt, inset: 8pt)[
        #smallcaps()[
          *Receive* \ *Order*
        ]
      ],

      edge(
        (1.65, -0.2),
        (2.4, -0.2),
        "->",
        label: [
          #align(center)[
            Order Details
          ]
        ],
        bend: 25deg,
      ),

      node((1, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[
        #smallcaps()[
          *Customer*
        ]
      ],

      edge(
        (3.6, 0.2),
        (4.4, 0.2),
        "->",
        label: [
          #align(center)[
            Food Order
          ]
        ],
        bend: -25deg,
      ),


      node((5, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[
        #smallcaps()[
          *Kitchen*
        ]
      ],

      node((3, 2), shape: "circle", stroke: 0.5pt, inset: 8pt)[
        #smallcaps()[
          *Generate* \ *Bill*
        ]
      ],

      edge(
        (2.4, 2.0),
        (1, 0.4),
        "->",
        label: [
          #align(center)[
            Bill
          ]
        ],
        bend: 25deg,
      ),
    )
  ]
]
