#set page(flipped: true)
#set page(margin: (y: 10pt, x: 10pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.1"
#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 3: Use Case Diagram")
#let step(text) = [
  #box(stroke: 1pt, inset: 8pt, radius: 50pt)[
    #text
  ]
]

#let entity(text) = [
  #box(stroke: 1pt, inset: 8pt, radius: 8pt, fill: blue.lighten(70%))[
    #text
  ]
]

#let stickman(name) = [
  #cetz.canvas({
    import cetz.draw: *

    circle((0, 0), radius: 3mm)
    line((0, -0.3), (0, -0.9))
    line((-0.3, -0.5), (0.3, -0.5))

    line((0, -0.9), (-0.3, -1.2))
    line((0, -0.9), (0.3, -1.2))
  })

  #entity(smallcaps(name))
]

#box(stroke: 1pt, width: 100%, inset: 20pt, radius: 4pt)[
  #diagram(
    // entities
    node((-1, 0.7))[#stickman("Customer")],
    node((-1, 4.5))[#stickman("Chef")],
    node((6, 3))[#stickman("Administrator")],

    // Customer
    node((0, 0))[#step("Create Account")],
    node((0, 0.7))[#step("Order Food")],
    node((0, 1.4))[#step("Reserve Table")],

    // Chef
    node((0, 4))[#step("Confirm order")],
    node((0, 4.7))[#step("Semd notification on ready order")],
    node((0, 5.4))[#step("View customer's order")],

    // Administrator
    node((4, 1))[#step("Add New Item to Food Menu")],
    node((4, 2.8))[#step("Delete Item from Food Menu")],
    node((4, 3.6))[#step("Edit prices of Food Items")],
    node((4, 4.4))[#step("View Transactions")],

    // extra
    node((3.5, 2))[#step("Order Drink")],

    // edges
    edge((3.5, 2), (0, 1.4), "-->", label-angle: -10deg)[`<<extend>>`],

    edge((-1, 0.7), (0, 0)),
    edge((-1, 0.7), (0, 0.7)),
    edge((-1, 0.7), (0, 1.4)),

    edge((-1, 4.5), (0, 4)),
    edge((-1, 4.5), (0, 4.7)),
    edge((-1, 4.5), (0, 5.4)),

    edge((6, 3), (4, 1)),
    edge((6, 3), (4, 2.8)),
    edge((6, 3), (4, 3.6)),
    edge((6, 3), (4, 4.4)),
  )
]
