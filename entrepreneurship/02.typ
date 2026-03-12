#set page(
  flipped: true,
  fill: gray.lighten(30%),
  margin: (x: 2em, y: 2em),
  paper: "a3",
)
#set par(justify: true)
#set text(font: "FreeSans")

#show heading.where(level: 1): it => [
  #text(size: 20pt, weight: "black", it)
]

#let num(number) = text(
  size: 70pt,
  weight: "black",
  fill: gray.transparentize(70%),
)[#number]


#show heading.where(level: 3): it => [
  #v(-3mm)
  #text(fill: gray.darken(60%))[#smallcaps()[#it]]
  #v(-3.2mm)
  #line(length: 100%, stroke: gray)
]


#show heading.where(level: 2): it => [
  #v(-2mm)
  _#text(size: 10pt, weight: "extralight", fill: gray.darken(50%), it)_
  #v(2mm)
]


#grid(columns: (1fr, 2fr, 1fr), column-gutter: 5pt)[
  #box(width: 100%)[
    #text(size: 24pt, weight: "bold")[Opportunity Canvas]
  ]
][
  #box(width: 100%, fill: white, inset: 8pt)[
    #text(size: 10pt)[Title:] \
    #box()[
      #text(
        size: 16pt,
        weight: "bold",
      )[BroBorrow: A P2P Rental Marketplace for College Students]
    ]
  ]
][
  #stack(dir: ttb, spacing: -4pt)[
    #box(width: 100%, fill: white, inset: 5pt)[
      #text(size: 8pt)[Problem:]
      #box()[
        #text(
          size: 10pt,
          weight: "bold",
        )[Feb 2026]
      ]
    ]
    #v(-3mm)
    #box(width: 100%, fill: white, inset: 5pt)[
      #text(size: 8pt)[Iteration:]
      #box()[
        #text(
          size: 10pt,
          weight: "bold",
        )[3rd]
      ]
    ]
  ]
]

#box(stroke: 8pt)[
  #set text(size: 10pt)
  #grid(columns: (1fr, 1fr, 1fr, 1fr, 1fr), gutter: 0em)[
    #box(fill: white, inset: 12pt, stroke: 2pt, height: 54.2%)[
      #place(bottom + right, float: false)[
        #num(2)
      ]
      = Users & Customers
      == What types of users and customers have the challenges your solution addresses?
      === Primary Users
      - College students (1st–4th year / PG) living in hostels, PGs, or small rented flats
      - Budget-conscious young adults (18–25 years) \

      === Geographic Focus
      - Especially in Tier-2 cities

      === Behavioral Traits
      - Buy impulse items but use them rarely
      - Friends/roommates who borrow informally but want a safer, wider network
    ]
  ][
    #stack(dir: ttb)[
      #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
        #place(bottom + right, float: false)[#num(1)]
        = Problems
        == What problems do prospective users and customers have today that your solution addresses?
        - Idle items clutter tiny hostel/PG rooms (e.g., exam calculator used 2 weeks/year, cycle gathering dust)
        - Short-term needs but no easy/affordable way to access items without buying new (tight pocket money)
        - Informal borrowing from friends is unreliable, limited, or awkward, no trust/verification for strangers
      ]
    ][
      #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
        #place(bottom + right, float: false)[#num(3)]

        = Solutions Today
        == How do users address their problems today?
        - Buy cheap/low-quality items and let them pile up or throw away
        - Borrow awkwardly from batchmates/roommates (limited variety, delays, favors)
        - Use niche apps (e.g. Zoomcar for vehicles, Furlenco for furniture) or general ones (OLX for buying used)
        - Go without the item or spend unnecessarily
      ]
    ]
  ][
    #box(fill: white, inset: 12pt, stroke: 2pt, height: 54.2%)[
      #place(bottom + right, float: false)[#num(1)]
      = Solution Ideas
      == List product, feature, or enhancement ideas that solve problems for your target audience.
      === Core Platform Features
      - Simple mobile app for listing/borrowing any everyday item
      - AI smart matching for nearby relevant items
      - Short-term rentals (hours to weeks)

      === Trust & Safety
      - Mandatory student ID/college email verification
      - Ratings & reviews for users
      - Security fee for high-value items
      - 24/7 support for disputes

      === Payments & Logistics
      - Low fees (10–15%)
      - UPI payments + small deposit
      - Campus-first mode (filter by college/hostel)
      - Doorstep/handover points near campuses
    ]
  ][
    #stack(dir: ttb)[
      #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
        #place(bottom + right, float: false)[#num(4)]

        = User Value
        == If your target audience has your solution, how can they do things differently as a consequence? And, how will that benefit them?
        - Borrow instead of buy → save anywhere from ₹50–5,000 per item, less clutter in small rooms
        - Rent out idle stuff → earn some money
        - Access wider variety safely via verified student network → no awkward favors, more convenience & sustainability
      ]
    ][
      #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
        #place(bottom + right, float: false)[#num(6)]

        = Adoption Strategy
        == How will customers and users discover and adopt your solution?
        - Launch beta in Punjab colleges (Thapar, PEC, etc.) via fresher orientations & WhatsApp groups
        - Social media (Instagram Reels, college pages) + free first rentals to initial users
      ]
    ]
  ][
    #box(fill: white, inset: 12pt, stroke: 2pt, height: 54.2%)[
      #place(bottom + right, float: false)[#num(5)]

      = User Metrics
      == What user behaviors can you measure that will indicate they adopt, use, and place value in your solution?
      === Engagement Metrics
      - Repeat rentals/borrows per user
      - Number of searches or item views per active user per week

      === Marketplace Health
      - Items listed vs. rented out (Utilization Rate)
      - Average time to match a borrower with a lender
      - Buyer vs Supply Ratio

      === Retention & Satisfaction
      - NPS / satisfaction score from post-rental feedback
      - Low churn
    ]
  ]
  #v(-5mm)
  #grid(columns: (2fr, 1fr, 2fr))[
    #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
      #place(bottom + right, float: false)[#num(7)]

      = Business Problems
      == What problem for your business does building this product, feature, or enhancement solve for your business?
      === Market Opportunity
      - Monetization of idle student assets in growing sharing economy
      - Increase penetration of rental apps in Tier-2 cities

      === Competitive Advantage
      - Early entry into Punjab college ecosystem
      - Strong supply proof: 69.2% calculators, 53.8% books/notes unused

      === Revenue Potential
      - Commission-based recurring revenue model
      - High-frequency microtransactions
    ]
  ][
    #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
      #place(bottom + right, float: false)[#num(9)]

      = Budget
      == What's it worth to us
      - MVP build + launch: ₹12,000 (Flutter/React Native app, VPS hosting, basic marketing)
      - High ROI potential: High survey traction (92.3% interest) suggests strong early adoption and low CAC
    ]
  ][
    #box(fill: white, inset: 12pt, stroke: 2pt, width: 100%, height: 27.1%)[
      #place(bottom + right, float: false)[#num(8)]

      = Business Metrics
      == What business metrics can you measure that will indicate the product, feature, or enhancement is successful for your business?
      === Growth Metrics
      - Monthly active users (MAU) growth
      - Viral coefficient

      === Revenue Metrics
      - Gross transaction value (GMV)
      - Platform fee revenue

      === Efficiency Metrics
      - CAC:LTV ratio
      - Retention rate
    ]
  ]
]
