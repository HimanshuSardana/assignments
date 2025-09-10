#set page(margin: (y: 50pt))
#set text(font: "Montserrat")
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
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
    - End Users
    - Proprietors of Restaurants
    - Culinary Staff
    - Delivery Associates

  + *Functional Requirements:*
    + *End Users:*
      - Explore available dining establishments
      - Submit food orders
      - Monitor the progress of their orders
      - Complete payment transactions
    + *Proprietors of Restaurants:*
      - Administer menu offerings
      - Access and review incoming orders
      - Modify the status of orders
    + *Culinary Staff:*
      - Receive order notifications
      - Prepare meals as requested
      - Update the status of food preparation
    + *Delivery Associates:*
      - Accept delivery assignments
      - Monitor the status of deliveries
      - Update the status of deliveries

  + *Non-Functional Requirements:*
    - *Performance*: The system must support at least 1,000 simultaneous users.
    - *Security*: All user information shall be securely encrypted.
    - *Usability*: The user interface must be clear, intuitive, and straightforward to use.
    - *Availability*: The system must maintain an uptime of no less than 99.9%.
    - *Scalability*: The system must be capable of expanding to accommodate increased demand during periods of high usage.
]
