#import "temp2.typ": *
#set par(justify: true)
#title("Assignment 1")

#question(
  "Discuss the concept of Networking, advantages, disadvantages and applications.",
)
#solution()[
  Networking is the practice of connecting computers and other devices to share resources and information. It allows for communication between devices, enabling data transfer, resource sharing, and collaboration.

  Advantages of networking include:
  - Resource sharing: Devices can share printers, files, and internet connections.
  - Communication: Enables email, messaging, and video conferencing.
  - Centralized management: Easier to manage resources and security from a central point.
  - Scalability: Networks can be expanded easily by adding new devices.

  Disadvantages include:
  - Security risks: Networks can be vulnerable to unauthorized access and attacks.
  - Complexity: Setting up and maintaining networks can be complicated.
  - Cost: Initial setup and ongoing maintenance can be expensive.

  Applications of networking include:
  - Business operations: Facilitating communication and data sharing in organizations.
  - Internet access: Connecting users to the global internet.
  - Online services: Enabling cloud computing, online gaming, and streaming services.
]

#question("Discuss the peer-to-peer connections and multipoint connection.")
#solution()[
  - *Peer-to-peer* (P2P) connections allow devices to communicate directly with each other without a central server. Each device, or peer, can act as both a client and a server, sharing resources and data directly. This model is often used in file sharing applications and decentralized networks.
  - *Multipoint connections* involve multiple devices communicating over a single connection. This can be achieved through technologies like multicast or broadcast, where data is sent to multiple recipients simultaneously. Multipoint connections are commonly used in video conferencing and live streaming applications.
]

#question("Discuss the components required to make a computer network")
#solution()[
  To create a computer network, the following components are typically required:
  - *Network Interface Cards (NICs)*: Hardware that allows devices to connect to the network.
  - *Cabling*: Physical cables (like Ethernet cables) that connect devices.
  - *Switches*: Devices that connect multiple devices on a network and manage data traffic.
  - *Routers*: Devices that route data between different networks, such as connecting a local network to the internet.
  - *Access Points*: Wireless devices that allow wireless devices to connect to a wired network.
  - *Modems*: Devices that modulate and demodulate signals for internet connectivity.
  - *Firewalls*: Security devices that monitor and control incoming and outgoing network traffic.
]

#question("Discuss the types of networks as LAN, WAN and MAN.")
#solution()[
  - *LAN (Local Area Network)*: A network that covers a small geographic area, such as a home, office, or building. LANs typically use Ethernet or Wi-Fi technologies and are characterized by high data transfer rates and low latency.
  - *WAN (Wide Area Network)*: A network that covers a large geographic area, such as a city, country, or even globally. WANs connect multiple LANs and use technologies like leased lines, satellite links, or the internet to transmit data over long distances.
  - *MAN (Metropolitan Area Network)*: A network that spans a city or a large campus, connecting multiple LANs within that area. MANs are typically used by organizations to connect their offices and facilities within a metropolitan region. They can use fiber optics or wireless technologies for high-speed data transfer.
]

#question("Differentiate between physical and logical topologies.")
#solution()[
  #table(columns: (
      1fr,
      1fr,
    ))[*Physical Topology*][*Logical Topology*][Actual physical layout of devices (cables, switches, routers)][Data flow pattern in the network][Defines how devices are connected in space][Defines how devices communicate][Examples: Star, Bus, Ring, Mesh][Examples: Logical Bus, Logical Ring][Fixed by hardware setup][Can change without altering hardware]
]

#question(
  "List the different types of networks from surroundings as client-server network, distributed networks, peer-to-peer networks and cloud based networks.",
)
#solution()[
  - *Client-Server Network*: A network architecture where clients (devices requesting services) connect to a central server (providing services). The server manages resources and provides data to clients.
  - *Distributed Network*: A network where processing and data storage are distributed across multiple devices rather than being centralized. This enhances reliability and performance.
  - *Peer-to-Peer Network*: A decentralized network where each device (peer) can act as both a client and a server, sharing resources directly with other peers without a central authority.
  - *Cloud-Based Network*: A network that relies on cloud computing services, allowing users to access resources and applications over the internet rather than relying on local servers or devices.
]

#question("Discuss the concept of Network Topologies")
#solution()[
  Network topologies refer to the arrangement of different elements (links, nodes, etc.) in a computer network. The topology defines how devices are interconnected and how data flows within the network. Common types of network topologies include:

  - *Star Topology*: All devices are connected to a central hub or switch. This allows for easy management and isolation of devices but can create a single point of failure.
  - *Bus Topology*: All devices share a single communication line (bus). It is simple and cost-effective but can lead to performance issues as more devices are added.
  - *Ring Topology*: Devices are connected in a circular fashion, with each device connected to two others. Data travels in one direction, reducing collisions but making it vulnerable to failure if one device goes down.
  - *Mesh Topology*: Every device is connected to every other device, providing high redundancy and reliability. However, it can be complex and expensive to implement.
  - *Hybrid Topology*: A combination of two or more topologies, allowing for flexibility and scalability while leveraging the strengths of each type.
]

#question("Protocols and their usage e.g. TCP/IP, http, https, ftp.")
#solution()[
  - *TCP/IP (Transmission Control Protocol/Internet Protocol)*: A suite of communication protocols used to interconnect network devices on the internet. It ensures reliable data transmission and routing of packets across networks.
  - *HTTP (Hypertext Transfer Protocol)*: The protocol used for transmitting web pages over the internet. It defines how messages are formatted and transmitted, allowing web browsers to request and display content from web servers.
  - *HTTPS (HTTP Secure)*: An extension of HTTP that uses encryption (SSL/TLS) to secure data transmitted between a web browser and a server, ensuring privacy and integrity of the data.
  - *FTP (File Transfer Protocol)*: A standard network protocol used to transfer files from one host to another over a TCP-based network, such as the internet. It allows users to upload, download, and manage files on remote servers.
]
