# Cyber security in New Space

Source: https://d-nb.info/1214051669/34

## Main Satellite Systems

- **TT&C**: Telemetry, Tracking and Command.

Receives and process uplink and downlink signals.

- **C&DH**: Command and Data Handling.

Validates, decodes and sends commands to other subsystems.

- **ADCS**: Altitude Determination and Control.

Controls the stabilization and orientation of the satellite.

Communications are done through RF waves, usually with MHz and GHz frequencies.

- **Uplink**: Communication Earth -> Satellite.
- **Downlink**: Communication Satellite -> Earth.

## Threats and Feasibility

### Ground Segment

Compromising the ground station is the easiest way to control a satellite as it
provides the equipment and software required to legitimately control and track
it.

- **Physical attacks**: Compromising physical security measures, e.g. gaining
  unauthorized access to a ground station and other physical IT assets.
- **Computer Network Exploitation**: The attacker compromises the network the
  ground station is connected to.
- **Cloud Infrastructure**: AWS and Google Cloud Platform are known to have
  outages or disruptions due to internal/external attacks.
- **Data Corruption/Modification**: A corrupted spacecraft command could result
  in catastrophic loss if either no action occurred or the wrong action was
  taken onboard.
- **Unpatched, Outdated, Legacy COTS**: If the system is not regularly updated,
  specially if vulnerabilities are discovered in it's software then it's exposed
  to be attacked with openly documented exploits.

### Communications

TT&C data communications can be compromised at any point in the satellite's life
cycle. Which may require the attacker to gather additional information and
conduct attacks on the ground segment.

- **Jamming**: Is the act of overpowering a RF signal of a particular frequency
  with a higher power on of the same frequency, in order to disrupt
  communications between the ground station and the satellite or vice versa.
  Requires:
  - Antena
  - Knowledge of the signal frequency.
  - Appropiate power level to transmit.
- **Eavesdropping**: Is the interception of data over a communication channel.
  For satellite and ground systems, this channel is an RF signal sent over the
  air, meaning **All communications are susceptible to interception**. With
  little to no encryption anyone can intercept this signals and retrieve the
  information.
- **Hijacking**: This could be altering the legitimate signals or changing them
  completely. COTS products can also be used for this purpose. Hijacking can be
  done by either overpowering the original signal at the same frequency or
  directly breaking into the transmitter and replacing the signal.
- **Spoofing**: Is the art of transmitting a signal, appearing to be legitimate
  but sending erroneous data for your own purposes. Even GPS signals can be
  spoofed with COTS components.

### Space Segment

Once in orbit, the contact with humans is limited but threats are still present!

In the case of using SDRs and digital processing software to provide radio
functionality, insufficient checks in radio frame processing and sending
malformed data packets could lead to buffer overflows and create DoS conditions
to jam communications. To confront this, satellites are deployed on missions
that require high dependability are equipped with embedded reliable operating
systems, which provide significant security guarantees against memory-abuse
attacks.

Taking control of a satellite to manipulate its system and/or orientation of
orbit can be a difficult task. Requiring:

- Significant knowledge to breach the TT&C links.
- Chaining several of the previous attacks.
- Software vulnerabilities and replaying of recorded transmissions can
  contribute to achieving control.

Although this attacks tend to be more difficult, not even NASA is exempt from
these kind of attacks.

### Regulatory Requirements

CNSS Policy 12 (CNSSP-12) strives to implement security practices into the
ground and space systems at the design phase. It enforces:

- Authentication
- NSA-Approved E2E encryption.
- Pseudorandom bit streams to achieve confidentiality, integrity and to remove
  predictability in messages.

Private satellites are not required to get a cyber security certificate but all
government systems are required to implement this policy.

## CubeSats

Specification developed by California Polytechnic State University and Stanford
University in 1999. Some common software used:

- XilKernel
- FreeRTOS
- KubOS

COTS products are essentially a black box to their users, often highly complex
and some even involving millions of lines of code. The usage of COTS should be
met with vigorous security analysis through black-box testing techniques like:

