#import "@preview/zebraw:0.5.5": *
#show: zebraw

#import "temp2.typ": *
#set par(justify: true)

#title("Assignment 5")

#question()[
  Create BUS topologies as below.

  (a)
  #image("q1a.png")

  (b)
  #image("q1b.png")
]

#solution()[
  #align(center)[
    #image("a1a.png", width: 70%) 
  ]

  *Ping Results* (from 192.168.1.1)
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
      ```
  
  #align(center)[
    #image("a1b.png", width: 70%) 
  ]

  *Ping Results* (from 192.168.1.1)
  ```txt
  C:\>ping 192.168.1.4

  Pinging 192.168.1.4 with 32 bytes of data:

  Reply from 192.168.1.4: bytes=32 time=19ms TTL=128
  Reply from 192.168.1.4: bytes=32 time=5ms TTL=128
  Reply from 192.168.1.4: bytes=32 time=11ms TTL=128
  Reply from 192.168.1.4: bytes=32 time=7ms TTL=128

  Ping statistics for 192.168.1.4:
      Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
  Approximate round trip times in milli-seconds:
      Minimum = 5ms, Maximum = 19ms, Average = 10ms
  ```
]

#question()[
  Create the following Ring Topology

  #image("q2.png")
]

#solution()[
  #align(center + horizon)[
    #box(fill: orange.lighten(70%), inset: 10pt, radius: 4pt, stroke: 1pt + orange)[
      #align(center)[
        Invalid question \
        Loop nhi bnta \
      ]
    ]
  ]
  ]

#question()[
  Create the following Ring Topology

  #image("q3.png")
]

#solution()[
  #align(center)[
    #image("a3.png", width: 70%)
  ]

  *Ping Results* (from 192.168.1.1)
  ```txt
    Pinging 192.168.1.3
    Pinging 192.168.1.3 with 32 bytes of data:

    Reply from 192.168.1.3: bytes=32 time<1ms TTL=128
    Reply from 192.168.1.3: bytes=32 time<1ms TTL=128
    Reply from 192.168.1.3: bytes=32 time<1ms TTL=128
    Reply from 192.168.1.3: bytes=32 time<1ms TTL=128

    Ping statistics for 192.168.1.3:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
    Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 0ms, Average = 0ms
  ```
]

#question()[
  Create the following Tree Topology

  #align(center)[
    #image("q4.png", width: 80%)
  ]
]

#solution()[
  #align(center)[
    #image("a4.png", width: 70%)
  ]

  *Ping Results* (from 192.168.1.1)
  ```txt
  Pinging 192.168.1.7
  Pinging 192.168.1.7 with 32 bytes of data:

  Reply from 192.168.1.7: bytes=32 time<1ms TTL=128
  Reply from 192.168.1.7: bytes=32 time<1ms TTL=128
  Reply from 192.168.1.7: bytes=32 time<1ms TTL=128
  Reply from 192.168.1.7: bytes=32 time<1ms TTL=128

  Ping statistics for 192.168.1.7:
  Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
  Approximate round trip times in milli-seconds:
  Minimum = 0ms, Maximum = 0ms, Average = 0ms
  ```
]

