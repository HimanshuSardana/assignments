#import "temp2.typ": *

#title("Assignment 2")

#question("Network Interface Cards - their use, types and working.")
#solution()[
Network Interface Cards (NICs) are hardware components that allow computers to connect to a network. They can be used for both wired and wireless connections, enabling communication between devices over a network.

Types of Network Interface Cards include:
+ *Ethernet NICs*: These are the most common type, used for wired connections. They connect to a network via an Ethernet cable and can support various speeds, such as 10/100/1000 Mbps.
+ *Wireless NICs*: These cards allow devices to connect to wireless networks (Wi-Fi). They use radio waves to communicate with a wireless router or access point.
+ *Fiber Optic NICs*: These are used for high-speed connections over long distances, utilizing fiber optic cables.

The working of a NIC involves converting data from the computer into a format suitable for transmission over the network. It handles the physical and data link layers of the OSI model, managing tasks such as framing, addressing, and error detection. When data is sent, the NIC encapsulates it into frames, adds necessary headers (like MAC addresses), and transmits it over the network medium. Upon receiving data, it performs the reverse process, extracting the information and passing it to the operating system for further processing.
]

#question("Hub Device and its’ working.")
#solution()[
  A Hub is a basic networking device that connects multiple Ethernet devices, making them act as a single network segment. It operates at the physical layer (Layer 1) of the OSI model and is used to extend the range of a network. \
  Hubs work by receiving data packets from one device and broadcasting them to all other connected devices. When a device sends data to the hub, the hub does not filter or direct the data; instead, it simply forwards the data to all ports. This means that all devices connected to the hub receive the same data, regardless of whether they are the intended recipient.
]

#question("Switch Device and its’ working.")
#solution()[
  A Switch is a more advanced networking device that connects multiple devices within a local area network (LAN). Unlike a hub, which broadcasts data to all connected devices, a switch intelligently forwards data only to the specific device for which it is intended. \
  Switches operate at the data link layer (Layer 2) of the OSI model and use MAC addresses to determine the destination of incoming data packets. When a switch receives a data packet, it examines the MAC address in the packet header and checks its MAC address table to find out which port corresponds to that address. It then forwards the packet only to the appropriate port, reducing network congestion and improving overall performance.
]

#question("Router Device and its’ working")
#solution()[
  A Router is a networking device that connects multiple networks and directs data traffic between them. It operates at the network layer (Layer 3) of the OSI model and is responsible for determining the best path for data packets to travel across networks. \
  When a router receives a data packet, it examines the destination IP address in the packet header. Using its routing table, which contains information about various networks and their paths, the router determines the most efficient route for the packet. It then forwards the packet to the next hop on that route, which could be another router or the final destination device.
]

#question("Bridge device and its’ working.")
#solution()[
  A Bridge is a networking device that connects and filters traffic between two or more network segments, allowing them to function as a single network. It operates at the data link layer (Layer 2) of the OSI model and is used to reduce network collisions and improve performance. \
  When a bridge receives data from one network segment, it examines the MAC address in the packet header. If the destination MAC address is on the same segment, the bridge forwards the packet only to that segment. If the destination is on a different segment, the bridge forwards the packet to that segment, effectively filtering traffic and reducing unnecessary data transmission across segments.
]

#question("Types of networking wires and connectors, shapes and specifications.")
#solution()[
Networking wires and connectors are essential components for establishing wired network connections. Here are some common types:
  + *Twisted Pair Cables*: These cables consist of pairs of wires twisted together to reduce electromagnetic interference. They come in two main categories:
    - *Unshielded Twisted Pair (UTP)*: Commonly used in Ethernet networks, UTP cables are cost-effective and easy to install.
    - *Shielded Twisted Pair (STP)*: These cables have additional shielding to protect against interference, making them suitable for environments with high electromagnetic noise.
  + *Coaxial Cables*: Coaxial cables consist of a central conductor surrounded by insulation, a metallic shield, and an outer insulating layer. They are often used for cable television and broadband internet connections.
  + *Fiber Optic Cables*: These cables use light to transmit data, providing high-speed and long-distance communication. They consist of a core (glass or plastic) surrounded by cladding and an outer protective layer.
  + *Connectors*: Various connectors are used with networking cables, including:
    - *RJ-45*: Commonly used for Ethernet connections, RJ-45 connectors are designed for twisted pair cables.
    - *BNC*: Used with coaxial cables, BNC connectors provide a secure connection for video and data transmission.
    - *LC, SC, ST*: These are types of connectors used with fiber optic cables, each with different shapes and specifications for connecting fiber optic strands.
  + *Shapes and Specifications*: Networking cables come in various shapes and specifications, including:
    - *Category 5e (Cat 5e)*: Supports speeds up to 1 Gbps and is commonly used for Ethernet networks.
    - *Category 6 (Cat 6)*: Supports higher speeds (up to 10 Gbps) and is suitable for more demanding applications.
    - *Category 6a (Cat 6a)*: An enhanced version of Cat 6, supporting longer distances and higher speeds.
    - *Single-mode Fiber*: Designed for long-distance communication, using a single light path.
    - *Multi-mode Fiber*: Suitable for shorter distances, using multiple light paths.
