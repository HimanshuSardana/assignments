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
    - Proprietors of Restaurants
    - Culinary Staff
    - Delivery Personnel

  + *Functional Requirements:*
    + *Customers:*
      - Explore available restaurants
      - Submit food orders
      - Monitor the status of their orders
      - Complete payments
    + *Proprietors of Restaurants:*
      - Administer menu offerings
      - Access order information
      - Modify the status of orders
    + *Culinary Staff:*
      - Receive order notifications
      - Prepare meals
      - Update the status of food preparation
    + *Delivery Personnel:*
      - Accept delivery assignments
      - Monitor the progress of deliveries
      - Update the status of deliveries
    + *Non-Functional Requirements:*
      - *Performance*: The system must support at least 1000 users simultaneously.
      - *Security*: All user data shall be encrypted.
      - *Usability*: The user interface must be clear and straightforward to use.
      - *Availability*: The system must maintain an uptime of 99.9%.
      - *Scalability*: The system must be capable of accommodating increased demand during peak periods.
]

