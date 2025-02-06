# Project Vision

The goal of this project is to create a libre implementation of passwordless authentication for devices running GNU/Linux
based operating systems independent of specialised hardware.
The idea is to use a mobile device as a biometric authentication device.
Communication will be done over TCP on a local network or over Bluetooth.
The authenticating device must be equipped with a secure hardware authentication module
licensed with a libre software compatible license to secure the keys.
As a secondary objective, the project will aim to provide a lightweight and efficient FIDO UAT library that makers can
use to build secure authenticators using affordable components ex: Arduino Nano.

## Core Objectives

| Priority | Objective                                  | Success Metric                                |
|----------|--------------------------------------------|-----------------------------------------------|
| P0       | Replace password logins on Linux           | PAM module integration                        |
| P0       | Biometric, passworldess authentication     | FIDO certification compliance                 |
| P1       | Secure TCP of local network key exchange   | mTLS secured TCP connection                   |
| P1       | Secure bluetooth key exchange              | Encrypted BLE connection                      |
| P2       | Support deployment on custom devices       | Lightweight, efficient and flexible libraries |

## Governance

I (@pfouilloux) am the project's sole maintainer, organiser and main point of contact.
I reserve the right to veto proposals and make the final call on any decisions relating to the project.
Forking the project is encouraged so long as the terms of [license](LICENSE) are respected.
Any and all contributions are absolutely welcome and will be reviewed within a reasonable amount of time.
Please be aware that you will be required to assign all rights to your contributions to the project, however.
This is to protect the project and ensure its long-term sustainability.
Please see the [contributor's guide](Contribution.md) for more details.

In the event that the project takes off and builds a healthy community,
I fully intend to hand over the reins to a community driven steering committee of experienced and visionary contributors.
They will then guide the project and ensure its success.

- Policies will be documented in the [Policies](Policies) folder.
- The issue tracker, task board and roadmap are publicly available on github.
- Discussions are open on Github for community support as well.
- Technical decision records will be made available in the [Decisions](Decisions) folder.

Generally the intent is to be as open as possible to the community.
Though processes may be changed through a Policy document if necessary.
The only exception to the above policy of transparency is security vulnerabilies.
Informing users of the existence of a vulnerability
and any steps they can take to mitigate it is necessary and non-negotiable.
But detailed information about vulnerabilities and how to exploit them should be kept confidential until a patch can be
made available to protect users of the project.

## Out of scope

The following list of features is explicitly out of scope of the project.
Community forks are absolutely welcome and encouraged to provide them.
But it would take a very compelling argument to justify adding them to the project.

Note that this is not an exhaustive list.
The project's focus is on implementing biometric authentication on devices running GNU/Linux based OSes.
We'll want to remain focused on that objective or risk losing focus on the quality of the core experience.

### Closed platforms

This project will not support macOS, iOS, Windows, or other devices where there is no way to access the device's keychain
or hardware security module using components licensed with libre software compatible licenses.
This can be revisited if libre software that fullfills our security requirements becomes available to the community.

### Remote/Online Access

This project is not intended to function over the internet. The focus is
on close proximity authentication scenarios.
