#set page(margin: (y: 50pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 1")

#question("Question")[
  Perform Requirement Elicitation for a Food Delivery System.
  #set enum(numbering: "(a)")
  + List the stakeholders involved.
  + List the functional and non-functional requirements.
]

#solution()[
  #set enum(numbering: "(a)")
  + *Stakeholders:*
    - Customers
    - Restaurant Owners
    - Kitchen Staff
    - Delivery Personnel

  + *Functional Requirements:*
    + *Customers:*
      - Browse restaurants
      - Place orders
      - Track order status
      - Make payments
    + *Restaurant Owners:*
      - Manage menu items
      - View orders
      - Update order status
    + *Kitchen Staff:*
      - Receive orders
      - Prepare food
      - Update order status
    + *Delivery Personnel:*
      - Receive delivery requests
      - Track delivery status
      - Update delivery status
  + *Non-Functional Requirements:*
    - *Performance*: System should handle 1000 concurrent users.
    - *Security*: User data must be encrypted.
    - *Usability*: User interface should be intuitive and easy to navigate.
    - *Availability*: System should be available 99.9% of the time.
    - *Scalability*: System should be able to scale to handle increased load during peak times.
]
