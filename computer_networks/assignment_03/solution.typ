#import "./temp2.typ": *
#title("Assignment 3")

#question()[
  #align(center)[
    #table(columns: 5, inset: 8pt)[hostname][ipconfig][getmac][ping][arp][nbstate][route][path][pathping][netstat][tracert]
  ]
  Practice the commands mentioned in the above table and fill in the blanks. 
]

#smallcaps()[*Solution*]
#table(columns: (1fr, 3fr))[*Command*][*Working*][ping][Command is one of the most often used networking utilities for detecting devices on a network and for troubleshooting network problems.][hostname][command that displays the hostname of your machine][ipconfig][frequently used utility that is used for finding network information about your local machine like ip addresses, dns addresses etc.][nbstat][diagnostic tool for troubleshooting netbios problems][netstat][used for displaying information about tcp and udp connections and ports.][getmac][command that shows the mac address of your network interfaces][arp][for showing the address resolution cache. this command must be used with a
command line switch -a is the most common.][tracert][command prints the path. if all routers on the path are functional, this command
prints the full path.][path][command specifies the location where ms-dos should look when it executes a
command.][route][command allows you to make manual entries into the network routing tables.][pathping][after sending out packets from you to a given destination, it analyzes the route
taken and computes packet loss on a per-hop basis.]

