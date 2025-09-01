#import "temp2.typ": *

#title("Assignment 6")
#question()[
  Setup SSH and Telnet on a Router
]

#solution()[
  #align(center)[
    #image("assets/test.ong", width: 80%),
  ]

  + *Step 1*
    - Setup the connections as above
    - Connect Switch to Router via `FastEthernet0/0`
    - On the Router CLI, run the following commands
      #v(-2mm)
      ```
      enable
      configure terminal
      interface fastEthernet 0/0
      ip address 192.168.1.1 255.255.255.0
      no shutdown
      exit
      exit
      ```
  + *Step 2*
    - Setup the following IP configuration on PC1
      #v(-2mm)
      - IP Address: `192.168.1.10`
      - Subnet Mask: `255.255.255.0`
      - Default Gateway: `192.168.1.1`

  + *Step 3*
    - Setup `telnet` on the router by running the following commands
      #v(-2mm)
      ```
      terminal configure
      line vty 0 4
      password cisco
      login
      transport input telnet
      exit
      exit
      telnet 192.168.1.1
      ```

  + *Step 4*
    - Setup `ssh` on the router by running the following commands
    #v(-2mm)
    ```
    hostname R1
    ip domain-name example.com
    crypto key generate rsa (choose 1024 bits)
    username admin priveleges 15 secret admin123

    line vty 0 4
    transport input ssh
    login local
    exit
    exit
    ```
]
