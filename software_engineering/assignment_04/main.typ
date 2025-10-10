#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.1"
#import "temp2.typ": *
#set par(justify: true)
#scale(x: 70%, y: 70%, origin: top + left)[
  #scale(x: 142.86%, y: 142.86%, origin: top + left)[
    #title("Assignment 4: Activity Diagram")

    #question("Question 1")[
      Draw an activity diagram for a Food Ordering System
    ]
  ]

  #v(20mm)
  #solution()[
    #diagram(
      node((0, 0))[#circle(fill: gray, radius: 8pt)],
      edge((0, 0), (0, 1), "->"),
      node((0, 1))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Browse Menu",
      )]],
      edge((0, 1), (0, 2), "->"),
      node((0, 2))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Select Items",
      )]],
      edge((0, 2), (0, 3), "->"),
      node((0, 3))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Add to Cart",
      )]],
      edge((0, 3), (0, 4), "->"),
      node((0, 4))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Place Order",
      )]],
      edge((0, 4), (0, 5), "->"),
      node((0, 5))[#box()[#rotate(45deg)[#square(height: 10pt, fill: gray)]]],
      edge((0, 5), (-2, 5), "-")[Success],
      edge((-2, 5), (-2, 6), "->"),
      edge((0, 5), (2.5, 5), "-")[Order not confirmed],
      edge((2.5, 5), (2.5, 6), "->"),

      node((2.5, 6))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Cancel Order",
      )]],

      //       edge((-2.0, 10.2), (-0.5, 10.2), "->"),
      edge((2.5, 6), (2.5, 10.2), "-"),
      edge((2.5, 10.2), (-0.5, 10.2), "->"),

      node((-2, 6))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Process Payment",
      )]],
      edge((-2, 6), (-2, 6.7), "->"),
      node((-2, 6.7))[#rotate(45deg)[#square(height: 10pt, fill: gray)]],
      edge((-2, 6.7), (-3, 6.7), "-")[Success],
      edge((-3, 6.7), (-3, 7.2), "->"),
      edge((-2, 6.7), (-1, 6.7), "-")[Failed],
      edge((-1, 6.7), (-1, 7.2), "->"),
      node((-3, 7.2))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Prepare Order",
      )]],
      edge((-3, 7.2), (-3, 8), "->"),
      node((-3, 8))[#box()[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Deliver Order",
      )]]],
      edge((-3, 8), (-3, 8.7), "->"),
      node((-3, 8.7))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Confirm Identity",
      )]],
      edge((-3, 8.7), (-3, 9.5), "-"),
      edge((-3, 9.5), (-2.0, 9.5), "->"),

      node((-1, 7.2))[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Notify Payment Failure",
      )]],
      edge((-1, 7.2), (-1, 8), "->"),
      node((-1, 8))[#box()[#box(inset: 8pt, stroke: 1pt, radius: 4pt)[#text(
        "Cancel Order",
      )]]],
      edge((-1, 8), (-1, 9.5), "-"),
      edge((-1, 9.5), (-2.0, 9.5), "->"),

      node((-2.0, 9.5))[#rotate(45deg)[#square(height: 10pt, fill: gray)]],

      edge((-2.0, 9.5), (-2.0, 10.2), "-"),
      edge((-2.0, 10.2), (-0.5, 10.2), "->"),

      node((-0.5, 10.2))[#rotate(45deg)[#square(height: 10pt, fill: gray)]],

      edge((-0.5, 10.2), (-0.5, 11), "->"),
      node((-0.5, 11))[
        #circle(fill: gray, radius: 8pt)[
          #align(center + horizon)[
            #circle(fill: black, radius: 4pt)
          ]
        ]
      ],
    )

  ]
]

