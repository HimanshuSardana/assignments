#set page(margin: (y: 50pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 1")

#question("Question")[
  Perform Requirement Elicitation for a Food Delivery System.
  #set enum(numbering: "(a)")
  + Identify the stakeholders associated with the system.
  + Enumerate the functional and non-functional requirements.
]
#solution()[
  #set enum(numbering: "(a)")
  + *Stakeholders:*
    - Customers
    - Restaurant Owners
    - Kitchen Staff
    - Delivery Drivers

  + *Functional Requirements:*
    + *Customers:*
      - Browse restaurants
      - Place orders
      - Track orders
      - Pay for food
    + *Restaurant Owners:*
      - Manage menus
      - View orders
      - Update order status
    + *Kitchen Staff:*
      - Get order alerts
      - Cook food
      - Mark food as ready
    + *Delivery Drivers:*
      - Get delivery jobs
      - Track deliveries
      - Update delivery status
    + *Non-Functional Requirements:*
      - *Performance*: Supports 1000+ users at once.
      - *Security*: User data is encrypted.
      - *Usability*: Easy to use interface.
      - *Availability*: 99.9% uptime.
      - *Scalability*: Handles more users during busy times.
]

