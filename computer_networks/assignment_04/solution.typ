#import "@preview/zebraw:0.5.5": *
#show: zebraw

#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 4")

#question("Discuss the GNS simulation environment.")
#solution()[
The GNS (G) simulation environment is a powerful tool designed to facilitate the simulation of various network protocols and systems. It provides a flexible framework that allows users to create, configure, and run simulations of network scenarios. The environment supports a wide range of protocols, including TCP/IP, UDP, and others, enabling users to model complex network behaviors. \
]

#question()[
  Connect one PC with another PC as per diagram below. \
  #image("q1.png")
]
#solution()[
  #align(center)[
    #image("q1p1.png", height: 80pt)
  ]

  #text()[
  
  ]

  *Ping Results* (from `192.168.1.1`) \
  #zebraw(numbering: false)[
    ```txt
    C:\>ping 192.168.1.2

    Pinging 192.168.1.2 with 32 bytes of data:

    Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
    Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
    Reply from 192.168.1.2: bytes=32 time<1ms TTL=128

    Ping statistics for 192.168.1.2:
      Packets: Sent = 3, Received = 3, Lost = 0 (0% loss),
    Approximate round trip times in milli-seconds:
      Minimum = 0ms, Maximum = 0ms, Average = 0ms
    ```
  ]
]

#question()[
  Connect a PC with Router Ethernet port as shown below.
  #image("q2.png")
]

#solution()[
  #align(center)[
    #image("q3p1.png", height: 80pt)
  ]
  *Simulation Results*
    #image("q3p2.png")

  *Ping Results* (from `10.128.20.1`) \
  #zebraw(numbering: false)[
    ```txt
    C:\>ping 10.128.20.254

    Pinging 10.128.20.254 with 32 bytes of data:

    Reply from 10.128.20.254: bytes=32 time<1ms TTL=255
    Reply from 10.128.20.254: bytes=32 time<1ms TTL=255
    Reply from 10.128.20.254: bytes=32 time<1ms TTL=255
    Reply from 10.128.20.254: bytes=32 time<1ms TTL=255

    Ping statistics for 10.128.20.254:
        Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
    Approximate round trip times in milli-seconds:
        Minimum = 0ms, Maximum = 0ms, Average = 0ms
    ```
  ]

]

#question()[
  Create a network of 2 PCs as shown below.
  #image("q3.png")
]
#solution()[
  #align(center)[
    #image("q4p1.png", height: 100pt)
  ]

  *Ping Results* (from `192.168.1.1`)
  #zebraw(numbering: false)[
  ```txt
  C:>ping 192.168.1.2

  Pinging 192.168.1.2 with 32 bytes of data:

  Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
  Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
  Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
  Reply from 192.168.1.2: bytes=32 time<1ms TTL=128

  Ping statistics for 192.168.1.2:
  Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
  Approximate round trip times in milli-seconds:
  Minimum = 0ms, Maximum = 0ms, Average = 0ms
  ```]

]

#question()[
  Connect 2 PCs with a Switch below.
  #image("q4.png")
]

#solution()[
  #align(center)[
    #image("q5.png", height: 100pt)
  ]

  *Simulation Results*
  #image("q5p1.png")

  *Ping Results* (from `192.168.1.1`)
  #zebraw(numbering: false)[
  ```txt
Query successful

C:>ping 192.168.1.2

Pinging 192.168.1.2 with 32 bytes of data:

Reply from 192.168.1.2: bytes=32 time=1ms TTL=128
Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
Reply from 192.168.1.2: bytes=32 time<1ms TTL=128
Reply from 192.168.1.2: bytes=32 time=1ms TTL=128

Ping statistics for 192.168.1.2:
Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
Minimum = 0ms, Maximum = 1ms, Average = 0ms
  ```]

]

