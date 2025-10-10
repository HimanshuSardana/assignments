#import "temp2.typ": *
#set par(justify: true)
#title("Assignment 5: Scrum Simulation")

#question("Question 1")[
  Play the roles of Scrum Master, Product Owner, and Development Team in a simulated Scrum project.
]

#solution()[
  #v(2mm)
  #smallcaps()[*Project*]: \
  The project comprises of a *Food Ordering System* that allows users to browse a restaurant menu, place orders, and track their order status online.

  #smallcaps()[*Product Backlog*]: \
  The system should allow users to: \
  + View the restaurant menu with item details and prices \
  + Add items to a cart \
  + Place an order \
  + Track the status of their order \

  #line(length: 100%, stroke: 0.3pt)
  #smallcaps()[*Sprint Backlog(s)*]:
  #v(-2mm)
  #grid(columns: (1fr, 1fr), column-gutter: 4pt)[
    #smallcaps()[*Sprint 1*] \
    Display the menu to users \

    #smallcaps()[*Sprint 2*] \
    Enable adding and removing items from the cart \
  ][
    #smallcaps()[*Sprint 3*] \
    Allow users to place an order \

    #smallcaps()[*Sprint 4*] \
    Provide real-time order tracking \
  ]
  #line(length: 100%, stroke: 0.3pt)
  #grid(columns: (1fr, 1fr), column-gutter: 16pt, row-gutter: 20pt)[
    #smallcaps()[*Sprint 1*]: \
    *Sprint Planning*: The team plans to implement the menu display feature. The Product Owner clarifies that users should be able to view a categorized list of food items, each with a name, description, image, and price. \
    *Daily Scrum*: The team discusses UI layout decisions, ensures that all menu items load correctly, and resolves any technical issues with the display. \
    *Sprint Review*: The team demonstrates the functioning menu display to stakeholders, showing how users can scroll through and view food details. \
    *Sprint Retrospective*: The team discusses improving image loading times and simplifying category navigation. \
    *Increment*: The system now displays a complete digital menu where users can browse items easily. \
  ][
    #smallcaps()[*Sprint 2*]: \
    *Sprint Planning*: The team focuses on implementing a shopping cart system, allowing users to select, add, or remove food items. \
    *Daily Scrum*: The team works on maintaining accurate item quantities and ensuring that the total price updates dynamically. \
    *Sprint Review*: The cart functionality is demonstrated — users can now modify their selections before checkout. \
    *Sprint Retrospective*: The team identifies ways to streamline the cart interface and improve user feedback when items are added. \
    *Increment*: The application now allows users to manage their selected items within a virtual cart. \
  ][
    #smallcaps()[*Sprint 3*]: \
    *Sprint Planning*: The team plans to add the order placement process, including order confirmation and payment options. \
    *Daily Scrum*: The team collaborates to design an intuitive checkout flow, handling user details and payment confirmation screens. \
    *Sprint Review*: Stakeholders view a demonstration of users successfully placing and confirming their food orders. \
    *Sprint Retrospective*: The team discusses ways to simplify payment validation and improve order confirmation notifications. \
    *Increment*: Users can now place an order through the system and receive confirmation upon successful payment. \
  ][
    #smallcaps()[*Sprint 4*]: \
    *Sprint Planning*: The team focuses on creating the order tracking module, enabling users to monitor their order status (e.g., preparing, out for delivery, delivered). \
    *Daily Scrum*: The team integrates real-time updates with simulated order status changes. \
    *Sprint Review*: The tracking interface is shown to stakeholders, demonstrating live order progress. \
    *Sprint Retrospective*: The team discusses improving status refresh rates and adding push notifications in future iterations. \
    *Increment*: The system now supports real-time order tracking, providing customers with live updates about their food delivery. \
  ]
]