These cables and connectors play a crucial role in establishing reliable and efficient network connections, enabling data transmission between devices.
]

#question("Wireless Access Points")
#solution()[
Wireless Access Points (WAPs) are networking devices that allow wireless devices to connect to a wired network using Wi-Fi. They serve as a bridge between the wired network and wireless clients, enabling communication without the need for physical cables.
WAPs operate by broadcasting a wireless signal that devices can detect and connect to. They typically support various Wi-Fi standards (such as 802.11a/b/g/n/ac/ax) and can handle multiple connections simultaneously. WAPs can be standalone devices or integrated into routers, providing flexibility in network design.

When a wireless device connects to a WAP, it authenticates using security protocols (like WPA2 or WPA3) to ensure secure communication. Once connected, the WAP forwards data between the wireless device and the wired network, allowing for internet access and communication with other devices on the network.
]

#question("Proxy Servers and usages.")
#solution()[
A Proxy Server is an intermediary server that sits between a client and a destination server. It acts as a gateway, forwarding requests from clients to the appropriate server and returning the server's response back to the client. Proxy servers are used for various purposes, including:
+ *Anonymity*: By masking the client's IP address, proxy servers can help maintain user privacy and anonymity while browsing the internet.
+ *Content Filtering*: Organizations often use proxy servers to filter web content, blocking access to specific websites or types of content based on policies.
+ *Caching*: Proxy servers can cache frequently accessed web content, reducing bandwidth usage and improving response times for users.
+ *Load Balancing*: In high-traffic environments, proxy servers can distribute incoming requests across multiple servers, improving performance and reliability.
+ *Access Control*: Proxy servers can enforce access control policies, allowing or denying access to certain resources based on user credentials or IP addresses.
+ *Security*: They can provide an additional layer of security by inspecting incoming and outgoing traffic, protecting against malicious content and attacks.
Proxy servers can be configured to handle various protocols, including HTTP, HTTPS, and FTP, making them versatile tools for managing network traffic and enhancing security.
]

#question("Firewall and working principle")
#solution()[
A Firewall is a security device or software that monitors and controls incoming and outgoing network traffic based on predetermined security rules. Its primary purpose is to establish a barrier between a trusted internal network and untrusted external networks, such as the internet, to prevent unauthorized access and protect against cyber threats.
Firewalls can be hardware-based, software-based, or a combination of both. They work by inspecting data packets and applying rules to determine whether to allow or block the traffic. The working principle of a firewall involves:
+ *Packet Filtering*: The firewall examines each data packet's header information, such as source and destination IP addresses, port numbers, and protocols. It compares this information against a set of predefined rules to decide whether to allow or block the packet.
+ *Stateful Inspection*: This method tracks the state of active connections and makes decisions based on the context of the traffic. It allows the firewall to recognize established connections and permit related traffic while blocking unauthorized attempts.
+ *Proxy Service*: Some firewalls act as intermediaries, forwarding requests from clients to servers and vice versa. This allows the firewall to inspect the content of the traffic more thoroughly.
+ *Deep Packet Inspection (DPI)*: Advanced firewalls can analyze the content of data packets beyond just the header information. DPI can detect malicious content, application-level protocols, and enforce security policies based on the data's context.
+ *Logging and Alerts*: Firewalls maintain logs of network activity and can generate alerts for suspicious or unauthorized access attempts, helping administrators monitor and respond to potential threats.
Firewalls can be configured to allow or block specific types of traffic, enforce security policies, and protect against various threats, such as malware, unauthorized access, and denial-of-service attacks. They are a critical component of network security architecture.
]