- fuzzing
- boundary vaue analysis
- equivalence partitioning

Or they can also be checked to compliance with known security guidelines (like
STIG and OWASP Top Ten).

The CubeSat Space Protocol (CSP) provides a simple design to achieve networking
and transport services. This protocol includes encryption and integrity features
with the use of the XTEA algorithm for encryption of packets and HMAC-SHA1 for
message authentication. This algorithms have known cryptographic weaknesses that
undermine these security features but are preferred for their lightweight
operation on CubeSat's embedded systems.

## Space Protocols and Their Security

- **Physical**: One of the most widely used satellite services is satellite TV.
  The majority of satellite TV broadcasts is achieved using DVB.
- **Optical**: Not suitable to use for Earth to satellite communications. Mostly
  used for inter-satellite communications.
- **Data Link**: For educational missions AX.25 protocol or similar amateur
  protocols can be successful, however organizations should adhere to a more
  advanced protocol such as CCSDS Space Data Link Security (SDLS) protocol.
  Still you need to protect against DDoS by jamming, traffic flow analysis and
  data substitution attack if the encryption doens't authenticate.
- **Networking and Transport Network**: Protocols such as Space Packet Protocol
  (SPP) and Delay Tolerant Network Bundle Protocol (DTN BP) allow for
  asynchronous data transfers.

## Considerations

- Introducing security into protocols adds overhead and memory usage. Depending
  on the mission this overhead may not be tolerable, so security and missions
  needs must be weighed in the design for an acceptable risk level.
- The use of security controls also facilitates another risk factor. An attack
  which aims to drain satellite's power, may lead to the satellite to turn off
  security protocols to prioritize power-saving efforts. **Even in satellite
  systems which use encryption, maintaining unencrypted connections for
  emergency situations such as tumbling is important**.
- Physical layer security achieved through information-theoretic models provides
  computationally unbounded security as opposed to cryptographic protocols.
- To protect the keys the satellites use we can use Physical Unclonable
  Functions (PUFs) and True Random Number Generators (TRNGs) to generate
  cryptographic keys and IDs used for device authentication, cloning prevention,
  generating sessions keys, etc.
- FGPAs and SDRs make it possible to re-program hardware and software in orbit
  easily. However, updates to software, firmware, hardware may introduce
  vulnerabilities, either inadvertently through a legitimate transmission of the
  update or through an attacker using this circumstance to purposefully inject
  flaws into the satellite. Use software attestation may be one way to resolve
  this issue.
- Operating Systems:
  - Real-time On-board Dependable Operating System (RODOS) is a real-time
    operating system for embedded systems and was designed for application
    domains demanding high dependability.
  - FreeRTOS achieves memory safety through an inbuilt software model checker
    called CBMC, the program reasons every execution path through a program on
    every input searching for assetion or memory violation.
  - MINIX3 and KasperskyOS achieves reliability through microkernel
    architecture. live updates, crash recovery of stateful services and
    virtualization are still being developed.
- Fault tolerant crypto-graphic mechanisms exist to account for Single-event
  upsets that may flip a bit on the OBC.
- Ground Segment attacks remain one of the easiest segments to attack, owing to
  the use of commonplace technologies across several industries and in consumer
  electronics, and to tried and tested CNE attacks which are successful in all
  sectors. Network and application security, user awareness and organizational
  security culture are ongoing problems. Phishing campaign which installed
  backdoor Trojan programs is a common attack vector to gain a foothold into a
  network.
- It's paramount that all COTS components come from trusted parties who are held
  to high security standards, including ground stations.
- The rise of COTS and SDR products available at affordable prices and the
  reductions of necessary specialist knowledge have increased the ease of such
  attacks. Technologies such as spread-spectrum and frequency hopping applied at
  the physical layer to make signals appear noisy or switch their frequency
  usage with pseudo-random sequences.
- An IDS or IPS should not be a replacement for secure design and development of
  satellite systems.
