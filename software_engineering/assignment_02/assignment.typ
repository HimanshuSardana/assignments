#set page(margin: (y: 50pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 2: Data Flow Diagrams")

// = #text(fill: blue)[Food Delivery System]

#box(inset: 8pt, stroke: (thickness: 1pt, dash: "dashed", paint: blue))[#smallcaps()[#text(fill: blue, weight: "bold")[Level 0]]]

#box(width: 100%, inset: 10pt, radius: 4pt)[
  #align(center)[
    #diagram(
      node((3, 0), shape: "circle", stroke: 1pt, inset: 8pt)[
        *Food Delivery* \ *System*
      ],
      edge((0.6, -0.2), (2.3, -0.2), "->", label: [
        #smallcaps()[
          #align(center)[
            Order Updates \
            Bill
          ]
        ]
      ], bend: 25deg),
      edge((2.3, 0.2), (0.6, 0.2), "->", label: [
        #smallcaps()[Place Order]
      ], bend: 25deg),
      node((0, 0), shape: "rect", stroke: 1pt, inset: 8pt)[
        *Customer*
      ],
      edge((3.7, -0.2), (5.4, -0.2), "->", label: [
        #smallcaps()[
          #align(center)[
            Food Order
          ]
        ]
      ], bend: 25deg),

      node((6, 0), shape: "rect", stroke: 1pt, inset: 8pt)[
        *Kitchen*
      ],

      edge((3, 1), (3, 1.6), "->", label: [
        #smallcaps()[
          #align(center)[
            Report
          ]
        ]
      ], bend: 25deg),

      node((3, 2), shape: "rect", stroke: 1pt, inset: 8pt)[
        *Manager*
      ]
    )
  ]
]

#pagebreak()
#box(inset: 8pt, stroke: (thickness: 1pt, dash: "dashed", paint: blue))[#smallcaps()[#text(fill: blue, weight: "black")[Level 1]]]

#v(2mm)
#box(width: 100%, radius: 4pt, inset: 10pt)[
  #align(center)[
    #diagram(
      node((3, 0), shape: "circle", stroke: 1pt, inset: 8pt)[
        *Order* \ *Processing*
      ],
      edge((0.6, -0.2), (2.5, -0.2), "->", label: [
        #smallcaps()[
          #align(center)[
            Order \
            Bill
          ]
        ]
      ], bend: 25deg),
      edge((2.5, 0.2), (0.6, 0.2), "->", label: [
        #smallcaps()[Place Order]
      ], bend: 25deg),
      node((0, 0), shape: "rect", stroke: 1pt, inset: 8pt)[
        *Customer*
      ],
      edge((3.5, -0.2), (5.4, -0.2), "->", label: [
        #smallcaps()[
          #align(center)[
            Food Order
          ]
        ]
      ], bend: 25deg),

      node((6, 0), shape: "rect", stroke: 1pt, inset: 8pt)[
        *Kitchen*
      ],

      edge((2.8, 1), (2.5, 2.6), "->", label: [
        #smallcaps()[
          #align(center)[
            Inventory Details
          ]
        ]
      ], bend: -25deg),

      edge((3.2, 1), (3.5, 2.6), "->", label: [
        #smallcaps()[
          #align(center)[
            Order
          ]
        ]
      ], bend: 25deg),


      node((2.5, 3), shape: "rect", inset: 8pt)[
        #box(inset: 8pt, stroke: (top: 1pt, bottom: 1pt))[ 
          *Inventory*
        ]
      ],

      node((3.5, 3), shape: "rect", inset: 8pt)[
        #box(stroke: (top: 1pt, bottom: 1pt), inset: 8pt)[
          *Orders*
        ]
      ],

      edge((2.5, 3), (2.8, 4.3), "->", bend: -25deg, label: [#smallcaps()[Inventory Details]]),

      edge((3.5, 3), (3.3, 4.3), "->", bend: 25deg, label: [#smallcaps()[Order Details]]),

      node((3, 5), shape: "circle", stroke: 1pt, inset: 8pt)[
        *Generate* \ *Report*
      ],

      edge((3, 5.7), (3, 6.6), "->", label: [
        #smallcaps()[
          #align(center)[
            Report
          ]
        ]
      ], bend: 25deg),

      node((3, 7), shape: "rect", stroke: 1pt, inset: 8pt)[
        *Manager*
      ],
    )
  ]
]


#box(inset: 8pt, stroke: (thickness: 1pt, dash: "dashed", paint: blue))[#smallcaps()[#text(fill: blue, weight: "bold")[Level 2]]]
#v(2mm)
#align(center)[
  #diagram(
    node((3, 0), shape: "circle", stroke: 1pt, inset: 8pt)[
      *Receive* \ *Order*
    ],

    edge((1.65, -0.2), (2.4, -0.2), "->", label: [
      #smallcaps()[
        #align(center)[
          Order Details
        ]
      ]
    ], bend: 25deg),

    node((1, 0), shape: "rect", stroke: 1pt, inset: 8pt)[
      *Customer*
    ],

    edge((3.6, 0.2), (4.4, 0.2), "->", label: [
      #smallcaps()[
        #align(center)[
          Food Order
        ]
      ]
    ], bend: -25deg),


    node((5, 0), shape: "rect", stroke: 1pt, inset: 8pt)[
      *Kitchen*
    ],

    node((3, 2), shape: "circle", stroke: 1pt, inset: 8pt)[
      *Generate* \ *Bill*
    ],

    edge((2.4, 2.0), (1, 0.4), "->", label: [
      #smallcaps()[
        #align(center)[
          Bill
        ]
      ]
    ], bend: 25deg),




  )
]

