#set page(margin: (y: 50pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 1: Requirement Elicitation")

= #text(fill: blue)[Food Delivery System]
#v(2mm)
#box(stroke: (thickness: 1pt, paint: blue, dash: "dashed"),  radius: 4pt)[
  #align(left)[
    #box(fill: blue.lighten(70%), width: 100%, inset: 10pt, stroke: (thickness: 1pt, paint: blue, dash: "dashed"), radius: 4pt)[
      == #text(fill: black, size: 12pt)[Functional Requirements]
    ]
  ]
  #v(-4mm)
  #box(inset: 10pt)[
    === Customers
    + The system should allow customers to place orders for food from various restaurants.
    + The system should provide a menu for each restaurant.
    + The system should allow customers to customize their orders (e.g., add/remove items, specify preferences).
    + The system should allow customers to track the status of their orders.

    === Kitchen Staff
    + The system should allow kitchen staff to view incoming orders.
    + The system should allow kitchen staff to update the status of orders (e.g., preparing, ready for delivery).
    + The system should allow kitchen staff to manage the menu items (add, update, remove).
    + The system should allow kitchen staff to view order history.

    === Restaurant Owners
    + The system should allow restaurant owners to manage their restaurant profiles.
    + The system should allow restaurant owners to view sales reports and analytics.
    + The system should allow restaurant owners to manage their menu items and prices.
    + The system should allow restaurant owners to respond to customer feedback.

    === Delivery Personnel
    + The system should allow delivery personnel to view assigned orders.
    + The system should allow delivery personnel to update the status of orders (e.g., out for delivery, delivered).
  ]
]

#block(stroke: (thickness: 1pt, paint: blue, dash: "dashed"),  radius: 4pt)[
  #align(left)[
    #block(fill: blue.lighten(70%), width: 100%, inset: 10pt, stroke: (thickness: 1pt, paint: blue, dash: "dashed"), radius: 4pt)[
      == #text(fill: black, size: 12pt)[Non-Functional Requirements]
    ]
  ]
  #v(-4mm)
  #block(inset: 10pt)[
    === Performance
    + The system should handle a lot of simultaneous users without performance degradation.
    + The system should process orders within a few seconds on average.

    === Usability
    + The system should have an intuitive user interface for customers, restaurants, and delivery personnel.
    + The system should provide help and support features for users.

    === Security
    + The system should ensure secure transactions and protect user data.
    + The system should implement authentication and authorization mechanisms for different user roles (customers, restaurants, delivery personnel).

    === Scalability
    + The system should be able to scale horizontally to accommodate an increasing number of users and orders.
    + The system should support adding new restaurants and delivery personnel without significant downtime.
  ]
]

