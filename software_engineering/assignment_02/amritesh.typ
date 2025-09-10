
#set page(margin: (y: 50pt))
// #set text(font: "Iosevka NF")
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "temp4.typ": *
#set par(justify: true)

= Assignment 2: Food Delivery System DFD
== Level 0 – Context Diagram

  #block(width: 100%, inset: 10pt, radius: 4pt)[
    #align(center)[
      #diagram(
        node((3, 0), shape: "circle", stroke: 0.5pt, inset: 8pt)[
          Food Delivery System
        ],

        // Customer interactions
        edge((0.7, -0.2), (2.4, -0.2), "->", label: [Order Updates / Bill], bend: 25deg),
        edge((2.4, 0.2), (0.7, 0.2), "->", label: [Place Order], bend: 25deg),
        node((0, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[Customer],

        // Kitchen interactions
        edge((3.7, -0.2), (5.4, -0.2), "->", label: [Food Request], bend: 25deg),
        node((6, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[Kitchen],

        // Manager reports
        edge((3, 1), (3, 1.6), "->", label: [Report]),
        node((3, 2), shape: "rect", stroke: 0.5pt, inset: 8pt)[Manager]
      )
    ]
  ]

== Level 1 – Main Processes
  #block(width: 100%, radius: 4pt, inset: 10pt)[
    #align(center)[
      #diagram(
        // Order processing
        node((3, 0), shape: "circle", stroke: 0.5pt, inset: 8pt)[Process Order],

        // Customer interaction
        edge((0.6, -0.2), (2.5, -0.2), "->", label: [Order / Bill], bend: 25deg),
        edge((2.5, 0.2), (0.6, 0.2), "->", label: [Place Order], bend: 25deg),
        node((0, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[Customer],

        // Kitchen interaction
        edge((3.5, -0.2), (5.4, -0.2), "->", label: [Food Request], bend: 25deg),
        node((6, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[Kitchen],

        // Inventory and Orders storage
        edge((2.8, 1), (2.5, 2.6), "->", label: [Inventory Details], bend: -25deg),
        edge((3.2, 1), (3.5, 2.6), "->", label: [Order Info], bend: 25deg),
        node((2.5, 3), shape: "rect", inset: 8pt)[Inventory DB],
        node((3.5, 3), shape: "rect", inset: 8pt)[Orders DB],

        // Reporting
        edge((2.5, 3), (2.8, 4.3), "->", label: [Inventory Summary], bend: -25deg),
        edge((3.5, 3), (3.3, 4.3), "->", label: [Order Summary], bend: 25deg),
        node((3, 5), shape: "circle", stroke: 0.5pt, inset: 8pt)[Generate Report],
        edge((3, 5.7), (3, 6.6), "->", label: [Report]),
        node((3, 7), shape: "rect", stroke: 0.5pt, inset: 8pt)[Manager]
      )
    ]
  ]


  == Level 2 – Detailed Process
  #align(center)[
    #diagram(
      // Receive order
      node((3, 0), shape: "circle", stroke: 0.5pt, inset: 8pt)[Receive Order],
      edge((1.7, -0.2), (2.4, -0.2), "->", label: [Order Details], bend: 25deg),
      node((1, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[Customer],

      // Send to kitchen
      edge((3.6, 0.2), (4.4, 0.2), "->", label: [Food Request], bend: -25deg),
      node((5, 0), shape: "rect", stroke: 0.5pt, inset: 8pt)[Kitchen],

      // Generate bill
      node((3, 2), shape: "circle", stroke: 0.5pt, inset: 8pt)[Generate Bill],
      edge((2.4, 2.0), (1, 0.4), "->", label: [Bill], bend: 25deg),

      edge((3, 0.9), (3, 1.1), "->", label: [Food Order])
    )
  ]
