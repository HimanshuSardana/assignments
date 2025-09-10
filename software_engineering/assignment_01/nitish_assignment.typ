#set page(margin: (y: 50pt))
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "temp2.typ": *
#set par(justify: true)

#set text(font: "Montserrat")

#title("Assignment 1")

#question("Question")[
  Perform the process of Requirement Elicitation for a Food Delivery System.
  #set enum(numbering: "(a)")
  + Identify the stakeholders involved.
  + Enumerate the functional and non-functional requirements.
]

#solution()[
  #set enum(numbering: "(a)")
  + *Stakeholders:*
    - Individuals placing food orders (Customers)
    - Owners of restaurants
    - Staff responsible for food preparation (Kitchen Staff)
    - Personnel responsible for delivering orders (Delivery Personnel)

  + *Functional Requirements:*
    + *Customers:*
      - Ability to browse available restaurants
      - Capability to place food orders
      - Facility to monitor the status of their orders
      - Option to make payments for orders
    + *Restaurant Owners:*
      - Ability to manage and update menu items
      - Access to view incoming orders
      - Capability to update the status of orders
    + *Kitchen Staff:*
      - Access to receive new orders
      - Responsibility to prepare ordered food items
      - Ability to update the status of food preparation
    + *Delivery Personnel:*
      - Access to receive delivery assignments
      - Capability to track the status of deliveries
      - Ability to update the delivery status

  + *Non-Functional Requirements:*
    - *Performance*: The system should efficiently support at least 1000 users simultaneously.
    - *Security*: All user data must be securely encrypted.
    - *Usability*: The user interface should be clear, intuitive, and easy to use.
    - *Availability*: The system should maintain an uptime of 99.9%.
    - *Scalability*: The system should be capable of accommodating increased usage during peak periods.
]
